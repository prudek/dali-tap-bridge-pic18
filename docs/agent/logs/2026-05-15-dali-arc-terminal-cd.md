# 2026-05-15 - DALI Arc Terminal Commands (CD-gated)

## Objective

Add ESP32-style terminal commands for DALI direct arc control:
`dali arc short <addr> <level>` and `dali arc broadcast <level>`, while keeping
Control Gear behavior unchanged unless `DALI_ROLE_CONTROL_DEVICE` is enabled.

## Changes Applied

- Extended `debug_console` with:
  - command parsing for `dali arc short` and `dali arc broadcast`,
  - strict argument/range validation (`addr 0..63`, `level 0..255`),
  - `ok` / `error timeout` / unavailable responses,
  - command list updates in banner/help text.
- Added CD-gated forward send API in HAL:
  - `idali_sendForwardFrame16(uint8_t addressByte, uint8_t dataByte)`.
- Added sniffer event type for local forward TX:
  - `DALI_SNIFFER_FRAME_TX_FORWARD_16_LOCAL`,
  - stream rendering as `dir=tx_forward16_local`.
- Updated docs for terminal command set and role-flag status:
  - `docs/dali.md`,
  - `docs/agent/feature-flags.md`.

## Validation

- Build/check/test run:
  - `make -f nbproject/Makefile-default.mk SUBPROJECTS= .build-conf` (CG default) from `DALI_CG_PIC18F47K42.X/`
  - `make -f nbproject/Makefile-default.mk SUBPROJECTS= MP_EXTRA_CC_PRE=-DDALI_ROLE_CONTROL_DEVICE MP_EXTRA_LD_PRE=-DDALI_ROLE_CONTROL_DEVICE .build-conf` (CD macro build)
- Observed outcome:
  - Both builds completed successfully (existing repository warnings remain).
  - Branch build `.hex` SHA256:
    `C254610CB0A30495980B441141E59F4130EA33895879A05B3F72799F15CFE741`
    for `DALI_CG_PIC18F47K42.X/dist/default/production/DALI_CG_PIC18F47K42.X.production.hex`.

## Open Risks

- CD path currently reuses existing UART1 behavior; on-target validation is still
  required to confirm timing/line behavior for forward TX in CD mode.
- Sniffer now reports local forward TX separately, but bus-level attribution
  semantics should still be verified during hardware tests.

## Next Step

Run hardware verification for:
- `dali arc short 0 0`,
- `dali arc short 63 254`,
- `dali arc broadcast 128`,
including negative syntax/range checks and sniffer output confirmation.
