# Agent Build Runbook

## Purpose

Single-source build instructions for agents and CI-like local verification.

## Canonical Build

From repository root:

```powershell
make -f DALI_CG_PIC18F47K42.X/nbproject/Makefile-default.mk SUBPROJECTS= .build-conf
```

Equivalent two-step form:

```powershell
make -f DALI_CG_PIC18F47K42.X/nbproject/Makefile-default.mk SUBPROJECTS= .build-conf
make -f DALI_CG_PIC18F47K42.X/nbproject/Makefile-default.mk dist/default/production/DALI_CG_PIC18F47K42.X.production.hex
```

## MPLAB Bundled Make (Fallback)

If system `make` is missing or incompatible:

```powershell
"C:\Program Files\Microchip\MPLABX\v6.30\gnuBins\GnuWin32\bin\make.exe" -f DALI_CG_PIC18F47K42.X/nbproject/Makefile-default.mk SUBPROJECTS= .build-conf
```

## Build Output Expectations

Successful production build should produce:

- `DALI_CG_PIC18F47K42.X/dist/default/production/DALI_CG_PIC18F47K42.X.production.hex`

Warnings may still appear in this codebase; the key failure signal is linker/compile `error`.

## Post-Change Verification Checklist

After source or project-file changes:

1. Build production target.
2. Confirm no new undefined symbols.
3. Confirm no missing object/source entries in `nbproject/Makefile-default.mk`.
4. If ISR or frame handler changed, manually sanity-check `interrupt_manager.c`, `uart1.c`, and `tmr2.c` hookups.

## PR-First Reproducibility Check

Follow:
`docs/adr/ADR-0006-pr-first-human-approval-workflow.md`.

### Pre-PR (Mandatory): Build on branch and record `.hex` hash

```powershell
"C:\Program Files\Microchip\MPLABX\v6.30\gnuBins\GnuWin32\bin\make.exe" -f DALI_CG_PIC18F47K42.X/nbproject/Makefile-default.mk SUBPROJECTS= .build-conf
Get-FileHash -Algorithm SHA256 DALI_CG_PIC18F47K42.X/dist/default/production/DALI_CG_PIC18F47K42.X.production.hex
```

Store this hash as `branch_hex_hash`.

Then push branch and open PR. Do not merge to `main` from agent flow.

### Post-merge (On explicit human request): sync, rebuild, parity

```powershell
git checkout main
git fetch origin --prune
git pull --ff-only origin main
"C:\Program Files\Microchip\MPLABX\v6.30\gnuBins\GnuWin32\bin\make.exe" -f DALI_CG_PIC18F47K42.X/nbproject/Makefile-default.mk SUBPROJECTS= .build-conf
Get-FileHash -Algorithm SHA256 DALI_CG_PIC18F47K42.X/dist/default/production/DALI_CG_PIC18F47K42.X.production.hex
```

Compare this with `branch_hex_hash` and require equality.

### Confirm main HEAD parity with origin

```powershell
git rev-parse HEAD
git rev-parse origin/main
```

Both SHAs must be equal.

### Final Human Gate: Branch Cleanup (Optional)

After successful post-merge verify, ask human:
`delete merged branch (local and/or remote)?`

Run cleanup commands only after explicit confirmation.

Check if branch is merged into `main`:

```powershell
git branch --merged main
```

Delete local branch:

```powershell
git branch -d <branch-name>
```

Delete remote branch:

```powershell
git push origin --delete <branch-name>
```

### Artifact Scope Rule

`DALI_CG_PIC18F47K42.X.production.hex` is the parity reference artifact.
Files like `.elf`, `.map`, and `.sym` can differ across local worktree paths
and debug metadata and are not used as strict parity gates.

## Runtime Terminal Sanity (Current Baseline)

After flashing firmware:

1. Open UART2 terminal at `115200 8N1` (`DTR ON`).
2. Verify prompt and `help` output.
3. Run:
   - `sniffer on`
   - generate DALI traffic
   - verify `sniffer ts_ms=... dir=... raw=...` lines
4. Run `sniffer status` and verify:
   - `sniffer=on|off`
   - `queued=<n>`
   - `dropped=<n>`
