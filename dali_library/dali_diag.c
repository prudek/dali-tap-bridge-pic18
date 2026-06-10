/*
 * SPDX-License-Identifier: AGPL-3.0-or-later
 * Copyright (c) 2026 prudek
 *
 * Project-local DALI diagnostics for the sniffer / Control Device terminal
 * bridge.
 */

#include <string.h>
#include <xc.h>

#include "dali_diag.h"

typedef struct
{
    tdali_diag_summary summary;
    tdali_diag_event history[DALI_DIAG_HISTORY_DEPTH];
    uint8_t history_next;
    uint8_t history_count;
    uint8_t sniffer_enabled;
    uint8_t sniffer_head;
    uint8_t sniffer_tail;
    uint8_t sniffer_count;
    uint32_t sniffer_dropped_events;
    tdali_sniffer_event sniffer_queue[DALI_SNIFFER_QUEUE_DEPTH];
} dali_diag_state_t;

static volatile dali_diag_state_t daliDiagState;

static void dali_diag_push_event(uint8_t event_type,
                                 uint32_t raw,
                                 uint8_t raw_byte_count,
                                 uint32_t uptime_ms);
static void dali_diag_sniffer_enqueue(uint8_t frame_type,
                                      uint32_t raw,
                                      uint8_t raw_byte_count,
                                      uint32_t uptime_ms);

void dali_diag_init(void)
{
    memset((void *)&daliDiagState, 0, sizeof(daliDiagState));
}

void dali_diag_on_rx_byte(uint8_t byte, uint32_t uptime_ms)
{
    (void)byte;

    daliDiagState.summary.rx_isr_count++;
    daliDiagState.summary.rx_raw_byte_count++;
    daliDiagState.summary.has_last_rx = 1u;
    daliDiagState.summary.last_rx_uptime_ms = uptime_ms;
}

void dali_diag_on_forward_frame(uint16_t frame, uint32_t uptime_ms)
{
    daliDiagState.summary.rx_forward_16_count++;
    daliDiagState.summary.has_last_frame = 1u;
    daliDiagState.summary.last_frame_uptime_ms = uptime_ms;

    dali_diag_push_event((uint8_t)DALI_DIAG_EVENT_RX_FORWARD_16,
                         (uint32_t)frame,
                         2u,
                         uptime_ms);
    dali_diag_sniffer_enqueue((uint8_t)DALI_SNIFFER_FRAME_RX_FORWARD_16,
                              (uint32_t)frame,
                              2u,
                              uptime_ms);
}

void dali_diag_on_three_byte_frame(uint32_t frame24, uint32_t uptime_ms)
{
    frame24 &= 0x00FFFFFFu;

    daliDiagState.summary.rx_forward_24_count++;
    daliDiagState.summary.has_last_frame = 1u;
    daliDiagState.summary.last_frame_uptime_ms = uptime_ms;

    dali_diag_push_event((uint8_t)DALI_DIAG_EVENT_RX_FORWARD_24,
                         frame24,
                         3u,
                         uptime_ms);
    dali_diag_sniffer_enqueue((uint8_t)DALI_SNIFFER_FRAME_RX_FORWARD_24,
                              frame24,
                              3u,
                              uptime_ms);
}

void dali_diag_on_single_byte_timeout(uint8_t byte, uint32_t uptime_ms)
{
    daliDiagState.summary.rx_backward_8_count++;
    daliDiagState.summary.has_last_frame = 1u;
    daliDiagState.summary.last_frame_uptime_ms = uptime_ms;

    dali_diag_push_event((uint8_t)DALI_DIAG_EVENT_RX_BACKWARD_8,
                         (uint32_t)byte,
                         1u,
                         uptime_ms);
    dali_diag_sniffer_enqueue((uint8_t)DALI_SNIFFER_FRAME_RX_BACKWARD_8,
                              (uint32_t)byte,
                              1u,
                              uptime_ms);
}

void dali_diag_on_forward_frame_tx(uint16_t frame, uint32_t uptime_ms)
{
    daliDiagState.summary.tx_forward_16_count++;
    daliDiagState.summary.has_last_frame = 1u;
    daliDiagState.summary.last_frame_uptime_ms = uptime_ms;

    dali_diag_push_event((uint8_t)DALI_DIAG_EVENT_TX_FORWARD_16_LOCAL,
                         (uint32_t)frame,
                         2u,
                         uptime_ms);
    dali_diag_sniffer_enqueue((uint8_t)DALI_SNIFFER_FRAME_TX_FORWARD_16_LOCAL,
                              (uint32_t)frame,
                              2u,
                              uptime_ms);
}

void dali_diag_on_forward24_frame_tx(uint32_t frame24, uint32_t uptime_ms)
{
    frame24 &= 0x00FFFFFFu;

    daliDiagState.summary.tx_forward_24_count++;
    daliDiagState.summary.has_last_frame = 1u;
    daliDiagState.summary.last_frame_uptime_ms = uptime_ms;

    dali_diag_push_event((uint8_t)DALI_DIAG_EVENT_TX_FORWARD_24_LOCAL,
                         frame24,
                         3u,
                         uptime_ms);
    dali_diag_sniffer_enqueue((uint8_t)DALI_SNIFFER_FRAME_TX_FORWARD_24_LOCAL,
                              frame24,
                              3u,
                              uptime_ms);
}

void dali_diag_get_summary(tdali_diag_summary *out)
{
    uint8_t gieState;

    if(out == 0)
    {
        return;
    }

    gieState = INTCON0bits.GIE;
    INTCON0bits.GIE = 0;
    *out = daliDiagState.summary;
    INTCON0bits.GIE = gieState;
}

void dali_diag_get_history(tdali_diag_history *out)
{
    uint8_t gieState;
    uint8_t index;
    uint8_t historyIndex;

    if(out == 0)
    {
        return;
    }

    gieState = INTCON0bits.GIE;
    INTCON0bits.GIE = 0;

    memset(out, 0, sizeof(*out));
    out->count = daliDiagState.history_count;

    for(index = 0u; index < out->count; index++)
    {
        historyIndex = (uint8_t)((daliDiagState.history_next + DALI_DIAG_HISTORY_DEPTH - 1u - index) %
                                 DALI_DIAG_HISTORY_DEPTH);
        out->events[index] = daliDiagState.history[historyIndex];
    }

    INTCON0bits.GIE = gieState;
}

void dali_diag_get_snapshot(tdali_diag_snapshot *out)
{
    uint8_t gieState;
    uint8_t index;
    uint8_t historyIndex;

    if(out == 0)
    {
        return;
    }

    gieState = INTCON0bits.GIE;
    INTCON0bits.GIE = 0;

    memset(out, 0, sizeof(*out));
    out->summary = daliDiagState.summary;
    out->history.count = daliDiagState.history_count;

    for(index = 0u; index < out->history.count; index++)
    {
        historyIndex = (uint8_t)((daliDiagState.history_next + DALI_DIAG_HISTORY_DEPTH - 1u - index) %
                                 DALI_DIAG_HISTORY_DEPTH);
        out->history.events[index] = daliDiagState.history[historyIndex];
    }

    INTCON0bits.GIE = gieState;
}

void dali_diag_set_sniffer_enabled(uint8_t enabled)
{
    uint8_t gieState;

    gieState = INTCON0bits.GIE;
    INTCON0bits.GIE = 0;

    daliDiagState.sniffer_enabled = (uint8_t)(enabled != 0u);
    daliDiagState.sniffer_head = 0u;
    daliDiagState.sniffer_tail = 0u;
    daliDiagState.sniffer_count = 0u;
    daliDiagState.sniffer_dropped_events = 0u;

    INTCON0bits.GIE = gieState;
}

uint8_t dali_diag_get_sniffer_enabled(void)
{
    uint8_t enabled;
    uint8_t gieState;

    gieState = INTCON0bits.GIE;
    INTCON0bits.GIE = 0;
    enabled = daliDiagState.sniffer_enabled;
    INTCON0bits.GIE = gieState;

    return enabled;
}

uint8_t dali_diag_pop_sniffer_event(tdali_sniffer_event *out)
{
    uint8_t gieState;
    uint8_t hasData;

    if(out == 0)
    {
        return 0u;
    }

    gieState = INTCON0bits.GIE;
    INTCON0bits.GIE = 0;

    hasData = (uint8_t)(daliDiagState.sniffer_count != 0u);
    if(hasData != 0u)
    {
        *out = daliDiagState.sniffer_queue[daliDiagState.sniffer_tail];
        daliDiagState.sniffer_tail++;
        if(daliDiagState.sniffer_tail >= DALI_SNIFFER_QUEUE_DEPTH)
        {
            daliDiagState.sniffer_tail = 0u;
        }
        daliDiagState.sniffer_count--;
    }

    INTCON0bits.GIE = gieState;

    return hasData;
}

uint8_t dali_diag_get_sniffer_queue_count(void)
{
    uint8_t count;
    uint8_t gieState;

    gieState = INTCON0bits.GIE;
    INTCON0bits.GIE = 0;
    count = daliDiagState.sniffer_count;
    INTCON0bits.GIE = gieState;

    return count;
}

uint32_t dali_diag_get_sniffer_dropped_events(void)
{
    uint32_t dropped;
    uint8_t gieState;

    gieState = INTCON0bits.GIE;
    INTCON0bits.GIE = 0;
    dropped = daliDiagState.sniffer_dropped_events;
    INTCON0bits.GIE = gieState;

    return dropped;
}

static void dali_diag_push_event(uint8_t event_type,
                                 uint32_t raw,
                                 uint8_t raw_byte_count,
                                 uint32_t uptime_ms)
{
    daliDiagState.history[daliDiagState.history_next].valid = 1u;
    daliDiagState.history[daliDiagState.history_next].type = event_type;
    daliDiagState.history[daliDiagState.history_next].raw_byte_count = raw_byte_count;
    daliDiagState.history[daliDiagState.history_next].raw = raw;
    daliDiagState.history[daliDiagState.history_next].uptime_ms = uptime_ms;
    daliDiagState.history_next++;

    if(daliDiagState.history_next >= DALI_DIAG_HISTORY_DEPTH)
    {
        daliDiagState.history_next = 0u;
    }

    if(daliDiagState.history_count < DALI_DIAG_HISTORY_DEPTH)
    {
        daliDiagState.history_count++;
    }
}

static void dali_diag_sniffer_enqueue(uint8_t frame_type,
                                      uint32_t raw,
                                      uint8_t raw_byte_count,
                                      uint32_t uptime_ms)
{
    uint8_t nextHead;

    if(daliDiagState.sniffer_enabled == 0u)
    {
        return;
    }

    if(daliDiagState.sniffer_count >= DALI_SNIFFER_QUEUE_DEPTH)
    {
        daliDiagState.sniffer_dropped_events++;
        return;
    }

    daliDiagState.sniffer_queue[daliDiagState.sniffer_head].uptime_ms = uptime_ms;
    daliDiagState.sniffer_queue[daliDiagState.sniffer_head].frame_type = frame_type;
    daliDiagState.sniffer_queue[daliDiagState.sniffer_head].raw_byte_count = raw_byte_count;
    daliDiagState.sniffer_queue[daliDiagState.sniffer_head].raw = raw;

    nextHead = (uint8_t)(daliDiagState.sniffer_head + 1u);
    if(nextHead >= DALI_SNIFFER_QUEUE_DEPTH)
    {
        nextHead = 0u;
    }

    daliDiagState.sniffer_head = nextHead;
    daliDiagState.sniffer_count++;
}
