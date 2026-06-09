# ADR-0001: Dual UART Split (DALI vs Debug)

- Status: Accepted
- Date: 2026-04-10

## Context

The firmware needs hardware DALI communication and a development/debug terminal.
Mixing both on one UART increases coupling and operational risk.

## Decision

- Reserve `UART1` exclusively for DALI transport (`RC2/RC3`).
- Reserve `UART2` exclusively for debug terminal (`RD0/RD1`).
- Keep terminal parsing in foreground code, not in ISR.

## Consequences

- Clear isolation between protocol transport and diagnostics console.
- Lower ISR complexity and better timing predictability for DALI.
- Requires maintaining two UART-related subsystems (`debug_uart2` and DALI frame handler).
