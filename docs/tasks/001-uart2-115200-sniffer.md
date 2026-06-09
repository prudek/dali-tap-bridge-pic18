# UART2 at 115200 + Diagnostic Sniffer (Implemented)

- Status: Completed
- Completed on: 2026-04-10

## Goal

Improve debug terminal throughput and introduce a simple diagnostic sniffer stream for DALI events.

This task is implemented in the current codebase.

## Constraints

- No changes to DALI protocol semantics.
- Keep ISR paths lightweight (no heavy formatting inside ISR).
- Keep compatibility with existing terminal commands.
- Sniffer output must be parse-friendly for tooling.

## Implementation Changes

- Raise debug terminal baud rate from `9600` to `115200` on `UART2`.
- Add terminal control commands:
  - `sniffer on`
  - `sniffer off`
  - `sniffer status`
- Introduce sniffer v1 event scope:
  - incoming `forward` frames
  - outgoing `backward` frames
- Output format:
  - compact line-based `key=value` records
  - one record per event
- Suggested minimum fields:
  - `ts_ms=<u32>`
  - `dir=rx_forward|tx_backward`
  - `raw=0x....` (16-bit for forward, 8-bit for backward)
  - optional stable metadata keys for decoding hints
- Architecture:
  - ISR only captures/enqueues events
  - formatting and UART2 TX happen in foreground service
  - add `sniffer_dropped_events` counter for queue overflow visibility

## Tests

- Production build succeeds.
- Terminal communication works at `115200 8N1` (with existing DTR requirement).
- `sniffer on/off/status` command behavior is correct.
- With sniffer enabled:
  - forward events are streamed
  - backward events are streamed
- Existing commands (`help`, `status`, `uptime`, `dali status`, `dali stats`) continue to work.
- No ISR timing regression (no parser/formatter execution in ISR context).

## Acceptance Criteria

- Debug terminal reliably operates at `115200`.
- Sniffer can be turned on/off at runtime.
- Sniffer stream is machine-parseable and stable in shape.
- Event loss visibility exists through a drop counter.

## Implementation Notes

- `debug_uart2.c` configures `UART2` for `115200 8N1`.
- `debug_console.c` implements:
  - `sniffer on`
  - `sniffer off`
  - `sniffer status`
  - foreground sniffer stream output.
- `dali_diag.c` implements runtime sniffer queueing and counters:
  - queue count
  - dropped events.
