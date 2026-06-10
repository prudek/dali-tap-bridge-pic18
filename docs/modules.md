# Module Index

> Legacy/internal reference for the pre-extraction Control Gear branch. The
> public sniffer/CD branch is documented in [`README.md`](../README.md),
> [`docs/hardware.md`](hardware.md), [`docs/terminal.md`](terminal.md), and
> the top-level `NOTICE` and `LICENSE` files.

## Overview

This document is the entrypoint for the module-oriented documentation set.

For execution-oriented, agent-facing guidance (editable boundaries, ISR map, build runbook), use:

- [`AGENTS.md`](../AGENTS.md)
- [`docs/agent/repo-map.md`](agent/repo-map.md)

Use it when you want to understand:

- which module owns which behavior
- which header exposes which interface
- which subsystem to open first for a given task

## Core Module Groups

### Board and Runtime

- `main.c`
  Owns startup order, foreground orchestration, and board-level diagnostic LED behavior.
- `board_diag.h`
  Public board/runtime support interface for uptime and LED ownership.

Detailed document:

- [`docs/modules/diagnostics.md`](modules/diagnostics.md)

### Debug Terminal

- `debug_uart2`
  UART2 transport, buffering, and ISR entrypoint.
- `debug_console`
  Command parser, prompt, banner, and console command dispatch.

Detailed document:

- [`docs/modules/debug.md`](modules/debug.md)

### DALI Diagnostics

- `dali_diag`
  Counters, history, semantic decoding, and forward/backward correlation.
- `dali_diag_terminal`
  Text rendering adapter for `dali status` and `dali stats`.

Detailed document:

- [`docs/modules/diagnostics.md`](modules/diagnostics.md)

### DALI Stack

- DALI API/glue layer
- generic control gear core
- device type extensions
- PIC18 frame handler / HAL

Detailed document:

- [`docs/modules/dali-core.md`](modules/dali-core.md)

### Application and Lamp Integration

- `app_dali_cg`
  Bridges DALI state into output behavior and status feedback.
- `lamp_hardware`
  Maps DALI-visible power to physical output mechanisms.

Detailed document:

- [`docs/modules/app-lamp.md`](modules/app-lamp.md)

## Where To Start

If you need to:

- understand startup and ownership:
  read [`docs/architecture.md`](architecture.md)
- understand the recent refactor:
  read [`docs/architecture-review.md`](architecture-review.md)
- extend terminal commands:
  read [`docs/modules/debug.md`](modules/debug.md)
- extend DALI reporting:
  read [`docs/modules/diagnostics.md`](modules/diagnostics.md)
- change DALI frame handling:
  read [`docs/modules/dali-core.md`](modules/dali-core.md)
- change lamp/output behavior:
  read [`docs/modules/app-lamp.md`](modules/app-lamp.md)
