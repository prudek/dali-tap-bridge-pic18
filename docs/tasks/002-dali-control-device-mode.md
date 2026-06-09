# Compile-Time Control Device Mode

> Planned as the second task in order, after `001-uart2-115200-sniffer.md`.

## Goal

Introduce a compile-time split between:

- Control Gear mode (current behavior)
- Control Device mode (new behavior)

The two modes must be isolated in sources and must not co-exist in the same runtime.

## Constraints

- Mode selection is done in one project configuration via a manual macro.
- ISR branch points must be explicit and commented.
- Maintain readability and modular ownership.
- Keep existing Control Gear behavior unchanged when CD flag is not defined.

## Implementation Changes

- Add a top-level compile-time role flag:
  - `DALI_ROLE_CONTROL_DEVICE` (undefined means Control Gear)
- Introduce role dispatch boundaries in UART1/TMR2 handling paths.
- Add dedicated Control Device module(s) for:
  - sending forward 16-bit and 24-bit frames
  - waiting synchronously for backward response with timeout
- Extend terminal in CD mode:
  - `send 16 <b0> <b1> [timeout_ms]`
  - `send 24 <b0> <b1> <b2> [timeout_ms]`
- Keep diagnostic visibility for CD transactions (`ok`, `timeout`, `backward raw`).

## Tests

- Build with and without `DALI_ROLE_CONTROL_DEVICE`.
- In CG build:
  - existing DALI flow unchanged
  - terminal `send` unavailable with clear message
- In CD build:
  - valid `send 16/24` works
  - backward response captured
  - timeout path works and reports cleanly
- Regression:
  - ISR dispatch still lightweight
  - no undefined symbol or duplicate ownership in handlers

## Acceptance Criteria

- Compile-time role split works deterministically.
- Source layout shows clear CG/CD isolation.
- Branch points in ISR/handlers are easy to find and documented.
- Terminal can issue raw forward frames and report backward/timeout in CD mode.
