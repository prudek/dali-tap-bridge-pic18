/*
 * SPDX-License-Identifier: AGPL-3.0-or-later
 * Copyright (c) 2026 prudek
 *
 * Project-local terminal formatting for DALI diagnostics.
 */

#include <string.h>

#include "dali_diag.h"
#include "dali_diag_terminal.h"

static void dali_diag_terminal_put_string(dali_diag_terminal_putc_fn putc_fn, const char *text);
static void dali_diag_terminal_put_uint32(dali_diag_terminal_putc_fn putc_fn, uint32_t value);
static void dali_diag_terminal_put_hex8(dali_diag_terminal_putc_fn putc_fn, uint8_t value);
static void dali_diag_terminal_put_hex16(dali_diag_terminal_putc_fn putc_fn, uint16_t value);
static void dali_diag_terminal_put_hex24(dali_diag_terminal_putc_fn putc_fn, uint32_t value);
static void dali_diag_terminal_put_yes_no(dali_diag_terminal_putc_fn putc_fn, uint8_t value);
static uint32_t dali_diag_terminal_calculate_age(uint32_t current, uint32_t previous);
static void dali_diag_terminal_write_status(const tdali_diag_terminal_context *context,
                                            dali_diag_terminal_putc_fn putc_fn);
static void dali_diag_terminal_write_stats(const tdali_diag_terminal_context *context,
                                           dali_diag_terminal_putc_fn putc_fn);
static void dali_diag_terminal_write_event(const tdali_diag_event *event,
                                           uint8_t index,
                                           uint32_t current_uptime_ms,
                                           dali_diag_terminal_putc_fn putc_fn);
static void dali_diag_terminal_write_raw(dali_diag_terminal_putc_fn putc_fn,
                                         uint32_t raw,
                                         uint8_t raw_byte_count);

static tdali_diag_snapshot daliDiagTerminalSnapshot;

uint8_t dali_diag_terminal_try_handle_command(const char *command,
                                              const tdali_diag_terminal_context *context,
                                              dali_diag_terminal_putc_fn putc_fn)
{
    if((command == 0) || (context == 0) || (putc_fn == 0))
    {
        return 0u;
    }

    if(strcmp(command, "dali status") == 0)
    {
        dali_diag_terminal_write_status(context, putc_fn);
        return 1u;
    }

    if(strcmp(command, "dali stats") == 0)
    {
        dali_diag_terminal_write_stats(context, putc_fn);
        return 1u;
    }

    return 0u;
}

void dali_diag_terminal_write_command_summary(dali_diag_terminal_putc_fn putc_fn)
{
    if(putc_fn == 0)
    {
        return;
    }

    dali_diag_terminal_put_string(putc_fn, "dali status, dali stats");
}

static void dali_diag_terminal_put_string(dali_diag_terminal_putc_fn putc_fn, const char *text)
{
    while(*text != '\0')
    {
        putc_fn(*text);
        text++;
    }
}

static void dali_diag_terminal_put_uint32(dali_diag_terminal_putc_fn putc_fn, uint32_t value)
{
    char digits[10];
    uint8_t index;

    if(value == 0u)
    {
        putc_fn('0');
        return;
    }

    index = 0u;
    while((value > 0u) && (index < sizeof(digits)))
    {
        digits[index] = (char)('0' + (value % 10u));
        value /= 10u;
        index++;
    }

    while(index > 0u)
    {
        index--;
        putc_fn(digits[index]);
    }
}

static void dali_diag_terminal_put_hex8(dali_diag_terminal_putc_fn putc_fn, uint8_t value)
{
    static const char hexDigits[] = "0123456789ABCDEF";

    putc_fn('0');
    putc_fn('x');
    putc_fn(hexDigits[(value >> 4) & 0x0Fu]);
    putc_fn(hexDigits[value & 0x0Fu]);
}

static void dali_diag_terminal_put_hex16(dali_diag_terminal_putc_fn putc_fn, uint16_t value)
{
    static const char hexDigits[] = "0123456789ABCDEF";

    putc_fn('0');
    putc_fn('x');
    putc_fn(hexDigits[(value >> 12) & 0x0Fu]);
    putc_fn(hexDigits[(value >> 8) & 0x0Fu]);
    putc_fn(hexDigits[(value >> 4) & 0x0Fu]);
    putc_fn(hexDigits[value & 0x0Fu]);
}

static void dali_diag_terminal_put_hex24(dali_diag_terminal_putc_fn putc_fn, uint32_t value)
{
    static const char hexDigits[] = "0123456789ABCDEF";

    putc_fn('0');
    putc_fn('x');
    putc_fn(hexDigits[(value >> 20) & 0x0Fu]);
    putc_fn(hexDigits[(value >> 16) & 0x0Fu]);
    putc_fn(hexDigits[(value >> 12) & 0x0Fu]);
    putc_fn(hexDigits[(value >> 8) & 0x0Fu]);
    putc_fn(hexDigits[(value >> 4) & 0x0Fu]);
    putc_fn(hexDigits[value & 0x0Fu]);
}

static void dali_diag_terminal_put_yes_no(dali_diag_terminal_putc_fn putc_fn, uint8_t value)
{
    if(value != 0u)
    {
        dali_diag_terminal_put_string(putc_fn, "yes");
    }
    else
    {
        dali_diag_terminal_put_string(putc_fn, "no");
    }
}

static uint32_t dali_diag_terminal_calculate_age(uint32_t current, uint32_t previous)
{
    if(current >= previous)
    {
        return (current - previous);
    }

    return 0u;
}

static void dali_diag_terminal_write_status(const tdali_diag_terminal_context *context,
                                            dali_diag_terminal_putc_fn putc_fn)
{
    tdali_diag_summary summary;
    uint32_t lastRxAgeMs;
    uint8_t rxRecent;

    dali_diag_get_summary(&summary);

    if(summary.has_last_rx != 0u)
    {
        lastRxAgeMs = dali_diag_terminal_calculate_age(context->current_uptime_ms,
                                                       summary.last_rx_uptime_ms);
        rxRecent = (uint8_t)(lastRxAgeMs < 1000u);
    }
    else
    {
        lastRxAgeMs = DALI_DIAG_INVALID_AGE;
        rxRecent = 0u;
    }

    dali_diag_terminal_put_string(putc_fn, "dali_initialized=");
    dali_diag_terminal_put_yes_no(putc_fn, context->dali_initialized);
    dali_diag_terminal_put_string(putc_fn, " main_loop_active=");
    dali_diag_terminal_put_yes_no(putc_fn, context->main_loop_active);
    dali_diag_terminal_put_string(putc_fn, " rx_recent=");
    dali_diag_terminal_put_yes_no(putc_fn, rxRecent);
    dali_diag_terminal_put_string(putc_fn, " last_rx_age_ms=");
    if(lastRxAgeMs == DALI_DIAG_INVALID_AGE)
    {
        dali_diag_terminal_put_string(putc_fn, "n/a");
    }
    else
    {
        dali_diag_terminal_put_uint32(putc_fn, lastRxAgeMs);
    }
    dali_diag_terminal_put_string(putc_fn, " rx_fwd16=");
    dali_diag_terminal_put_uint32(putc_fn, summary.rx_forward_16_count);
    dali_diag_terminal_put_string(putc_fn, " rx_fwd24=");
    dali_diag_terminal_put_uint32(putc_fn, summary.rx_forward_24_count);
    dali_diag_terminal_put_string(putc_fn, " rx_bwd8=");
    dali_diag_terminal_put_uint32(putc_fn, summary.rx_backward_8_count);
    dali_diag_terminal_put_string(putc_fn, " tx_fwd16=");
    dali_diag_terminal_put_uint32(putc_fn, summary.tx_forward_16_count);
    dali_diag_terminal_put_string(putc_fn, " tx_fwd24=");
    dali_diag_terminal_put_uint32(putc_fn, summary.tx_forward_24_count);
    dali_diag_terminal_put_string(putc_fn, "\r\n");
}

static void dali_diag_terminal_write_stats(const tdali_diag_terminal_context *context,
                                           dali_diag_terminal_putc_fn putc_fn)
{
    uint8_t index;

    dali_diag_get_snapshot(&daliDiagTerminalSnapshot);

    dali_diag_terminal_put_string(putc_fn, "dali_initialized=");
    dali_diag_terminal_put_yes_no(putc_fn, context->dali_initialized);
    dali_diag_terminal_put_string(putc_fn, " main_loop_active=");
    dali_diag_terminal_put_yes_no(putc_fn, context->main_loop_active);
    dali_diag_terminal_put_string(putc_fn, "\r\nrx_isr_count=");
    dali_diag_terminal_put_uint32(putc_fn, daliDiagTerminalSnapshot.summary.rx_isr_count);
    dali_diag_terminal_put_string(putc_fn, "\r\nrx_raw_byte_count=");
    dali_diag_terminal_put_uint32(putc_fn, daliDiagTerminalSnapshot.summary.rx_raw_byte_count);
    dali_diag_terminal_put_string(putc_fn, "\r\nrx_forward_16_count=");
    dali_diag_terminal_put_uint32(putc_fn, daliDiagTerminalSnapshot.summary.rx_forward_16_count);
    dali_diag_terminal_put_string(putc_fn, "\r\nrx_forward_24_count=");
    dali_diag_terminal_put_uint32(putc_fn, daliDiagTerminalSnapshot.summary.rx_forward_24_count);
    dali_diag_terminal_put_string(putc_fn, "\r\nrx_backward_8_count=");
    dali_diag_terminal_put_uint32(putc_fn, daliDiagTerminalSnapshot.summary.rx_backward_8_count);
    dali_diag_terminal_put_string(putc_fn, "\r\ntx_forward_16_count=");
    dali_diag_terminal_put_uint32(putc_fn, daliDiagTerminalSnapshot.summary.tx_forward_16_count);
    dali_diag_terminal_put_string(putc_fn, "\r\ntx_forward_24_count=");
    dali_diag_terminal_put_uint32(putc_fn, daliDiagTerminalSnapshot.summary.tx_forward_24_count);
    dali_diag_terminal_put_string(putc_fn, "\r\nlast_rx_age_ms=");
    if(daliDiagTerminalSnapshot.summary.has_last_rx != 0u)
    {
        dali_diag_terminal_put_uint32(putc_fn,
                                      dali_diag_terminal_calculate_age(context->current_uptime_ms,
                                                                       daliDiagTerminalSnapshot.summary.last_rx_uptime_ms));
    }
    else
    {
        dali_diag_terminal_put_string(putc_fn, "n/a");
    }

    dali_diag_terminal_put_string(putc_fn, "\r\nlast_frame_age_ms=");
    if(daliDiagTerminalSnapshot.summary.has_last_frame != 0u)
    {
        dali_diag_terminal_put_uint32(putc_fn,
                                      dali_diag_terminal_calculate_age(context->current_uptime_ms,
                                                                       daliDiagTerminalSnapshot.summary.last_frame_uptime_ms));
    }
    else
    {
        dali_diag_terminal_put_string(putc_fn, "n/a");
    }

    dali_diag_terminal_put_string(putc_fn, "\r\nrecent_events:\r\n");

    if(daliDiagTerminalSnapshot.history.count == 0u)
    {
        dali_diag_terminal_put_string(putc_fn, "none\r\n");
        return;
    }

    for(index = 0u; index < daliDiagTerminalSnapshot.history.count; index++)
    {
        dali_diag_terminal_write_event(&daliDiagTerminalSnapshot.history.events[index],
                                       index,
                                       context->current_uptime_ms,
                                       putc_fn);
    }
}

static void dali_diag_terminal_write_event(const tdali_diag_event *event,
                                           uint8_t index,
                                           uint32_t current_uptime_ms,
                                           dali_diag_terminal_putc_fn putc_fn)
{
    uint32_t ageMs;

    dali_diag_terminal_put_string(putc_fn, "#");
    dali_diag_terminal_put_uint32(putc_fn, index);
    dali_diag_terminal_put_string(putc_fn, " ");

    switch(event->type)
    {
        case DALI_DIAG_EVENT_RX_FORWARD_16:
            dali_diag_terminal_put_string(putc_fn, "rx_forward16 raw=");
            break;

        case DALI_DIAG_EVENT_RX_FORWARD_24:
            dali_diag_terminal_put_string(putc_fn, "rx_forward24 raw=");
            break;

        case DALI_DIAG_EVENT_RX_BACKWARD_8:
            dali_diag_terminal_put_string(putc_fn, "rx_backward raw=");
            break;

        case DALI_DIAG_EVENT_TX_FORWARD_16_LOCAL:
            dali_diag_terminal_put_string(putc_fn, "tx_forward16_local raw=");
            break;

        case DALI_DIAG_EVENT_TX_FORWARD_24_LOCAL:
            dali_diag_terminal_put_string(putc_fn, "tx_forward24_local raw=");
            break;

        default:
            dali_diag_terminal_put_string(putc_fn, "unknown raw=");
            break;
    }

    dali_diag_terminal_write_raw(putc_fn, event->raw, event->raw_byte_count);
    ageMs = dali_diag_terminal_calculate_age(current_uptime_ms, event->uptime_ms);
    dali_diag_terminal_put_string(putc_fn, " age_ms=");
    dali_diag_terminal_put_uint32(putc_fn, ageMs);
    dali_diag_terminal_put_string(putc_fn, "\r\n");
}

static void dali_diag_terminal_write_raw(dali_diag_terminal_putc_fn putc_fn,
                                         uint32_t raw,
                                         uint8_t raw_byte_count)
{
    if(raw_byte_count >= 3u)
    {
        dali_diag_terminal_put_hex24(putc_fn, raw & 0x00FFFFFFu);
    }
    else if(raw_byte_count == 2u)
    {
        dali_diag_terminal_put_hex16(putc_fn, (uint16_t)(raw & 0x0000FFFFu));
    }
    else
    {
        dali_diag_terminal_put_hex8(putc_fn, (uint8_t)(raw & 0x000000FFu));
    }
}
