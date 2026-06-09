# 2026-05-15 - CD TX idle release and frame-window TX enable

## Objective

Remove persistent DALI bus contention in CD firmware while keeping `dali arc short/broadcast` TX path functional.

## Changes Applied

- `DALI_CG_PIC18F47K42.X/mcc_generated_files/uart1.c`
  - In CD build (`DALI_ROLE_CONTROL_DEVICE`), force `U1CON0bits.TXEN = 0` after UART1 init so TX path is physically disabled in idle.
  - In CD build, set `U1P2L = 0x10` to configure the forward/backward frame delimiter per Microchip DALI Control Device guidance.
- `DALI_CG_PIC18F47K42.X/mcc_generated_files/pin_manager.c`
  - Corrected `RC2PPS` from `0x15` (`RTS1` in PIC18F47K42 EDC metadata) to `0x13` (`TX1`) so UART1 TX is actually routed to the DALI TX pin.
- `dali_library/dali_core/dali_hal/dali_cg_frameHandler_K42.c`
  - In `idali_sendForwardFrame16()` enable `U1CON0bits.TXEN = 1` only for frame transmission window.
  - Keep bounded waits for `U1TXIF` and `TXMTIF`, then always disable TX (`TXEN=0`) and release RC2 path after send or timeout.
  - Keep TX enabled for a fixed 40 ms physical frame window after loading both forward-frame bytes, because `TXIF/TXMTIF` can become true before the DALI waveform is externally observable.
  - Read bus busy state directly from `PORTCbits.RC3`, matching the repo hardware contract and avoiding stale generated `DALI_RX` aliases.

## Validation

- Build/check/test run:
  - `"C:\Program Files\Microchip\MPLABX\v6.30\gnuBins\GnuWin32\bin\make.exe" -f nbproject/Makefile-default.mk SUBPROJECTS= .build-conf`
- Observed outcome:
  - Build completed successfully and produced `dist/default/production/DALI_CG_PIC18F47K42.X.production.hex`.
- Hardware outcome:
  - User confirmed physical DALI TX with local RX echo and an independent sniffer.
  - Verified frames included `0xFE00` and `0xFE64` after `dali arc broadcast 0` and `dali arc broadcast 100`.

## Lesson Learned

- Root cause of "local TX but no physical frame" was wrong PPS output routing: `RC2PPS = 0x15` selects `RTS1`, not `TX1`, on `PIC18F47K42`.
- For this repo hardware contract, `UART1 TX` must be routed with `RC2PPS = 0x13`.
- `dir=tx_forward16_local` is a software-side TX intent event. It is not proof that `RC2` or the physical DALI bus carried a waveform.
- After MCC regeneration, device migration, or DFP updates, verify PPS numeric values against current device metadata before changing DALI TX/RX routing.
- If local TX logs appear but no external DALI frame is visible, check PPS before suspecting the DALI physical driver.

## Open Risks

- Physical polarity/driver topology on a specific board variant may still require an additional TXPOL/CD mode adjustment.
- Generated MCC files were edited surgically; MCC re-generation can overwrite these changes.

## Next Step

Keep the PPS lesson in `docs/dali.md` so future work does not revert `RC2PPS` to `0x15`.
