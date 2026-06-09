# Agent Interrupt Flow

## Purpose

This is the execution-facing map of ISR dispatch and downstream handlers.

## Dispatch Source

Primary dispatcher:

- `DALI_CG_PIC18F47K42.X/mcc_generated_files/interrupt_manager.c`

Active branch order:

1. `UART1 RX` -> `UART1_Receive_ISR()`
2. `UART2 RX` -> `debug_uart2_receive_isr()`
3. `TMR4` -> `TMR4_ISR()`
4. `TMR2` -> `TMR2_ISR()`

## DALI Receive Path (`UART1` + `TMR2`)

- `UART1_Receive_ISR()` -> `dali_interruptRX()` in `dali_cg_frameHandler_K42.c`
- `dali_interruptRX()`:
  - reads byte from UART1
  - appends to DALI RX buffer
  - starts/refreshes timing via `TMR2`
  - records diagnostics RX event
  - if sniffer runtime mode is enabled, enqueues compact sniffer event (no UART2 formatting in ISR path)

- `TMR2_ISR()` -> `dali_interruptTeTimer()`
- `dali_interruptTeTimer()` decides frame class:
  - 2-byte forward frame -> `idali_receiveForwardFrame(...)`
  - 3-byte forward frame -> currently observed/flagged and ignored by control gear path
  - single-byte timeout/error -> diagnostic error path

- Backward response transmit path:
  - state machine calls `idali_sendBackwardFrame(byte)`
  - frame handler writes through UART1 TX
  - diagnostics records backward TX and enqueues sniffer TX event (if enabled)

## 1ms Tick Path (`TMR4`)

- `TMR4_ISR()` calls:
  - `dali_tick1ms()`
  - `board_diag_tick1ms()`

This means DALI scheduler timing and board diagnostics share the 1ms time base.

## UART2 Terminal Path

- `UART2 RX` ISR calls `debug_uart2_receive_isr()`
- foreground loop later calls `debug_console_service()`
- parser/command execution stays out of ISR context
- sniffer queue is drained in foreground by `debug_console_service()` and emitted on UART2

## Agent Safety Rules For ISR Changes

- Keep ISR work short and deterministic.
- Push non-critical formatting/parsing to foreground.
- If branching by compile-time role is introduced, keep role branches only at dispatch boundaries and label them with short comments.
