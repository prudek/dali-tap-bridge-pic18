/*
 * Project-local source for the DALI sniffer / Control Device terminal bridge.
 * Repository license and third-party notice policy are finalized separately.
 */

#ifndef BOARD_DIAG_H
#define BOARD_DIAG_H

#include <stdint.h>

typedef enum
{
    BOARD_DIAG_LED_MODE_OFF = 0,
    BOARD_DIAG_LED_MODE_ON,
    BOARD_DIAG_LED_MODE_HEARTBEAT
} board_diag_led_mode_t;

void board_diag_init(void);
void board_diag_set_led_mode(uint8_t mode);
uint8_t board_diag_get_led_mode(void);
void board_diag_set_dali_arc_level(uint8_t level);
uint32_t board_diag_get_uptime_ms(void);
uint32_t board_diag_get_uptime_ms_isr(void);
void board_diag_tick1ms(void);

#endif
