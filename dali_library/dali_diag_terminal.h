/*
 * SPDX-License-Identifier: AGPL-3.0-or-later
 * Copyright (c) 2026 prudek
 *
 * Project-local terminal formatting interface for DALI diagnostics.
 */

#ifndef DALI_DIAG_TERMINAL_H
#define DALI_DIAG_TERMINAL_H

#include <stdint.h>

typedef void (*dali_diag_terminal_putc_fn)(char c);

typedef struct
{
    uint8_t dali_initialized;
    uint8_t main_loop_active;
    uint32_t current_uptime_ms;
} tdali_diag_terminal_context;

uint8_t dali_diag_terminal_try_handle_command(const char *command,
                                              const tdali_diag_terminal_context *context,
                                              dali_diag_terminal_putc_fn putc_fn);
void dali_diag_terminal_write_command_summary(dali_diag_terminal_putc_fn putc_fn);

#endif
