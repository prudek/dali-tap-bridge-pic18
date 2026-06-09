# Agent Operating Guide

This repository is organized for two audiences:

- human architecture and onboarding docs in `docs/`
- execution-oriented agent docs in `docs/agent/`

Use this file as the first entrypoint for Codex-style agents.

## Repo Contract

- Hardware DALI transport is always `UART1` (`RC2/RC3`).
- Debug terminal is always `UART2` (`RD0/RD1`) at `115200 8N1`.
- Runtime orchestration starts in `dali_library/main.c`.
- MCC-generated sources live in `DALI_CG_PIC18F47K42.X/mcc_generated_files`.
- Sniffer stream is runtime-controlled from terminal:
  - `sniffer on`
  - `sniffer off`
  - `sniffer status`

## Editable vs Generated Boundaries

Primary editable code:

- `dali_library/**`
- `lamp_hardware/**`
- `drivers_peripherals/**`
- `docs/**`

Generated or tool-owned areas (edit only when required by the task):

- `DALI_CG_PIC18F47K42.X/mcc_generated_files/**`
- `DALI_CG_PIC18F47K42.X/nbproject/**`

When changing generated or project files:

- keep changes minimal and surgical
- document why the change is needed
- avoid broad formatting-only rewrites

## Build and Verification

Canonical build command (from repo root):

```powershell
make -f DALI_CG_PIC18F47K42.X/nbproject/Makefile-default.mk SUBPROJECTS= .build-conf
```

If the workspace uses MPLAB bundled make explicitly:

```powershell
"C:\Program Files\Microchip\MPLABX\v6.30\gnuBins\GnuWin32\bin\make.exe" -f DALI_CG_PIC18F47K42.X/nbproject/Makefile-default.mk SUBPROJECTS= .build-conf
```

## Mandatory Iteration Delivery Flow

Source of truth: `docs/adr/ADR-0006-pr-first-human-approval-workflow.md`.

For every change, use a dedicated branch. Direct-to-main is not allowed.

- default branch naming pattern: `prudek/<short-change-slug>`
- done condition (iteration phase): PR is opened and ready for human review

Pre-PR required sequence:

1. Start from clean `main` synchronized with `origin/main` (`fetch` + `pull --ff-only`).
2. Create a branch from `main`.
3. Implement only on that branch.
4. Build locally on the branch.
5. Record branch `.hex` hash.
6. Push branch and open pull request.
7. Stop with status: `PR ready for human review`.

Hard gate rules:

- agent must not auto-merge branch into `main`
- agent must not auto-push `main`
- merge decision belongs to human reviewer

Post-merge verification (only on explicit human request):

1. Checkout `main` and synchronize with `origin/main`.
2. Build locally on `main`.
3. Compare `.hex` hash (branch vs `main`) and require equality.
4. Confirm `HEAD(main) == origin/main`.
5. Ask human cleanup gate: `delete merged branch?` (local and/or remote).
6. Delete branch only if human explicitly confirms.

## ISR and Timing Safety Rules

- Keep ISR handlers lightweight: capture state, set flags, and return.
- Do not run terminal parsing or long loops in ISR context.
- Keep DALI RX/TX timing logic deterministic around `UART1`, `TMR2`, and `TMR4`.
- Any role split (Control Gear vs Control Device) must be explicit and commented at branch points in ISR/handler dispatch.

Branch cleanup safety rules:

- never delete branch automatically
- require explicit human confirmation before branch deletion
- only delete branch when merge is complete and no longer needed

## Where Agents Should Read Next

- `docs/agent/repo-map.md`
- `docs/agent/edit-boundaries.md`
- `docs/agent/build-runbook.md`
- `docs/agent/interrupt-flow.md`
- `docs/agent/feature-flags.md`
- `docs/agent/workflow.md`
- `docs/agent/logs/index.md`
- `docs/adr/ADR-0003-uart2-115200-sniffer-stream.md`

## Latest Accepted Decisions (Read First)

- `docs/adr/ADR-0006-pr-first-human-approval-workflow.md` (PR-first with human approval gate)
- `docs/adr/ADR-0005-branch-build-merge-parity-workflow.md` (historical, superseded)
- `docs/adr/ADR-0003-uart2-115200-sniffer-stream.md` (UART2 `115200` + runtime sniffer stream)
- `docs/adr/ADR-0002-terminal-diagnostics-adapter.md` (diagnostics vs terminal adapter split)
- `docs/adr/ADR-0001-dual-uart-split.md` (`UART1` for DALI, `UART2` for debug)

## Current Active Backlog

- `docs/tasks/001-uart2-115200-sniffer.md` - Completed
- `docs/tasks/002-dali-control-device-mode.md` - Planned
- `docs/tasks/003-sniffer-backward-attribution.md` - Planned
- `docs/tasks/004-epic-47k42-identity-and-repo-structure.md` - Completed
- `docs/tasks/005-phase1-45k42-to-47k42-identity.md` - Completed
- `docs/tasks/006-phase2-repo-structure-v1.md` - Completed
- `docs/tasks/007-public-release-readiness-audit.md` - Planned
- `docs/tasks/008-documentation-consistency-gate.md` - Planned
- `docs/tasks/009-agent-layer-public-positioning.md` - Planned
- `docs/tasks/010-license-and-usage-boundary.md` - Planned
- `docs/tasks/011-final-public-release-gate.md` - Planned

## How to Record Session Changes

After each meaningful implementation or investigation iteration:

1. Create a new session note under `docs/agent/logs/` using `log-template.md`.
2. Name it with the date and short slug, for example:
   - `YYYY-MM-DD-short-title.md`
3. Update `docs/agent/logs/index.md` with:
   - date,
   - summary,
   - changed areas,
   - link to the session note.

Keep logs concise and factual so future agents can quickly resume without
repeating work.
