/**
  Generated Pin Manager File

  Company:
    Microchip Technology Inc.

  File Name:
    pin_manager.c

  Summary:
    This is the Pin Manager file generated using MPLAB(c) Code Configurator

  Description:
    This header file provides implementations for pin APIs for all pins selected in the GUI.
    Generation Information :
        Product Revision  :  MPLAB(c) Code Configurator - 4.26.2
        Device            :  PIC18F45K42
        Driver Version    :  1.02
    The generated drivers are tested against the following:
        Compiler          :  XC8 1.35
        MPLAB             :  MPLAB X 3.40

    Copyright (c) 2013 - 2015 released Microchip Technology Inc.  All rights reserved.

    Microchip licenses to you the right to use, modify, copy and distribute
    Software only when embedded on a Microchip microcontroller or digital signal
    controller that is integrated into your product or third party product
    (pursuant to the sublicense terms in the accompanying license agreement).

    You should refer to the license agreement accompanying this Software for
    additional information regarding your rights and obligations.

    SOFTWARE AND DOCUMENTATION ARE PROVIDED "AS IS" WITHOUT WARRANTY OF ANY KIND,
    EITHER EXPRESS OR IMPLIED, INCLUDING WITHOUT LIMITATION, ANY WARRANTY OF
    MERCHANTABILITY, TITLE, NON-INFRINGEMENT AND FITNESS FOR A PARTICULAR PURPOSE.
    IN NO EVENT SHALL MICROCHIP OR ITS LICENSORS BE LIABLE OR OBLIGATED UNDER
    CONTRACT, NEGLIGENCE, STRICT LIABILITY, CONTRIBUTION, BREACH OF WARRANTY, OR
    OTHER LEGAL EQUITABLE THEORY ANY DIRECT OR INDIRECT DAMAGES OR EXPENSES
    INCLUDING BUT NOT LIMITED TO ANY INCIDENTAL, SPECIAL, INDIRECT, PUNITIVE OR
    CONSEQUENTIAL DAMAGES, LOST PROFITS OR LOST DATA, COST OF PROCUREMENT OF
    SUBSTITUTE GOODS, TECHNOLOGY, SERVICES, OR ANY CLAIMS BY THIRD PARTIES
    (INCLUDING BUT NOT LIMITED TO ANY DEFENSE THEREOF), OR OTHER SIMILAR COSTS.

*/

#include <xc.h>
#include "pin_manager.h"
#include "stdbool.h"



void PIN_MANAGER_Initialize(void)
{
    /**
    LATx registers
    */   
    LATE = 0x01;    
    LATD = 0x00;    
    LATA = 0x00;    
    LATB = 0x00;    
    LATC = 0x00;    

    /**
    TRISx registers
    */    
    TRISE = 0x06;
    TRISA = 0x0B;
    TRISB = 0xB4;
    TRISC = 0xDD;
    TRISD = 0xFA;

    /**
    ANSELx registers
    */   
    ANSELE = 0x06;
    ANSELD = 0xF8;
    ANSELC = 0x83;
    ANSELB = 0x4C;
    ANSELA = 0x0A;

    /**
    WPUx registers
    */ 
    WPUA = 0x01;
    WPUB = 0x80;
    WPUC = 0x02;
    WPUD = 0x00;
    WPUE = 0x00;

    /**
    ODx registers
    */   
    ODCONE = 0x00;
    ODCONA = 0x00;
    ODCONB = 0x00;
    ODCONC = 0x00;
    ODCOND = 0x00;
    


   
    
    
    bool state = (unsigned char)GIE;
    GIE = 0;
    PPSLOCK = 0x55;
    PPSLOCK = 0xAA;
    PPSLOCKbits.PPSLOCKED = 0x00; // unlock PPS

    RD2PPS = 0x03;   //RD2->CLC3:CLC3;
    CLCIN0PPSbits.CLCIN0PPS = 0x00;   //RA0->CLC3:CLCIN0;
    RC1PPS = 0x01;   //RC1->CLC1:CLC1;
    SPI1SCKPPSbits.SPI1SCKPPS = 0x08;   //RB0->SPI1:SCK1;
    RA2PPS = 0x0D;   //RA2->PWM5:PWM5;
    SPI1SDIPPSbits.SPI1SDIPPS = 0x14;   //RC4->SPI1:SDI1;
    U1CTSPPSbits.U1CTSPPS = 0x16;   //RC6->UART1:CTS1;
    RB1PPS = 0x1F;   //RB1->SPI1:SDO1;
    T4INPPSbits.T4INPPS = 0x16;   //RC6->TMR4:T4IN;
    RB0PPS = 0x1E;   //RB0->SPI1:SCK1;
    U1RXPPSbits.U1RXPPS = 0x13;   //RC3->UART1:RX1;
    U2RXPPSbits.U2RXPPS = 0x19;   //RD1->UART2:RX2;
    RD0PPS = 0x16;   //RD0->UART2:TX2;
    RC2PPS = 0x13;   //RC2->UART1:TX1;
    ADACTPPSbits.ADACTPPS = 0x0C;   //RB4->ADCC:ADACT;
    T6INPPSbits.T6INPPS = 0x0F;   //RB7->TMR6:T6IN;

    PPSLOCK = 0x55;
    PPSLOCK = 0xAA;
    PPSLOCKbits.PPSLOCKED = 0x01; // lock PPS

    GIE = state;
}       

void PIN_MANAGER_IOC(void)
{   

}

/**
 End of File
*/
