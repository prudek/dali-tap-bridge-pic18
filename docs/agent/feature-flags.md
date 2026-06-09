# Agent Feature Flags

## Purpose

Canonical list of compile-time flags that materially affect runtime behavior.

## Active DALI Library Flags (Current)

Configured in MPLAB project config (`nbproject/configurations.xml`):

- `DALI_USE_DEVICE_TYPE_6`
- `DALI_USE_DEVICE_TYPE_8`
- `DALI_USE_EXTRA_MEMORY_BANKS`

These shape core library behavior and enabled DALI device-type code paths.

## Debug/Diagnostics Related Flags

- `DEBUG_CONSOLE_SMOKE_TEST` (used by terminal code paths in `main.c` and `debug_console.c`)

## Runtime Diagnostic Switches (No Compile-Time Flag)

The sniffer feature is intentionally runtime-controlled, not feature-flagged:

- `sniffer on`
- `sniffer off`
- `sniffer status`

Rationale:

- keep one production image for diagnostics bring-up
- avoid extra compile-time matrix for terminal-only behavior
- keep ISR path fixed while allowing foreground debug output control

## Role Split Flag

Optional compile-time role split:

- `DALI_ROLE_CONTROL_DEVICE`

Expected semantics:

- undefined: build as Control Gear
- defined: build as Control Device

This flag isolates CG and CD logic at compile time with no mixed runtime mode.

## Flag Management Guidance

- Keep one source of truth in `nbproject/configurations.xml` and synchronized make metadata.
- Avoid implicit role detection through unrelated feature flags.
- Document any new top-level flag in this file and in `AGENTS.md`.
