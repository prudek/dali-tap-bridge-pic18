# ADR-0003: UART2 at 115200 and Runtime Sniffer Stream

- Status: Accepted
- Date: 2026-04-10

## Context

The debug terminal at `9600` baud was too slow for higher-volume diagnostics use-cases (for example: streaming DALI traffic as a simple sniffer feed for external parsing tools).

We also needed this feature without adding new build variants.

## Decision

- Set `UART2` debug terminal to `115200 8N1`.
- Add runtime sniffer controls in terminal:
  - `sniffer on`
  - `sniffer off`
  - `sniffer status`
- Keep event capture lightweight:
  - enqueue diagnostics events in `dali_diag`
  - perform text formatting and UART2 output in foreground (`debug_console_service()`).
- Expose queue pressure via dropped-event counter (`dropped`), visible in `sniffer status`.

## Consequences

- Higher terminal throughput and better fit for live diagnostics streaming.
- No additional compile-time flag for sniffer behavior (single firmware image, runtime switch).
- ISR-related paths stay deterministic because no heavy string formatting occurs in ISR context.
- Under very high event load, events can still be dropped; this is explicit and observable.
