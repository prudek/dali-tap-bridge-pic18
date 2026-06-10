/*
 * SPDX-License-Identifier: AGPL-3.0-or-later
 * Copyright (c) 2026 prudek
 *
 * Project-local terminal command interface for the DALI sniffer / Control
 * Device bridge.
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
