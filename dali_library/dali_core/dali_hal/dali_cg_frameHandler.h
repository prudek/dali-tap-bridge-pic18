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
 *                           dali_cg_hardware.h
 *
 * About:
 *  Hardware definition layer for the DALI library example.
 *
 * Hardware:
 *  Microchip Lighting Communications Main Board (DM160214) +
 *  Microchip DALI Adapter (AC160214-1)
 *
 * Author            Date                Comment
 *~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 * Mihai Cuciuc      28 November 2013    Changed application to use the new
 *                                       DALI Control Gear Library
 *
 * Project adaptation:
 *  This branch keeps the Microchip-derived frame handler boundary while using
 *  it for raw DALI sniffer and minimal Control Device transmit behavior.
 ******************************************************************************/


#ifndef DALI_CG_HARDWARE_H
#define	DALI_CG_HARDWARE_H

#include <stdint.h>


/** \brief Check whether the DALI line is low or not.
 *
 * This is used to detect cable disconnection (in order to set the lamp power
 * level to system failure level)
 *
 * @return 1 if line is low, 0 otherwise.
 */
inline uint8_t dalihw_isDALILineLow(void);


/** \brief Initialise DALI protocol state machine.
 * 
 * Clears all flags, and sets up the correct external interrupt edge that should
 * trigger an interrupt.
 */
inline void idali_initFrameHandler(void);



/** \brief API Call: The application should call this function for every Te
 * Timer interrupt.
 *
 * This function, together with the one that handles the receive interrupt on 
 * DALI_RX run the mechanism that handle the DALI data transmission and reception.
 */
void dali_interruptTeTimer(void);


/** \brief Handle the receive interrupt on the DALI bus.
 *
 * This function, together with the one that handles the frame timings runs the
 * mechanism that handle the DALI data transmission and reception.
 */
void dali_interruptRX(void);

/** \brief Send a 16-bit forward frame.
 *
 * The function returns 1 on successful enqueue/transmission start and 0 if the
 * line is currently busy.
 *
 * @param addressByte DALI forward-frame address byte
 * @param dataByte DALI forward-frame data byte
 * @return 1 on success, 0 otherwise
 */
uint8_t idali_sendForwardFrame16(uint8_t addressByte, uint8_t dataByte);

/** \brief Send a raw 24-bit forward frame.
 *
 * @param byte0 First byte transmitted on the bus
 * @param byte1 Second byte transmitted on the bus
 * @param byte2 Third byte transmitted on the bus
 * @return 1 on success, 0 otherwise
 */
uint8_t idali_sendForwardFrame24(uint8_t byte0, uint8_t byte1, uint8_t byte2);




#endif	/* DALI_CG_HARDWARE_H */

