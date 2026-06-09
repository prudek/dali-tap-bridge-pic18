# 2026-05-15 - MPLAB CD Build Fix

## Objective

Restore MPLAB build after local project metadata drift and ensure Control Device (`DALI_ROLE_CONTROL_DEVICE`) build mode is enforced in this workspace.

## Changes Applied

- Reverted unintended local `nbproject` drift that introduced invalid source paths (notably `../platform/pic18f47k42/...` for DALI HAL sources).
- Set `DALI_ROLE_CONTROL_DEVICE` in `DALI_CG_PIC18F47K42.X/nbproject/configurations.xml` (`define-macros`).
- Added `-DDALI_ROLE_CONTROL_DEVICE` to compile/link macro blocks in `DALI_CG_PIC18F47K42.X/nbproject/Makefile-default.mk` for deterministic CD builds via makefile flow.

## Validation

- Build/check/test run:
  - `make -f nbproject/Makefile-default.mk SUBPROJECTS= .build-conf` (from `DALI_CG_PIC18F47K42.X` using MPLAB bundled `make.exe`)
- Observed outcome:
  - Build succeeds and compiler invocation includes `-DDALI_ROLE_CONTROL_DEVICE`.

## Open Risks

- `nbproject/Makefile-default.mk` is tool-generated; future MPLAB config rewrites may overwrite manual macro propagation.
- Existing compiler warnings remain (pre-existing baseline), but no blocking build errors.

## Next Step

Rebuild/program in MPLAB and verify terminal commands `dali arc short ...` / `dali arc broadcast ...` return CD behavior (`ok`/`timeout`) rather than CG unavailable message.
