# Public File and Header Audit

- Date: 2026-06-09
- Branch: `prudek/public-release-cleanup`
- Base product line: DALI sniffer / minimal Control Device terminal bridge
- Explicitly excluded from this step: final `README`, `NOTICE`, `LICENSE`,
  hardware documentation, and final public release checklist.

## Scope

This audit covers tracked repository files after the first sniffer/CD extraction.
It classifies files and headers before the repository is prepared for public
visibility.

## Summary

The active firmware source is already reduced to the sniffer/CD profile, but the
repository still carries public-release blockers outside the active build path:

- full OCR copies of IEC 62386 standards under `docs/standards/`
- stale documentation that still describes the old Control Gear/lamp profile
- tracked local/MPLAB noise and private project metadata
- stale MPLAB makefile rules for files removed from the active source list
- no final project license decision yet

The header cleanup in this step is intentionally conservative:

- Microchip/MCC headers were preserved.
- Project-local modules received neutral project headers before the final
  licensing decision.
- Microchip-derived files with local adaptation received adaptation notes without
  changing the original Microchip notice.

## File Classification

| Area | Current state | Severity | Action |
| --- | --- | --- | --- |
| `dali_library/*.c`, `dali_library/*.h` | Active project-local diagnostics, terminal, debug UART, and board LED code | Medium | Retain; headers normalized in this step |
| `dali_library/main.c` | Microchip-derived example entrypoint adapted to sniffer/CD runtime | Medium | Retain; original notice preserved; adaptation note added |
| `dali_library/dali_core/dali_hal/*` | Microchip-derived DALI frame handler adapted to raw sniffer/CD behavior | Medium | Retain; original notice preserved; adaptation notes added |
| `DALI_CG_PIC18F47K42.X/mcc_generated_files/*` | MCC-generated Microchip drivers | Medium | Retain; do not replace Microchip headers; document third-party boundary later |
| `DALI_CG_PIC18F47K42.X/mcc_generated_files/uart1.c` | MCC-generated UART1 driver with local DALI CD setup changes | Medium | Retain; adaptation note added |
| `DALI_CG_PIC18F47K42.X/nbproject/*` | MPLAB project/build metadata | Medium | Retain required build metadata; clean stale rules and private files before public |
| `DALI_CG_PIC18F47K42.X/nbproject/private/*` | Tracked local/private MPLAB metadata | High | Remove from tracked repository before public |
| `DALI_CG_PIC18F47K42.X/defmplabxtrace.log*` | Tracked MPLAB trace/debug residue | High | Remove from tracked repository before public |
| `DALI_CG_PIC18F47K42.X/queuelogs/debugtool.txt` | Tracked MPLAB/debug queue log | High | Remove from tracked repository before public |
| `DALI_CG_PIC18F47K42.X/MyConfig.mc3.bak0` | Tracked MCC backup file | Medium | Remove unless needed for reproducibility |
| `.vscode/*` | Local/editor configuration | Medium | Decide: remove, or keep only if intentionally portable |
| `docs/standards/101.md`, `102.md`, `103.md` | Full OCR standard text with IEC copyright markers | High | Remove before public; replace with references or short project notes only |
| `README.md` | Still describes Control Gear product line | High | Rewrite at final documentation step |
| `docs/architecture*.md`, `docs/dali.md`, `docs/modules*.md` | Mixed old Control Gear/lamp documentation and current sniffer facts | High | Rewrite or prune at final documentation step |
| `docs/agent/*`, `docs/tasks/*`, `docs/adr/*` | Internal planning/history; some stale or superseded | Medium | Decide public positioning; prune or clearly mark internal history |

## Header Inventory

### Project-local headers added

These files now have a project-local header. The later licensing decision can
replace these with SPDX identifiers once the repository policy is finalized.

- `dali_library/board_diag.h`
- `dali_library/dali_diag.c`
- `dali_library/dali_diag.h`
- `dali_library/dali_diag_terminal.c`
- `dali_library/dali_diag_terminal.h`
- `dali_library/debug_console.c`
- `dali_library/debug_console.h`
- `dali_library/debug_uart2.c`
- `dali_library/debug_uart2.h`

### Microchip-derived headers preserved

These files keep their original Microchip notices. This branch only adds a
project adaptation note, so the later `NOTICE`/license boundary can distinguish
project-local code from Microchip-derived code.

- `dali_library/main.c`
- `dali_library/dali_core/dali_hal/dali_cg_frameHandler.h`
- `dali_library/dali_core/dali_hal/dali_cg_frameHandler_K42.c`
- `DALI_CG_PIC18F47K42.X/mcc_generated_files/uart1.c`

### Generated headers left unchanged

All other files under `DALI_CG_PIC18F47K42.X/mcc_generated_files/` retain their
existing MCC/Microchip headers.

## Build Metadata Findings

`DALI_CG_PIC18F47K42.X/nbproject/Makefile-default.mk` contains active source and
object lists for the reduced sniffer/CD firmware, but still also contains stale
individual build rules for removed Control Gear, DT6/DT8, lamp, and driver
files. The production build can still work because those stale rules are not in
the object list, but they are misleading and should be cleaned before public
release.

Recommended action: regenerate the MPLAB makefile from the reduced project, or
remove the stale rule blocks surgically with a post-cleanup build verification.

## Release Blockers Before Public Visibility

1. Remove `docs/standards/*.md` or replace them with short references.
2. Remove tracked local/private MPLAB artifacts:
   - `DALI_CG_PIC18F47K42.X/nbproject/private/*`
   - `DALI_CG_PIC18F47K42.X/defmplabxtrace.log*`
   - `DALI_CG_PIC18F47K42.X/queuelogs/debugtool.txt`
   - `DALI_CG_PIC18F47K42.X/MyConfig.mc3.bak0`
3. Clean stale MPLAB makefile rules for deleted files.
4. Rewrite public-facing documentation for sniffer/CD only.
5. Decide license for project-local code before adding SPDX identifiers or a
   root `LICENSE` file.
6. Add `NOTICE` language that preserves Microchip/MCC boundaries and DALI
   trademark/certification boundaries.

## Current Recommendation

Do not publish this branch yet. The code surface is reduced, but public release
should wait until the high-severity file blockers and stale public documentation
are removed or rewritten.
