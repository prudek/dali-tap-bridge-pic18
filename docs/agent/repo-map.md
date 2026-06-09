# Agent Repo Map

## Purpose

This document is a fast map for implementation agents.
It focuses on ownership and entrypoints, not architectural narrative.

## Main Code Zones

- `dali_library/`
  Application orchestration, debug terminal, diagnostics, and DALI stack code.
- `lamp_hardware/`
  Physical output behavior and lamp integration.
- `drivers_peripherals/`
  Hardware-facing helper definitions and low-level support.
- `DALI_CG_PIC18F47K42.X/mcc_generated_files/`
  MCC-generated peripheral drivers and interrupt manager.

## Repository Structure v1 (Conservative Mapping)

Task `006` defines a layer ownership model without broad physical relocation in
this phase.

- `DALI logic`:
  - `dali_library/dali_core/dali_general_cg_core/*`
  - `dali_library/dali_core/dali_dev_type_6/*`
  - `dali_library/dali_core/dali_dev_type_8/*`
- `platform PIC`:
  - `dali_library/dali_core/dali_hal/*`
- `board/support`:
  - `dali_library/main.c`, `app_dali_cg.*`, `debug_*`, `dali_diag*`
  - `lamp_hardware/**/*`
  - `drivers_peripherals/*`
- `build/tooling`:
  - `DALI_CG_PIC18F47K42.X/**/*`
  - `.vscode/*`
  - `docs/tasks/*` migration artifacts

Detailed mapping and deferred debt are tracked in:
`docs/tasks/repo-structure-v1-map.md`.

## Runtime Entry and Flow

- Entry: `dali_library/main.c`
- Foreground loop:
  - `app_daliManageControlGearSystem(...)`
  - `debug_console_mark_main_loop()`
  - `debug_console_service()`

## Critical Interrupt Path

- `UART1 RX` interrupt -> `UART1_Receive_ISR()` -> `dali_interruptRX()`
- `TMR2` interrupt -> `TMR2_ISR()` -> `dali_interruptTeTimer()`
- `TMR4` interrupt -> `TMR4_ISR()` -> `dali_tick1ms()` + `board_diag_tick1ms()`
- `UART2 RX` interrupt -> `debug_uart2_receive_isr()`

## Module Ownership Snapshot

- `main.c`: startup order, runtime orchestration, board diagnostics host implementation
- `debug_uart2`: UART2 transport (`115200`), RX/TX buffering, ISR adapter
- `debug_console`: command parser, terminal command routing, sniffer stream output
- `dali_diag`: DALI event counters/history/semantic correlation and sniffer event queue
- `dali_diag_terminal`: `dali status` and `dali stats` rendering
- `dali_core/*`: control-gear protocol core and DALI HAL frame handling

## Sniffer Ownership

- Producer:
  - `dali_diag_on_forward_frame(...)` enqueues `rx_forward`
  - `dali_diag_on_backward_frame_tx(...)` enqueues `tx_backward`
- Consumer:
  - foreground `debug_console_service()` drains queue and prints line-based `key=value`
- Runtime controls:
  - `sniffer on`
  - `sniffer off`
  - `sniffer status`

## First Files To Open For Most Tasks

1. `dali_library/main.c`
2. `dali_library/debug_console.c`
3. `dali_library/dali_diag.c`
4. `dali_library/dali_core/dali_hal/dali_cg_frameHandler_K42.c`
5. `DALI_CG_PIC18F47K42.X/mcc_generated_files/interrupt_manager.c`
