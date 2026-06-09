# 2026-06-09 - Public File and Header Audit

## Objective

Execute the second-iteration file/header audit for the public sniffer/CD branch
without generating the final README, NOTICE, LICENSE, hardware docs, or release
gate.

## Changes Applied

- Added neutral project-local headers to sniffer/CD-owned source files.
- Preserved Microchip/MCC notices and added adaptation notes only where the
  Microchip-derived files are locally adapted in this branch.
- Added `docs/release/public-file-header-audit.md` with file classification,
  header inventory, and public-release blockers.
- Updated task `007` to point at the audit output.
- Updated the branch naming rule in `AGENTS.md` from `codex/*` to `prudek/*`.

## Verification

- Checked tracked source headers under `dali_library`.
- Confirmed no SPDX identifier or final root license text was added.
- Confirmed README/NOTICE/LICENSE generation remains pending.

## Notes

- High-severity blockers before public visibility remain:
  - remove or replace `docs/standards/*.md`,
  - remove tracked local/MPLAB noise and private metadata,
  - clean stale MPLAB makefile rule blocks,
  - rewrite final public documentation,
  - select project license with owner approval.
