# 2026-04-28 - Sniffer Plan A and Log Integrity

## Objective

Fix missing backward visibility in sniffer with minimal runtime risk and verify
whether malformed lines came from firmware or host logging path.

## Changes Applied

- Implemented Plan A sniffer extension:
  - added `rx_backward` logging from bus RX single-byte path,
  - separated local TX as `tx_backward_local`.
- Kept DALI machine behavior unchanged (diagnostics-only change).
- Updated terminal stream labels accordingly.

## Validation

- Firmware build completed successfully after changes.
- Commissioning logs showed expected sequences:
  - `rx_forward16 -> rx_backward`,
  - `rx_forward24 -> rx_backward`.
- Compared two host logs:
  - one log had malformed/partial lines,
  - TeraTerm capture was clean and semantically consistent.

## Open Risks

- Text-stream integrity can still depend on host-side terminal/logger behavior.
- Current Plan A does not yet attribute backward type (response vs echo vs
  unclassified).

## Next Step

Implement Plan B attribution and forward/backward correlation from
`docs/tasks/003-sniffer-backward-attribution.md`.
