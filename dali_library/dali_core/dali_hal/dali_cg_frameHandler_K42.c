/********************************************************************
 *
 * Copyright (C) 2014 Microchip Technology Inc. and its subsidiaries
 * (Microchip).  All rights reserved.
 *
 * You are permitted to use the software and its derivatives with Microchip
 * products. See the license agreement accompanying this software, if any, for
 * more info about your rights and obligations.
 *
 * SOFTWARE AND DOCUMENTATION ARE PROVIDED "AS IS" WITHOUT WARRANTY OF ANY KIND,
 * EITHER EXPRESS OR IMPLIED, INCLUDING WITHOUT LIMITATION, ANY WARRANTY OF
 * MERCHANTABILITY, TITLE, NON-INFRINGEMENT AND FITNESS FOR A PARTICULAR
 * PURPOSE. IN NO EVENT SHALL MICROCHIP, SMSC, OR ITS LICENSORS BE LIABLE OR
 * OBLIGATED UNDER CONTRACT, NEGLIGENCE, STRICT LIABILITY, CONTRIBUTION, BREACH
 * OF WARRANTY, OR OTHER LEGAL EQUITABLE THEORY FOR ANY DIRECT OR INDIRECT
 * DAMAGES OR EXPENSES INCLUDING BUT NOT LIMITED TO ANY INCIDENTAL, SPECIAL,
 * INDIRECT OR CONSEQUENTIAL DAMAGES, OR OTHER SIMILAR COSTS. To the fullest
 * extend allowed by law, Microchip and its licensors liability will not exceed
 * the amount of fees, if any, that you paid directly to Microchip to use this
 * software.
 *************************************************************************
 *
 *                           dali_cg_hardware.c
 *
 * About:
 *  Hardware definition layer for the DALI example.
 *
 * Hardware:
 *  Microchip Lighting Communications Main Board (DM160214) +
 *  Microchip DALI Adapter (AC160214-1)
 *
 * Author            Data                Comment
 *~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 * Mihai Cuciuc      28 November 2013    Changed application to use the new
 *                                       DALI Control Gear Library
 *
 * Project adaptation:
 *  This branch keeps the Microchip-derived frame handler boundary while using
 *  it for raw DALI sniffer and minimal Control Device transmit behavior.
 ******************************************************************************/


#include "pin_manager.h"
#include "tmr2.h"
#include "uart1.h"
#include "board_diag.h"
#include "dali_diag.h"

#include "dali_cg_frameHandler.h"


/**
  Section: Macro Declarations
*/

#define DALI_RX_BUFFER_SIZE 3



    
/**
  Section: Data Type Definitions
*/
// The state machine processes the forward frame according to these flags.
typedef union
{
    uint8_t All;
    struct
    {
        unsigned oneByteForwardFrameReceived            : 1;
        unsigned twoByteForwardFrameReceived            : 1;
        unsigned threeByteForwardFrameReceived          : 1;
        unsigned backwardFrameSent                      : 1;
        unsigned stopConditionTimeElapsed               : 1;
        unsigned frameError                             : 1;
        unsigned                                        : 2;
    };
}tdali_flags_frame;


/**********************DALI Protocol variables*********************************/

uint8_t DALIRxBuffer[DALI_RX_BUFFER_SIZE];


/** \brief Frame reception flags. */
static volatile tdali_flags_frame daliFrameFlags;


/** \brief This variable is used to keep track of bytes received in forward frame. */
static volatile uint8_t rxBufferCount;


/** \brief Data that has been received so far. */
static volatile uint16_t rxPacket;

static uint8_t idali_sendForwardFrameBytes(const uint8_t *bytes,
                                           uint8_t byteCount,
                                           uint32_t frameWindowMs);

/**********************DALI Frame Handler variables*(END)***************************/



/**********************Local function definitions******************************/

/** \brief Clear Te Timer interrupt flag.
 *
 */
inline void dalihw_teTimerClearInterrupt(void);


/** \brief Check if the Te Timer interrupt triggered.
 *
 * This function just checks if the IF and IE bits for the Te Timer are 1.
 *
 * @return 1 if Te Timer triggered, 0 otherwise.
 */
inline uint8_t dalihw_teTimerInterruptTriggered(void);


/** \brief Initialise Te Timer.
 *
 * In this application Timer 1 is used as the Te Timer. This function configures
 * it to run at 2MHz and enables its interrupt.
 */
inline void dalihw_teTimerInit(void);


/** \brief Turn on Te Timer.
 *
 */
inline void dalihw_teTimerOn(void);


/** \brief Turn off Te Timer.
 *
 */
inline void dalihw_teTimerOff(void);


/** \brief Write a byte to the UART.
 *
 * @param txData Value to be written to the UART.
 */
inline void dalihw_writeByte(uint8_t txData);

/**********************Local function definitions*(END)************************/


/**********************Function implementations********************************/


inline void dalihw_teTimerOn(void)
{
    TMR2_Start();
}


inline void dalihw_teTimerOff(void)
{
    TMR2_Stop();
}


inline void dalihw_writeByte(uint8_t txData)
{
    UART1_Write(txData);
}


inline uint8_t dalihw_readByte(void)
{
    return UART1_Read();
}


inline uint8_t dalihw_isDALILineLow(void) // Used to detect whether a forward frame is being received
{
    return (PORTCbits.RC3 == DALI_LO);
}



inline void idali_initFrameHandler(void)
{
    daliFrameFlags.All = 0;
    rxBufferCount = 0;
    rxPacket = 0;
}


void dali_interruptTeTimer(void)
{
    uint32_t uptimeMs;

    uptimeMs = board_diag_get_uptime_ms_isr();

    if(rxBufferCount == 2)
    {
        // 16-bit forward frame observed on the bus. In this sniffer/control
        // device profile it is recorded only; no Control Gear state machine is
        // linked or invoked.
        rxBufferCount = 0;
        daliFrameFlags.twoByteForwardFrameReceived = 1;
        dalihw_teTimerOff();
        rxPacket = ((uint16_t)DALIRxBuffer[0] << 8) | (uint16_t)DALIRxBuffer[1];
        dali_diag_on_forward_frame(rxPacket, uptimeMs);
    }
    else if(rxBufferCount >= 3)
    {
        uint32_t forward24;

        // 24-bit forward frame observed on the bus. Keep raw visibility for
        // sniffer tooling without interpreting the payload.
        rxBufferCount = 0;
        daliFrameFlags.threeByteForwardFrameReceived = 1;
        dalihw_teTimerOff();
        forward24 = ((uint32_t)DALIRxBuffer[0] << 16) |
                    ((uint32_t)DALIRxBuffer[1] << 8) |
                    (uint32_t)DALIRxBuffer[2];
        dali_diag_on_three_byte_frame(forward24, uptimeMs);
    }
    else
    {
        //Single byte forward frame can mean one of the following:
        // 1. The backward frame sent by the Control Gear is being echoed back. 
        // This occurs since there's a layer of inversion in the optocouplers' 
        // transistors on the DALI Adapter board. Therefore, the data sent on 
        // the DALI_TX line is always echoed back on the DALI_RX line and 
        // consequently received back by the Control Gear and can be interpreted 
        // as a byte in the forward frame. However, this byte needs to be ignored  
        // as it is not a part of the actual forward frame.
        // 2. Since reception of the actual forward frame is done byte-wise, 
        // this can be the first byte of the forward frame. However, triggering
        // of the interrupt indicates that after reception of the first byte in 
        // the forward frame, the next byte has not been received even after the
        // stop condition time has elapsed. Therefore, this byte needs to be   
        // discarded and we need to flag an error.
        uint8_t singleByteData;

        singleByteData = DALIRxBuffer[0];
        rxBufferCount = 0;
        daliFrameFlags.frameError = 1;
        dalihw_teTimerOff();
        dali_diag_on_single_byte_timeout(singleByteData, uptimeMs);
    }
}


void dali_interruptRX(void)
{
    uint8_t rxData;

    rxData = dalihw_readByte();
    if(rxBufferCount < DALI_RX_BUFFER_SIZE)
    {
        DALIRxBuffer[rxBufferCount] = rxData;
    }
    rxBufferCount++;
    dali_diag_on_rx_byte(rxData, board_diag_get_uptime_ms_isr());
    dalihw_teTimerOn();
}


uint8_t idali_sendForwardFrame16(uint8_t addressByte, uint8_t dataByte)
{
#if defined(DALI_ROLE_CONTROL_DEVICE)
    uint8_t bytes[2];

    bytes[0] = addressByte;
    bytes[1] = dataByte;
    return idali_sendForwardFrameBytes(bytes, 2u, 40u);
#else
    (void)addressByte;
    (void)dataByte;
    return 0u;
#endif
}

uint8_t idali_sendForwardFrame24(uint8_t byte0, uint8_t byte1, uint8_t byte2)
{
#if defined(DALI_ROLE_CONTROL_DEVICE)
    uint8_t bytes[3];

    bytes[0] = byte0;
    bytes[1] = byte1;
    bytes[2] = byte2;
    return idali_sendForwardFrameBytes(bytes, 3u, 60u);
#else
    (void)byte0;
    (void)byte1;
    (void)byte2;
    return 0u;
#endif
}

static uint8_t idali_sendForwardFrameBytes(const uint8_t *bytes,
                                           uint8_t byteCount,
                                           uint32_t frameWindowMs)
{
#if defined(DALI_ROLE_CONTROL_DEVICE)
    uint8_t index;
    uint32_t frame;
    uint32_t waitStartedMs;

    if((bytes == 0) || (byteCount < 2u) || (byteCount > 3u))
    {
        return 0u;
    }

    if(dalihw_isDALILineLow() != 0u)
    {
        return 0u;
    }

    frame = ((uint32_t)bytes[0] << 8) | (uint32_t)bytes[1];
    if(byteCount == 3u)
    {
        frame = (frame << 8) | (uint32_t)bytes[2];
        dali_diag_on_forward24_frame_tx(frame, board_diag_get_uptime_ms());
    }
    else
    {
        dali_diag_on_forward_frame_tx((uint16_t)frame, board_diag_get_uptime_ms());
    }

    // Enable transmitter only for the frame window to avoid holding the bus
    // active in idle due DALI UART idle polarity.
    U1CON0bits.TXEN = 1u;
    TRISCbits.TRISC2 = 0u;

    for(index = 0u; index < byteCount; index++)
    {
        dalihw_writeByte(bytes[index]);

        if(index < (byteCount - 1u))
        {
            waitStartedMs = board_diag_get_uptime_ms();
            while((PIR3bits.U1TXIF == 0u) &&
                  ((board_diag_get_uptime_ms() - waitStartedMs) < 20u))
            {
            }
            if(PIR3bits.U1TXIF == 0u)
            {
                U1CON0bits.TXEN = 0u;
                TRISCbits.TRISC2 = 1u;
                return 0u;
            }
        }
    }

    // TXMTIF/TXIF can be true before the full DALI waveform has left the pin.
    // Keep TX enabled for the physical frame window before releasing RC2.
    waitStartedMs = board_diag_get_uptime_ms();
    while((board_diag_get_uptime_ms() - waitStartedMs) < frameWindowMs)
    {
    }

    if(U1ERRIRbits.TXMTIF == 0u)
    {
        U1CON0bits.TXEN = 0u;
        TRISCbits.TRISC2 = 1u;
        return 0u;
    }

    // Release the bus immediately after the frame has physically left UART.
    TRISCbits.TRISC2 = 1u;
    U1CON0bits.TXEN = 0u;

    return 1u;
#else
    (void)bytes;
    (void)byteCount;
    (void)frameWindowMs;
    return 0u;
#endif
}


/**********************Function implementations*(END)**************************/
