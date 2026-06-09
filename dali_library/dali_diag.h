/*
 * Project-local source for the DALI sniffer / Control Device terminal bridge.
 * Repository license and third-party notice policy are finalized separately.
 */

#ifndef DALI_DIAG_H
#define DALI_DIAG_H

#include <stdint.h>

#define DALI_DIAG_HISTORY_DEPTH 32u
#define DALI_DIAG_INVALID_AGE   0xFFFFFFFFUL
#define DALI_SNIFFER_QUEUE_DEPTH 32u

typedef enum
{
    DALI_SNIFFER_FRAME_RX_FORWARD_16 = 0,
    DALI_SNIFFER_FRAME_RX_FORWARD_24,
    DALI_SNIFFER_FRAME_RX_BACKWARD_8,
    DALI_SNIFFER_FRAME_TX_FORWARD_16_LOCAL,
    DALI_SNIFFER_FRAME_TX_FORWARD_24_LOCAL
} dali_sniffer_frame_type_t;

typedef struct
{
    uint32_t uptime_ms;
    uint8_t frame_type;
    uint8_t raw_byte_count;
    uint32_t raw;
} tdali_sniffer_event;

typedef enum
{
    DALI_DIAG_EVENT_NONE = 0,
    DALI_DIAG_EVENT_RX_FORWARD_16,
    DALI_DIAG_EVENT_RX_FORWARD_24,
    DALI_DIAG_EVENT_RX_BACKWARD_8,
    DALI_DIAG_EVENT_TX_FORWARD_16_LOCAL,
    DALI_DIAG_EVENT_TX_FORWARD_24_LOCAL
} dali_diag_event_type_t;

typedef struct
{
    uint8_t valid;
    uint8_t type;
    uint8_t raw_byte_count;
    uint32_t raw;
    uint32_t uptime_ms;
} tdali_diag_event;

typedef struct
{
    uint32_t rx_isr_count;
    uint32_t rx_raw_byte_count;
    uint32_t rx_forward_16_count;
    uint32_t rx_forward_24_count;
    uint32_t rx_backward_8_count;
    uint32_t tx_forward_16_count;
    uint32_t tx_forward_24_count;
    uint8_t has_last_rx;
    uint8_t has_last_frame;
    uint32_t last_rx_uptime_ms;
    uint32_t last_frame_uptime_ms;
} tdali_diag_summary;

typedef struct
{
    uint8_t count;
    tdali_diag_event events[DALI_DIAG_HISTORY_DEPTH];
} tdali_diag_history;

typedef struct
{
    tdali_diag_summary summary;
    tdali_diag_history history;
} tdali_diag_snapshot;

void dali_diag_init(void);
void dali_diag_on_rx_byte(uint8_t byte, uint32_t uptime_ms);
void dali_diag_on_forward_frame(uint16_t frame, uint32_t uptime_ms);
void dali_diag_on_three_byte_frame(uint32_t frame24, uint32_t uptime_ms);
void dali_diag_on_single_byte_timeout(uint8_t byte, uint32_t uptime_ms);
void dali_diag_on_forward_frame_tx(uint16_t frame, uint32_t uptime_ms);
void dali_diag_on_forward24_frame_tx(uint32_t frame24, uint32_t uptime_ms);
void dali_diag_get_summary(tdali_diag_summary *out);
void dali_diag_get_history(tdali_diag_history *out);
void dali_diag_get_snapshot(tdali_diag_snapshot *out);
void dali_diag_set_sniffer_enabled(uint8_t enabled);
uint8_t dali_diag_get_sniffer_enabled(void);
uint8_t dali_diag_pop_sniffer_event(tdali_sniffer_event *out);
uint8_t dali_diag_get_sniffer_queue_count(void);
uint32_t dali_diag_get_sniffer_dropped_events(void);

#endif
