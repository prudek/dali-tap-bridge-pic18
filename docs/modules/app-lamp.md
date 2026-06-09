# Application and Lamp Integration Modules

> Legacy/internal reference for the pre-extraction Control Gear branch.

## Scope

This document covers:

- `app_dali_cg`
- `lamp_hardware`
- related output-side integration behavior

## `app_dali_cg`

Important files:

- [`app_dali_cg.c`](../../dali_library/app_dali_cg.c)
- [`app_dali_cg.h`](../../dali_library/app_dali_cg.h)

Purpose:

- call the DALI library mainline
- collect DALI flags
- translate DALI power/status requests into application behavior
- connect DALI power changes to both the lamp layer and board-level LED direct arc ownership

Important functions:

- `app_lampSysInit()`
- `app_updateLEDDevOperationParams()`
- `app_updateGeneralCGOperationParams()`
- `app_daliManageControlGearSystem()`

### `app_lampSysInit()`

Purpose:

- initialize configured lamp/device-type-specific subsystems

### `app_updateLEDDevOperationParams()`

Purpose:

- apply DALI power updates for the LED device type path
- update lamp operating mode and reference system power state
- pass the current arc level to `board_diag_set_dali_arc_level()`

### `app_updateGeneralCGOperationParams()`

Purpose:

- apply generic control gear power updates
- also mirror the current arc level into `board_diag`

### `app_daliManageControlGearSystem()`

Purpose:

- run `dali_tasks()`
- merge and consume DALI flags
- push lamp status into the DALI library
- handle identification behavior
- dispatch into device-type/application update callbacks

This is the main bridge between DALI state and physical output behavior.

## `lamp_hardware`

Important files:

- [`lamp_hardware.c`](../../lamp_hardware/lamp_hardware.c)
- [`lamp_hardware.h`](../../lamp_hardware/lamp_hardware.h)
- [`lamp_driver.c`](../../lamp_hardware/lamp_driver.c)

Purpose:

- map DALI-visible arc power into actual output behavior
- expose output-side status back to the DALI application layer
- provide dimming-table-related helpers

Important functions:

- `lamp_setPower()`
- `lamp_getStatus()`
- `lamp_getDimmingTableValue()`
- `lamp_getOperatingMode()`

## Current Physical Output Behavior

There are two distinct output concepts in the current project:

1. lamp/output behavior handled by `lamp_hardware`
2. board diagnostic LED behavior handled by `board_diag` on `RE0`

These are not the same subsystem, but they are now connected by one policy:

- when diagnostic LED mode is `OFF`, `RE0` is driven from the current DALI direct arc level

Meaning:

- `led blink`
  diagnostic heartbeat owns `RE0`
- `led on`
  diagnostics force `RE0` on
- `led off`
  diagnostics release `RE0`, and `board_diag` visualizes DALI direct arc level there

This behavior is application policy, not DALI core policy.

## Ownership Boundaries

`app_dali_cg` owns:

- deciding when a DALI power update should be applied
- forwarding the current arc level to board diagnostics

`lamp_hardware` owns:

- how power values affect the physical lamp/output path

`board_diag` owns:

- how `RE0` behaves in diagnostic vs direct-arc visualization modes

This separation is important:

- DALI core should not know about `RE0`
- lamp hardware should not own debug terminal behavior
- board diagnostics should not own DALI command semantics
