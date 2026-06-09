/*
 * Project-local source for the DALI sniffer / Control Device terminal bridge.
 * Repository license and third-party notice policy are finalized separately.
 */

#ifndef DEBUG_UART2_H
#define DEBUG_UART2_H

#include <stdint.h>

void debug_uart2_initialize(void);
void debug_uart2_service(void);
void debug_uart2_receive_isr(void);

void debug_uart2_write_char(char c);
void debug_uart2_write_string(const char *text);
void debug_uart2_write_blocking_char(uint8_t value);
uint8_t debug_uart2_read_byte(uint8_t *value);

#endif /* DEBUG_UART2_H */
