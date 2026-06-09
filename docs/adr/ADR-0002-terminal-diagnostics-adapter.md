# ADR-0002: Terminal Diagnostics via Adapter Layer

- Status: Accepted
- Date: 2026-04-10

## Context

The diagnostics subsystem should remain reusable and testable without coupling to terminal transport details.

## Decision

- Keep DALI diagnostics state and correlation logic in `dali_diag`.
- Keep terminal rendering in `dali_diag_terminal`.
- Keep transport and command parsing in `debug_uart2` and `debug_console`.

## Consequences

- Diagnostics logic is independent from UART2 command shell.
- `dali status` and `dali stats` remain replaceable output adapters.
- Requires discipline to avoid pushing text formatting back into `dali_diag`.
