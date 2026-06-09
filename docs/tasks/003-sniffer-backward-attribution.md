# Sniffer Backward Attribution (Plan B)

- Status: Planned
- Priority: 3

## Goal

Extend sniffer diagnostics beyond raw frame stream so that backward bytes are
attributed and correlated to forward traffic in a deterministic way.

## Why This Exists

Plan A fixed visibility of `rx_backward` frames and separated local TX from bus
RX. The remaining gap is semantic ambiguity:

- which backward belongs to which forward,
- which backward is local echo,
- which backward is bus response or unclassified traffic.

## Constraints

- No change to DALI protocol behavior in machine/core.
- No heavy text processing in ISR context.
- Keep existing `sniffer on/off/status` semantics.
- Keep compatibility with current terminal stream consumers.

## Implementation Changes

- Extend sniffer event model with attribution classes:
  - `rx_backward_response`
  - `rx_backward_echo_local`
  - `tx_backward_local`
  - `rx_backward_unclassified`
- Add lightweight forward/backward correlation state in diagnostics:
  - open response window after forward reception,
  - bind first backward in window as response candidate,
  - store `age_ms_from_last_forward`.
- Add metadata to sniffer events:
  - attribution class,
  - correlation status,
  - optional `forward_ref` marker (index or monotonic id).
- Update terminal renderer to include attribution tags while preserving raw
  payload output.

## Test Scenarios

1. **External master commissioning**
   - `COMPARE/VERIFY/QUERY` traffic shows `rx_backward_response`.
2. **Local control-gear response path**
   - local TX appears as `tx_backward_local`,
   - matching RX echo appears as `rx_backward_echo_local`.
3. **Mixed DALI-1 + DALI-2 traffic**
   - ordering remains stable for `rx_forward16/24` and attributed backward.
4. **Ambiguous/collision case**
   - non-attributable backward appears as `rx_backward_unclassified`.
5. **Regression**
   - no behavior change in DALI control logic and lamp control paths.

## Acceptance Criteria

- Backward entries are visible and attribution is explicit.
- Correlation metadata is available for log analysis.
- Existing terminal commands and DALI runtime behavior remain unchanged.
- No ISR inflation from formatting or heavy analysis.

## Related Decision

- `docs/adr/ADR-0004-sniffer-backward-attribution.md`
