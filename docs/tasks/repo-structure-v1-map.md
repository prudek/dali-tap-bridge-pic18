# Repository Structure v1 Mapping (Task 006)

## S1 Intent

Define a clear v1 layer model and map current modules to layers without
large physical relocations in this phase.

## v1 Layer Model

- `DALI logic`:
  - protocol core, state machines, device type behavior.
- `platform PIC`:
  - MCU-facing HAL and interrupt-facing integration points.
- `board/support`:
  - lamp/output adaptation, board diagnostics, local peripheral helpers.
- `build/tooling`:
  - MPLAB project files, CMake, VSCode/clangd, runbooks.

## Module Mapping

### stays

- `dali_library/dali_core/dali_general_cg_core/*` -> `DALI logic`
- `dali_library/dali_core/dali_dev_type_6/*` -> `DALI logic`
- `dali_library/dali_core/dali_dev_type_8/*` -> `DALI logic`
- `dali_library/dali_core/dali_hal/*` -> `platform PIC`
- `dali_library/main.c`, `app_dali_cg.*`, `debug_*`, `dali_diag*` -> `board/support`
- `lamp_hardware/**/*` -> `board/support`
- `drivers_peripherals/*` -> `board/support`
- `DALI_CG_PIC18F47K42.X/**/*` -> `build/tooling`
- `cmake/**/*`, `.vscode/*` -> `build/tooling`

### reference-only

- CMake/VSCode references that still point to pre-47K42 naming or paths.
- Architecture and agent docs that describe layering but need v1 wording sync.

### deferred debt

- Splitting `board/support` into finer-grained physical directories.
- Larger source tree relocation to strict layer-based top-level directories.
- HAL abstraction beyond current PIC-specific boundary (out of scope for 006).

## Rollback Guidance (S1)

- Revert commit containing `repo-structure-v1-map.md` and `006` spec adjustments.
- If partial rollback is needed, restore only:
  - `docs/tasks/006-phase2-repo-structure-v1.md`,
  - `docs/tasks/repo-structure-v1-map.md`.

## S2 Tooling Alignment Notes

- Tracked repository artifacts contain no versioned CMake preset/list files.
- CMake-generated tree under `cmake/**` is excluded by current `.gitignore`
  patterns (except optional user overlays), so no tracked S2 CMake file
  mutation is committed in this task.
- S2 delivery in this branch is therefore:
  - explicit audit result,
  - no stale `45K42` in tracked build/tooling references,
  - MPLAB build gate pass.

## Rollback Guidance (S2)

- Revert commit sections that update task/status/log documentation for S2.
- No firmware/runtime rollback is needed because S2 applies no tracked runtime
  or build-script mutation in this branch.

## S3 Documentation Coherence Notes

- Agent-facing map and backlog views are aligned with v1 structure ownership.
- Queue status is synchronized (`005` completed, `006` in progress).
- Runtime/protocol behavior is unchanged.

## Rollback Guidance (S3)

- Revert documentation-only changes in:
  - `README.md`,
  - `AGENTS.md`,
  - `docs/agent/repo-map.md`,
  - `docs/tasks/README.md`,
  - `docs/tasks/migration-log.md`,
  - `docs/agent/logs/*` entries for this iteration.
