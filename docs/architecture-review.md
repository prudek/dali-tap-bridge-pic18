# Architecture Review of the Modularization Work

> Legacy/internal reference for the pre-extraction Control Gear branch. The
> public sniffer/CD branch is documented in [`README.md`](../README.md),
> [`docs/hardware.md`](hardware.md), [`docs/terminal.md`](terminal.md), and
> the top-level `NOTICE` and `LICENSE` files.

## Summary

This review covers the architectural impact of the recent modularization work around the debug console, UART2 transport, and DALI diagnostics path.

The codebase is in a significantly better state than the earlier bring-up version:

- terminal transport is separated from command parsing
- DALI diagnostics are independent from terminal rendering
- `main.c` is reduced to orchestration plus board diagnostics
- DALI frame handling now emits diagnostic events without knowing terminal behavior

The architecture is not fully “finished”, but the direction is sound and the module boundaries are now meaningful.

## What Changed Architecturally

The key change was moving from a bring-up-style `main.c` that owned too many concerns into a layered structure with explicit module ownership:

- `debug_uart2` owns UART2 transport
- `debug_console` owns terminal behavior and command parsing
- `dali_diag` owns DALI diagnostics state and decoding
- `dali_diag_terminal` owns formatting of diagnostic snapshots
- `app_dali_cg` remains the bridge between DALI state and physical output behavior

This is more than a code move. It changes dependency direction:

- diagnostics no longer depend on terminal code
- the console consumes diagnostics through an adapter instead of reading transport/state internals directly
- DALI HAL emits events into diagnostics without gaining knowledge of command rendering

## Module Assessment

### `board_diag`

Meaning:

- board-local runtime support
- uptime source
- diagnostic LED ownership on `RE0`
- current direct arc LED handoff behavior when diagnostics are disabled

Assessment:

- responsibility is coherent
- placement inside `main.c` is still a compromise
- if board support grows, this should eventually become `board_diag.c/.h`

### `debug_uart2`

Meaning:

- pure UART2 transport
- no protocol semantics
- buffering and TX streaming policy

Assessment:

- narrow responsibility
- good separation from parser logic
- correct place for UART2 ISR-facing behavior

### `debug_console`

Meaning:

- terminal command loop
- line editing
- banner, prompt, and command dispatch

Assessment:

- coherent and easy to reason about
- still text/UART-specific by design, which is acceptable
- correctly depends on adapters rather than diagnostics internals

### `dali_diag`

Meaning:

- event-driven DALI diagnostics state
- statistics
- recent event history
- forward/backward response correlation
- partial semantic interpretation

Assessment:

- strongest modular improvement in the refactor
- properly decoupled from UART2 and terminal text
- good fit for embedded constraints because ISR updates remain lightweight

### `dali_diag_terminal`

Meaning:

- presentation adapter from diagnostics snapshot to console text

Assessment:

- good boundary
- keeps `dali_diag` reusable for future alternate frontends
- right place for output wording, response rendering, and report formatting

## Strengths

- dependency direction is cleaner than before
- DALI and terminal use separate UART peripherals and separate software modules
- diagnostics are reusable and not locked to one UI
- ISR responsibilities are still narrow
- console behavior is easier to extend without polluting the DALI path

## Residual Debt and Tradeoffs

### `board_diag` still hosted in `main.c`

This is the main remaining architecture debt.

Impact:

- top-level orchestration and board support are still mixed in one compilation unit
- new board-specific behavior would keep increasing the weight of `main.c`

### Terminal remains UART/text oriented

This is intentional, but still a limitation:

- terminal formatting is not abstracted beyond a character sink
- report size grows with history depth and diagnostics richness

### Embedded memory pressure is now real

The move from `8` to `32` diagnostic events showed a real hardware constraint:

- stack-based snapshots no longer fit comfortably
- the adapter needed a static snapshot buffer

This is a good example of the architecture working, but embedded constraints shaping implementation details.

### Diagnostic LED multiplexing is useful but slightly overloaded

The LED on `RE0` now has two meanings depending on mode:

- diagnostic indicator in `on` / `heartbeat`
- DALI direct arc visual output in `off`

This is workable, but should be documented clearly because it is not obvious from the hardware name alone.

## Naming and Ownership Review

Module names mostly match real responsibility:

- `debug_uart2` is accurately transport-only
- `debug_console` accurately owns console behavior
- `dali_diag` accurately owns diagnostics
- `dali_diag_terminal` accurately reads as an adapter

The one name that now deserves mental care is `board_diag`:

- it is not just passive diagnostics anymore
- it also mediates LED ownership and direct arc visualization on `RE0`

The current name is still acceptable, but the module should be documented with that broader meaning.

## Overall Verdict

The modularization is architecturally successful.

The biggest improvement is not that code moved out of `main.c`, but that ownership and dependency direction now align with subsystem intent:

- hardware transport
- terminal behavior
- diagnostics state
- diagnostics rendering
- DALI core logic
- output application glue

The remaining debt is manageable and visible, which is exactly where a maintainable embedded codebase should be.
