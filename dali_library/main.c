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
 *                           main.c
 *
 * About:
 *  Example application for DALI Control Gear, using the Microchip DALI library.
 *
 * Hardware:
 *  Microchip Lighting Communications Main Board (DM160214) +
 *  Microchip DALI Adapter (AC160214-1)
 *
 *
 * Author            Date                Comment
 *~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 * Shaima Husain     15 February 2012
 * Michael Pearce    09 May 2012         Update to use the newer API
 * Mihai Cuciuc      28 November 2013    Changed application to use the new
 *                                       DALI Control Gear Library
 *
 * Project adaptation:
 *  This branch adapts the Microchip-derived example entrypoint into a minimal
 *  DALI sniffer / Control Device terminal bridge profile.
 ******************************************************************************/

#include "mcc.h"

#include "board_diag.h"
#include "debug_console.h"
#include "dali_diag.h"

#include "dali_cg_frameHandler.h"

#define BOARD_DIAG_LED_ON_TIME_MS 100u
#define BOARD_DIAG_LED_PERIOD_MS  500u

static volatile uint32_t boardDiagUptimeMs;
static volatile uint16_t boardDiagHeartbeatMs;
static volatile uint16_t boardDiagLedPdmAccumulator;
static volatile uint8_t boardDiagDaliArcLevel;
static volatile board_diag_led_mode_t boardDiagLedMode = BOARD_DIAG_LED_MODE_HEARTBEAT;

static void board_diag_apply_led_state(uint8_t ledOn);

void board_diag_init(void)
{
    boardDiagUptimeMs = 0;
    boardDiagHeartbeatMs = 0;
    boardDiagLedPdmAccumulator = 0;
    boardDiagDaliArcLevel = 0;
    boardDiagLedMode = BOARD_DIAG_LED_MODE_HEARTBEAT;

    ANSELEbits.ANSELE0 = 0;
    TRISEbits.TRISE0 = 0;
    LATEbits.LATE0 = 1;
}

void board_diag_set_led_mode(uint8_t mode)
{
    if(mode > BOARD_DIAG_LED_MODE_HEARTBEAT)
    {
        mode = BOARD_DIAG_LED_MODE_HEARTBEAT;
    }

    di();
    boardDiagLedMode = (board_diag_led_mode_t)mode;
    boardDiagHeartbeatMs = 0;
    boardDiagLedPdmAccumulator = 0;
    ei();

    if(mode == BOARD_DIAG_LED_MODE_OFF)
    {
        board_diag_apply_led_state((uint8_t)(boardDiagDaliArcLevel != 0u));
    }
    else if(mode == BOARD_DIAG_LED_MODE_ON)
    {
        board_diag_apply_led_state(1);
    }
}

uint8_t board_diag_get_led_mode(void)
{
    return (uint8_t)boardDiagLedMode;
}

void board_diag_set_dali_arc_level(uint8_t level)
{
    di();
    boardDiagDaliArcLevel = level;
    ei();

    if(boardDiagLedMode == BOARD_DIAG_LED_MODE_OFF)
    {
        board_diag_apply_led_state((uint8_t)(level != 0u));
    }
}

uint32_t board_diag_get_uptime_ms(void)
{
    uint32_t uptime;

    di();
    uptime = boardDiagUptimeMs;
    ei();

    return uptime;
}

uint32_t board_diag_get_uptime_ms_isr(void)
{
    return boardDiagUptimeMs;
}

void board_diag_tick1ms(void)
{
    boardDiagUptimeMs++;

    if(boardDiagLedMode == BOARD_DIAG_LED_MODE_HEARTBEAT)
    {
        boardDiagHeartbeatMs++;
        if(boardDiagHeartbeatMs >= BOARD_DIAG_LED_PERIOD_MS)
        {
            boardDiagHeartbeatMs = 0;
        }

        if(boardDiagHeartbeatMs < BOARD_DIAG_LED_ON_TIME_MS)
        {
            board_diag_apply_led_state(1);
        }
        else
        {
            board_diag_apply_led_state(0);
        }
    }
    else if(boardDiagLedMode == BOARD_DIAG_LED_MODE_OFF)
    {
        if(boardDiagDaliArcLevel >= 254u)
        {
            board_diag_apply_led_state(1);
        }
        else if(boardDiagDaliArcLevel == 0u)
        {
            board_diag_apply_led_state(0);
        }
        else
        {
            boardDiagLedPdmAccumulator = (uint16_t)(boardDiagLedPdmAccumulator + boardDiagDaliArcLevel);
            if(boardDiagLedPdmAccumulator >= 254u)
            {
                boardDiagLedPdmAccumulator = (uint16_t)(boardDiagLedPdmAccumulator - 254u);
                board_diag_apply_led_state(1);
            }
            else
            {
                board_diag_apply_led_state(0);
            }
        }
    }
}

static void board_diag_apply_led_state(uint8_t ledOn)
{
    /* Curiosity Nano LED0 on RE0 is active-low. */
    if(ledOn != 0u)
    {
        LATEbits.LATE0 = 0;
    }
    else
    {
        LATEbits.LATE0 = 1;
    }
}

/** \brief Application entry point.
 *
 * This profile implements a DALI sniffer with minimal Control Device transmit
 * commands exposed through the UART2 terminal.
 */
void main()
{
#if DEBUG_CONSOLE_SMOKE_TEST
    SYSTEM_Initialize();
    board_diag_init();
    dali_diag_init();
    debug_console_initialize();

    INTERRUPT_GlobalInterruptEnable();

    while (1)
    {
        debug_console_mark_main_loop();
        debug_console_service();
    }
#else
    SYSTEM_Initialize();
    board_diag_init();
    dali_diag_init();
    debug_console_initialize();
    idali_initFrameHandler();

    INTERRUPT_GlobalInterruptEnable();

    /* Enable peripheral interrupt on UART RX. */
    PIE3bits.U1RXIE = 1;

    debug_console_set_dali_initialized(1u);
    debug_console_write_banner();

    while (1)
    {
        debug_console_mark_main_loop();
        debug_console_service();
    }
#endif
}
/**
 End of File
*/
