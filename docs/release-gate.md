# Release Gate

Use this checklist before public release.

## Required

- `README` describes the sniffer/CD branch, not the old Control Gear product
- `NOTICE` exists and explains third-party notice boundaries
- `LICENSE` exists and covers project-local code
- `docs/hardware.md` describes the physical setup and UART split
- `docs/terminal.md` documents the supported terminal surface
- `docs/standards/` is not published in the public release
- tracked private MPLAB metadata is removed
- the branch builds successfully
- the generated `.hex` hash is recorded

## Public-Facing Checks

- no claim of DALI certification or listing unless explicitly supported
- no misleading reference to the removed Control Gear / lamp application
- no unvetted license statement remains in the docs
- hardware support statement is limited to the target board and adapter model

## Suggested Validation

1. build the firmware on the release branch
2. verify terminal commands on real hardware
3. confirm sniffer output and raw transmit commands work
4. confirm the repository contains only the intended public docs
