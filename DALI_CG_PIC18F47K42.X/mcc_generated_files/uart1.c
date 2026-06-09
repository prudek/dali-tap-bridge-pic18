/**
  UART1 Generated Driver File

  @Company
    Microchip Technology Inc.

  @File Name
    uart1.c

  @Summary
    This is the generated driver implementation file for the UART1 driver using PIC10 / PIC12 / PIC16 / PIC18 MCUs

  @Description
    This header file provides implementations for driver APIs for UART1.
    Generation Information :
        Product Revision  :  PIC10 / PIC12 / PIC16 / PIC18 MCUs  - 1.45
        Device            :  PIC18F45K42
        Driver Version    :  1.00
    The generated drivers are tested against the following:
        Compiler          :  XC8 1.35
        MPLAB             :  MPLAB X 3.40
*/

/*
    (c) 2016 Microchip Technology Inc. and its subsidiaries. You may use this
    software and any derivatives exclusively with Microchip products.

    THIS SOFTWARE IS SUPPLIED BY MICROCHIP "AS IS". NO WARRANTIES, WHETHER
    EXPRESS, IMPLIED OR STATUTORY, APPLY TO THIS SOFTWARE, INCLUDING ANY IMPLIED
    WARRANTIES OF NON-INFRINGEMENT, MERCHANTABILITY, AND FITNESS FOR A
    PARTICULAR PURPOSE, OR ITS INTERACTION WITH MICROCHIP PRODUCTS, COMBINATION
    WITH ANY OTHER PRODUCTS, OR USE IN ANY APPLICATION.

    IN NO EVENT WILL MICROCHIP BE LIABLE FOR ANY INDIRECT, SPECIAL, PUNITIVE,
    INCIDENTAL OR CONSEQUENTIAL LOSS, DAMAGE, COST OR EXPENSE OF ANY KIND
    WHATSOEVER RELATED TO THE SOFTWARE, HOWEVER CAUSED, EVEN IF MICROCHIP HAS
    BEEN ADVISED OF THE POSSIBILITY OR THE DAMAGES ARE FORESEEABLE. TO THE
    FULLEST EXTENT ALLOWED BY LAW, MICROCHIP'S TOTAL LIABILITY ON ALL CLAIMS IN
    ANY WAY RELATED TO THIS SOFTWARE WILL NOT EXCEED THE AMOUNT OF FEES, IF ANY,
    THAT YOU HAVE PAID DIRECTLY TO MICROCHIP FOR THIS SOFTWARE.

    MICROCHIP PROVIDES THIS SOFTWARE CONDITIONALLY UPON YOUR ACCEPTANCE OF THESE
    TERMS.
*/

/*
  Project adaptation:
    UART1 remains Microchip/MCC-derived. Local changes in this branch are limited
    to DALI Control Device mode setup and idle TX release for the sniffer/CD
    terminal bridge profile.
*/

/**
  Section: Included Files
*/
#include <xc.h>
#include "uart1.h"

#include "dali_cg_frameHandler.h"

/**
  Section: Macro Declarations
*/
#define UART1_TX_BUFFER_SIZE 8
#define UART1_RX_BUFFER_SIZE 8

/**
  Section: Global Variables
*/
static uint8_t uart1TxHead = 0;
static uint8_t uart1TxTail = 0;
static uint8_t uart1TxBuffer[UART1_TX_BUFFER_SIZE];
volatile uint8_t uart1TxBufferRemaining;

static uint8_t uart1RxHead = 0;
static uint8_t uart1RxTail = 0;
static uint8_t uart1RxBuffer[UART1_RX_BUFFER_SIZE];
volatile uint8_t uart1RxCount;

/**
  Section: UART1 APIs
*/

void UART1_Initialize(void)
{
	// Disable interrupts before changing states
    PIE3bits.U1RXIE = 0;
    PIE3bits.U1TXIE = 0;

    // Set the UART1 module to the options selected in the user interface.

    // RXB disabled; 
    U1RXB = 0x00;

    // RXCHK disabled; 
    U1RXCHK = 0x00;

    // TXB disabled; 
    U1TXB = 0x00;

    // TXCHK disabled; 
    U1TXCHK = 0x00;

    // P1L 22 half-bit periods (DALI-recommended minimum inter-frame idle); 
    U1P1L = 0x16;

    // P1H 0; 
    U1P1H = 0x00;

#if defined(DALI_ROLE_CONTROL_DEVICE)
    // P2L 16 half-bit periods (forward/backward frame delimiter in CD mode);
    U1P2L = 0x10;
#else
    // P2L 0; 
    U1P2L = 0x00;
#endif

    // P2H 0; 
    U1P2H = 0x00;

    // P3L 0; 
    U1P3L = 0x00;

    // P3H 0; 
    U1P3H = 0x00;

    // BRGS high speed; RXEN enabled; TXEN enabled; ABDEN disabled;
    // MODE is selected at compile-time to match role split:
    // - Control Device build: DALI Control Device mode
    // - Control Gear build:   DALI Control Gear mode
#if defined(DALI_ROLE_CONTROL_DEVICE)
    U1CON0 = 0xB8;
#else
    U1CON0 = 0xB9;
#endif

    // RXBIMD Set RXBKIF on rising RX input; BRKOVR disabled; WUE disabled; SENDB disabled; ON enabled; 
    U1CON1 = 0x80;

    // FLO off; C0EN Checksum Mode 0; RUNOVF RX input shifter stops all activity;
    // STP Transmit 2 Stop bits, receiver verifies first and second Stop bits.
    // TX/RX polarity is selected at compile-time for CD/CG role split.
#if defined(DALI_ROLE_CONTROL_DEVICE)
    // TXPOL inverted; RXPOL inverted
    U1CON2 = 0x64;
#else
    // TXPOL inverted; RXPOL inverted
    U1CON2 = 0x64;
#endif

    // BRGL 10; 
    U1BRGL = 0x0A;

    // BRGH 26; 
    U1BRGH = 0x1A;

    // STPMD in middle of first Stop bit; TXWRE No error; 
    U1FIFO = 0x00;

    // ABDIF Auto-baud not enabled or not complete; WUIF WUE not enabled by software; ABDIE disabled; 
    U1UIR = 0x00;

    // ABDOVF Not overflowed; TXCIF 0; RXBKIF No Break detected; RXFOIF not overflowed; CERIF No Checksum error; 
    U1ERRIR = 0x00;

    // TXCIE disabled; FERIE disabled; TXMTIE disabled; ABDOVE disabled; CERIE disabled; RXFOIE disabled; PERIE disabled; RXBKIE disabled; 
    U1ERRIE = 0x00;


    // initializing the driver state
    uart1TxHead = 0;
    uart1TxTail = 0;
   	uart1TxBufferRemaining = sizeof(uart1TxBuffer);
    uart1RxHead = 0;
    uart1RxTail = 0;
    uart1RxCount = 0;

#if defined(DALI_ROLE_CONTROL_DEVICE)
    // Keep DALI TX physically released in idle; forward TX path enables it
    // only for the duration of an actual frame.
    U1CON0bits.TXEN = 0u;
#endif

    // enable receive interrupt
    PIE3bits.U1RXIE = 1;
}

uint8_t UART1_Read(void)
{
    return U1RXB;
    }

void UART1_Write(uint8_t txData)
{
    U1TXB = txData;
}

void UART1_Receive_ISR(void)
{
    dali_interruptRX();
}



/**
  End of File
*/
