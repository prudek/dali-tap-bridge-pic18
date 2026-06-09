# 2026-06-09 - Public Sniffer/CD Extract

## Objective

Restructure the branch into a minimal DALI sniffer and Control Device transmit
profile before the later public-release licensing and documentation cleanup.

## Changes Applied

- Removed Control Gear application and high-level DALI logic from the active
  codebase:
  - `app_dali_cg.*`
  - `lamp_hardware/**`
  - `drivers_peripherals/**`
  - `dali_dev_type_6/**`
  - `dali_dev_type_8/**`
  - `dali_general_cg_core/**`
  - Control Gear NVM and hardware interaction glue.
- Kept the MCC-generated peripheral layer, UART1 DALI transport, UART2 terminal,
  board diagnostics, raw DALI diagnostics, and sniffer queue.
- Reworked runtime startup so `main.c` initializes the frame handler directly
  instead of calling `dali_init()` / Control Gear / lamp application code.
- Reworked diagnostics to record raw frame events only:
  - `rx_forward16`
  - `rx_forward24`
  - `rx_backward`
  - `tx_forward16_local`
  - `tx_forward24_local`
- Removed local backward TX from this profile because the branch is a
  sniffer/Control Device TX profile, not a Control Gear responder.
- Kept terminal commands:
  - `dali arc short <addr> <level>`
  - `dali arc broadcast <level>`
  - `sniffer on`
  - `sniffer off`
  - `sniffer status`
  - `dali status`
  - `dali stats`
- Added raw transmit terminal commands:
  - `send 16 <b0> <b1>`
  - `send 24 <b0> <b1> <b2>`
  - byte arguments accept decimal or `0x`-prefixed hex.
- Reduced MPLAB project source lists and macros to the minimal profile with
  `DALI_ROLE_CONTROL_DEVICE`.

## Validation

- Build/check/test run:
  - `"C:\Program Files\Microchip\MPLABX\v6.30\gnuBins\GnuWin32\bin\make.exe" -f nbproject\Makefile-default.mk SUBPROJECTS= clean`
  - `"C:\Program Files\Microchip\MPLABX\v6.30\gnuBins\GnuWin32\bin\make.exe" -f nbproject\Makefile-default.mk SUBPROJECTS= .build-conf`
- Observed outcome:
  - Clean production build completed successfully.
  - `.hex` SHA256:
    `41A46BDB0A82B1F5D97754B5A42E98E596674E3F773B3AE9D579A59E0BC9C85E`
  - Memory summary:
    - program: `19981` bytes, `15.2%`
    - data: `1632` bytes, `19.9%`
  - Remaining warnings are mostly generated-driver unused-function and
    conversion warnings; no missing Control Gear symbols remain.

## Open Risks

- Raw `send 16` and `send 24` still require hardware validation on the DALI bus.
- The transport source names still contain `dali_cg_*`; renaming can be part of
  the later public cleanup iteration.
- Licensing, public README, hardware usage boundaries, and release gate are
  intentionally deferred to the next iteration.

## Next Step

Run hardware validation for `dali arc short`, `dali arc broadcast`, `send 16`,
`send 24`, and sniffer output, then perform the public licensing/documentation
cleanup and release gate.
