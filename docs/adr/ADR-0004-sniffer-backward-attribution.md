# ADR-0004: Sniffer Backward Attribution

- Status: Accepted
- Date: 2026-04-28

## Context

Sniffer Plan A improved visibility by logging:

- `rx_forward16`
- `rx_forward24`
- `rx_backward`
- `tx_backward_local`

This removed the main blind spot for backward-frame observation. However, logs
still do not explicitly distinguish response bytes, local echoes, and ambiguous
traffic patterns.

## Decision

Adopt Plan B as the next diagnostic enhancement, with these boundaries:

1. Keep DALI protocol behavior unchanged in machine/core.
2. Implement attribution and correlation only in diagnostics/sniffer modules.
3. Expose attribution in terminal output while preserving raw-byte visibility.

## Consequences

### Benefits

- Better root-cause analysis for commissioning and mixed-device traffic.
- Clearer differentiation between local activity and bus responses.
- Improved machine parsing of logs for future tooling.

### Trade-Offs

- Higher diagnostic-state complexity.
- Slightly more RAM/state bookkeeping.
- Additional test matrix for mixed and ambiguous traffic.

## Non-Goals

- No semantic changes to DALI command handling.
- No change to lamp control behavior.
- No parsing/formatting workload added to ISR paths.

## Related Task

- `docs/tasks/003-sniffer-backward-attribution.md`
