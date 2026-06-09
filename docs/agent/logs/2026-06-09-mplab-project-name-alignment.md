# 2026-06-09 - MPLAB project name alignment

## Objective

Make the MPLAB project easier to identify by using a repository-style name in the project metadata.

## Changes Applied

- Updated `DALI_CG_PIC18F47K42.X/nbproject/project.xml` project name from `DALI_CG_PIC18F47K42` to `dali-tap-bridge-pic18`.

## Validation

- Build/check/test run: pending after metadata update
- Observed outcome: project name now shows as `dali-tap-bridge-pic18` in MPLAB project metadata

## Open Risks

- MPLAB may still show some artifact/output names derived from the project folder.
- VSCode/MPLAB extension profile filenames still use the older file naming scheme.

## Next Step

Rebuild the project and confirm the metadata change does not disturb generation of the production hex.
