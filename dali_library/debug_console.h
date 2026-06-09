/*
 * Project-local source for the DALI sniffer / Control Device terminal bridge.
 * Repository license and third-party notice policy are finalized separately.
 */

#ifndef DEBUG_CONSOLE_H
#define DEBUG_CONSOLE_H

#include <stdint.h>

#define DEBUG_CONSOLE_SMOKE_TEST 0u

void debug_console_initialize(void);
void debug_console_set_dali_initialized(uint8_t initialized);
void debug_console_mark_main_loop(void);
void debug_console_write_banner(void);
void debug_console_service(void);

#endif /* DEBUG_CONSOLE_H */
