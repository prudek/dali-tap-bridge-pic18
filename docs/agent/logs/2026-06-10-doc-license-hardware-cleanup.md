# 2026-06-10 - Documentation, licensing, and hardware notes cleanup

## Objective

Align public documentation with the current sniffer/CD firmware scope, remove the
obsolete release gate page, and switch project-local source headers to AGPL.

## Changes Applied

- Removed `docs/release-gate.md` and updated active documentation links.
- Reworked `README.md` and `docs/hardware.md` to describe the Microchip
  `PIC18F47K42 Curiosity Nano` target, DALI front-end expectations, and
  example adapter boards.
- Updated `NOTICE` and `LICENSE` to an AGPL boundary for project-local source.
- Added AGPL SPDX headers to the project-local `dali_library` modules.

## Validation

- Link scan:
  - no remaining active `release-gate.md` references outside historical task/log
    content.
- Static review:
  - documentation now states the implemented 16-bit / 24-bit frame support
    instead of overstating wider frame handling.

## Open Risks

- The AGPL `LICENSE` file is currently a short-form notice plus the official
  reference URL rather than the full license text.
- Microchip-derived and MCC-generated files still carry their original notices
  by design.

## Next Step

Build the project once more if a code-only validation pass is needed after the
header updates.
