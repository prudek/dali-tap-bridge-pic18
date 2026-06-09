# DALI Core and HAL Modules

> Legacy/internal reference for the pre-extraction Control Gear branch.

## Scope

This document covers:

- DALI API/glue layer
- generic DALI control gear core
- device type extensions
- PIC18-specific DALI HAL/frame handling

## Layer Breakdown

### DALI API / Glue Layer

Important files:

- [`dali_cg_layer.c`](../../dali_library/dali_core/dali_general_cg_core/dali_cg_layer.c)
- [`dali_cg.h`](../../dali_library/dali_core/dali_cg.h)

Purpose:

- expose DALI-facing APIs to the application layer
- expose DALI flags and power/status accessors
- connect application code to the internal state machine

Important public APIs used by the application:

- `dali_init()`
- `dali_tasks()`
- `dali_getFlags()`
- `dali_getPower()`
- `dali_setStatus()`
- `dali_setOperatingMode()`
- `dali_setReferenceSystemPowerStatus()`

### Generic Control Gear Core

Important files:

- [`dali_cg_machine.c`](../../dali_library/dali_core/dali_general_cg_core/dali_cg_machine.c)
- [`dali_cg_machine.h`](../../dali_library/dali_core/dali_general_cg_core/dali_cg_machine.h)
- [`dali_cg_nvmemory.c`](../../dali_library/dali_core/dali_general_cg_core/dali_cg_nvmemory.c)

Purpose:

- command decode and execution
- DALI state machine behavior
- scene handling
- DTR handling
- fade logic
- persistent state handling

This is where direct arc commands, queries, identification, scenes, and most protocol semantics are decided.

### Device Type Extensions

Important directories:

- [`dali_dev_type_6`](../../dali_library/dali_core/dali_dev_type_6)
- [`dali_dev_type_8`](../../dali_library/dali_core/dali_dev_type_8)

Current build enables:

- `DALI_USE_DEVICE_TYPE_6`
- `DALI_USE_DEVICE_TYPE_8`
- `DALI_USE_EXTRA_MEMORY_BANKS`

These extend the generic core with device-type-specific behavior.

### DALI HAL / Frame Handler

Important file:

- [`dali_cg_frameHandler_K42.c`](../../dali_library/dali_core/dali_hal/dali_cg_frameHandler_K42.c)

Purpose:

- connect the DALI core to PIC18 peripherals
- manage RX byte capture
- manage TMR2-based frame completion
- transmit backward frames on `UART1`
- emit diagnostic events into `dali_diag`

Important functions:

- `dali_interruptRX()`
- `dali_interruptTeTimer()`
- `idali_sendBackwardFrame()`

Responsibilities:

- `dali_interruptRX()`
  captures received bytes, updates the RX buffer, emits `dali_diag_on_rx_byte()`, and arms frame timing
- `dali_interruptTeTimer()`
  classifies the current receive result as a 2-byte forward frame, 3-byte frame, or single-byte timeout/error
- `idali_sendBackwardFrame()`
  sends backward data and emits `dali_diag_on_backward_frame_tx()`

Must not own:

- terminal output
- diagnostics rendering
- lamp/output application policy

## UART1 Ownership

Hardware DALI is owned by the DALI HAL on `UART1`:

- `RC2` = `UART1 TX`
- `RC3` = `UART1 RX`

No debug terminal behavior should depend on or reuse `UART1`.

## ISR vs Foreground Split

ISR-side:

- capture RX bytes
- resolve frame completion timing
- emit compact diagnostic events

Foreground:

- run `dali_tasks()`
- consume flags
- apply lamp/output changes
- render diagnostics to terminal only when requested

This split is important for timing safety and keeps the protocol path independent from console throughput.
