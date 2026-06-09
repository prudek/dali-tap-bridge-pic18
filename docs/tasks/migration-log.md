# Migration Log - 45K42 to 47K42

## Entry Template

- Date:
- Task:
- Package/Stage:
- Scope:
- Legacy-token scan result:
- Build result:
- MPLAB/reference integrity result:
- Hardware validation result:
- Rollback guidance:
- Rollback execution (if used):
- Notes:

## Entries

### 2026-05-14 - Package P1+P2 identity alignment

- Date: 2026-05-14
- Task: `005-phase1-45k42-to-47k42-identity`
- Package/Stage: `P1-identity-paths` + `P2-target-identifiers`
- Scope:
  - Renamed `.vscode` project profile filename to `...47K42...`.
  - Renamed MPLAB project directory `DALI_CG_PIC18F45K42.X` -> `DALI_CG_PIC18F47K42.X`.
  - Updated path and target references in active docs/config/build files.
  - Preserved `mcc_generated_files` device banners for MCC-driven follow-up.
- Legacy-token scan result:
  - `git grep` after changes shows residual `45K42` only in:
    - `DALI_CG_PIC18F47K42.X/mcc_generated_files/*` generated comment banners,
    - local absolute repo-folder path tokens in `nbproject` private/genesis files.
- Build result:
  - Success using MPLAB bundled make:
    - `C:\Program Files\Microchip\MPLABX\v6.30\gnuBins\GnuWin32\bin\make.exe -f nbproject/Makefile-default.mk SUBPROJECTS= .build-conf`
  - Output hex:
    - `DALI_CG_PIC18F47K42.X/dist/default/production/DALI_CG_PIC18F47K42.X.production.hex`
  - SHA256:
    - `B956846C5A2B033651C7189C0B140120F9EE3310B225B551319CFFD146B92C4C`
- MPLAB/reference integrity result:
  - Project name/path and artifact references resolve under `...47K42...`.
- Hardware validation result:
  - Passed on physical target hardware for firmware version `0.9.1`.
  - Report source: human verification by repository owner on 2026-05-14.
- Rollback guidance:
  - Revert commit containing `P1/P2` package to restore old naming baseline.
  - If partial rollback is needed, restore:
    - project path rename,
    - `.vscode` profile filename,
    - affected docs/build references in same batch.
- Rollback execution (if used):
  - Not used.
- Notes:
  - `P3-mcc-generated` remains deferred until explicit MCC regeneration.
  - `P1/P2` package is functionally validated on hardware and ready for review.

### 2026-05-14 - Stage S1 structure model and mapping

- Date: 2026-05-14
- Task: `006-phase2-repo-structure-v1`
- Package/Stage: `S1-model-and-mapping`
- Scope:
  - Confirmed conservative execution mode (no big-bang moves).
  - Added `docs/tasks/repo-structure-v1-map.md` with v1 layer ownership model.
  - Mapped current modules into `stays`, `reference-only`, and `deferred debt`.
  - Added S1 rollback guidance in mapping artifact.
- Legacy-token scan result:
  - No non-intentional `45K42` references in tracked active docs/config
    outside historical/log/task context and accepted generated MCC banners.
- Build result:
  - Success using MPLAB bundled make:
    - `C:\Program Files\Microchip\MPLABX\v6.30\gnuBins\GnuWin32\bin\make.exe -f nbproject/Makefile-default.mk SUBPROJECTS= .build-conf`
- MPLAB/reference integrity result:
  - Canonical MPLAB project path and build flow resolve under
    `DALI_CG_PIC18F47K42.X`.
- Hardware validation result:
  - Not required at S1 (documentation and ownership mapping only; no runtime
    structure movement).
- Rollback guidance:
  - Revert S1 documentation commit portions:
    - `docs/tasks/006-phase2-repo-structure-v1.md`
    - `docs/tasks/repo-structure-v1-map.md`
- Rollback execution (if used):
  - Not used.
- Notes:
  - S1 intentionally avoids physical directory relocation.

### 2026-05-14 - Stage S2 build/tooling reference audit

- Date: 2026-05-14
- Task: `006-phase2-repo-structure-v1`
- Package/Stage: `S2-build-tooling`
- Scope:
  - Audited tracked build/tooling references for stale `45K42` target markers.
  - Validated tracked references are aligned to `47K42`.
  - Confirmed that CMake-generated tree content is excluded by repository
    `.gitignore` patterns in current setup, so no tracked CMake file mutation is
    committed in this stage.
- Legacy-token scan result:
  - `git grep` in tracked artifacts found no unintended `45K42` target tokens.
- Build result:
  - Success using MPLAB bundled make (artifact up-to-date):
    - `C:\Program Files\Microchip\MPLABX\v6.30\gnuBins\GnuWin32\bin\make.exe -f nbproject/Makefile-default.mk SUBPROJECTS= .build-conf`
  - Output hex SHA256:
    - `9E4467270780FA8A84C8E4117C3C12099EBA98510AC0051088CC53719DB70964`
- MPLAB/reference integrity result:
  - MPLAB default configuration resolves and builds successfully.
- Hardware validation result:
  - Not required at S2 (tooling/reference audit only; no runtime logic/path
    behavior change).
- Rollback guidance:
  - Revert S2 audit/log documentation updates in task artifacts.
- Rollback execution (if used):
  - Not used.
- Notes:
  - If future policy requires versioned CMake presets/lists, `.gitignore`
    strategy for `cmake/**` should be revisited in a separate task.

### 2026-05-14 - Stage S3 architecture/documentation coherence

- Date: 2026-05-14
- Task: `006-phase2-repo-structure-v1`
- Package/Stage: `S3-doc-coherence`
- Scope:
  - Aligned agent-facing repository map to v1 layer model.
  - Synchronized backlog status views (`AGENTS.md`, `docs/tasks/README.md`).
  - Corrected top-level README UART2 console speed statement to `115200 8N1`.
  - Added S2/S3 rollback guidance to `docs/tasks/repo-structure-v1-map.md`.
- Legacy-token scan result:
  - Documentation remains coherent with `47K42` naming baseline.
- Build result:
  - Success using MPLAB bundled make after documentation updates:
    - `C:\Program Files\Microchip\MPLABX\v6.30\gnuBins\GnuWin32\bin\make.exe -f nbproject/Makefile-default.mk SUBPROJECTS= .build-conf`
- MPLAB/reference integrity result:
  - No regression in MPLAB build path or reference resolution observed.
- Hardware validation result:
  - Pending human hardware smoke-test only if requested for documentation-only
    structural closure.
- Rollback guidance:
  - Revert S3 documentation files only (no firmware rollback required):
    - `README.md`
    - `AGENTS.md`
    - `docs/agent/repo-map.md`
    - `docs/tasks/README.md`
    - `docs/tasks/repo-structure-v1-map.md`
    - `docs/tasks/migration-log.md`
- Rollback execution (if used):
  - Not used.
- Notes:
  - No DALI protocol/API changes were introduced in `006` S1-S3 execution.
