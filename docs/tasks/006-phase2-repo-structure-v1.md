# Phase 2: Repository Structure and Architectural Order v1

## Goal

Implement a maintainable repository structure v1 with clear ownership boundaries across logic, platform, board/support, and build/tooling layers, without changing DALI protocol behavior.

## Constraints

- Phase 2 starts only after phase 1 completion (`005` closed).
- No protocol logic rewrites during structural migration.
- Migration must be staged; no big-bang move.
- Conservative mode is required in this phase:
  - avoid broad physical module relocation,
  - prefer layer mapping + reference/build/tooling alignment.
- Each stage requires:
  - path/reference synchronization (including MPLAB project visibility),
  - compile/build verification.
- Each stage must include explicit rollback guidance before execution.
- Green build is necessary but not sufficient:
  - hardware validation is mandatory before stage closure for significant structural changes.

## Implementation Changes

- Define target structure model v1:
  - DALI logic layer (portable intent),
  - PIC platform layer (MCU-specific),
  - board/support layer (board integration and hardware mapping),
  - build/tooling layer (MPLAB, scripts, process artifacts).
- Map existing files/modules into migration categories:
  - stays in place,
  - moves to new location,
  - reference-only update required,
  - deferred technical debt.
- Execute staged migration packages:
  - package S1: layer model + module mapping on current physical layout,
  - package S2: build/tooling synchronization (MPLAB, CMake, IDE references),
  - package S3: documentation and architecture-map synchronization.
- Maintain explicit compatibility notes where transient indirection or redirects are required during migration.
- Treat residual `45K42` CMake/build-tooling identifiers as in-scope for this phase and align them to `47K42`.
- Record stage-by-stage evidence in `docs/tasks/migration-log.md`:
  - moved/updated areas,
  - build result,
  - MPLAB reference integrity check result,
  - hardware validation result,
  - rollback notes used or prepared.

Public interfaces/APIs:
- Runtime DALI protocol behavior remains unchanged.
- Internal repository paths and module ownership boundaries are updated to v1 model.

## Tests

- Build validation after each migration package using canonical project build flow.
- Reference integrity checks:
  - MPLAB project resolves moved files correctly,
  - no broken include/path references.
- Regression checks:
  - no behavior regressions attributable to file moves/references.
- Hardware gate:
  - run required on-target validation before closing significant structural stage.
- Delivery evidence:
  - each stage has a log entry in `docs/tasks/migration-log.md`.

## Acceptance Criteria

- Structure v1 is implemented and documented.
- Module-to-layer mapping is explicit and understandable.
- MPLAB successfully recognizes and builds the new layout.
- No regressions introduced by repository reorganization.
- Repository is ready for subsequent HAL-oriented work without organizational ambiguity.
- `docs/tasks/migration-log.md` contains complete evidence and rollback guidance per stage.

## Notes

- Structural cleanup is an architecture-enabling phase, not a protocol feature phase.
- Any change that affects runtime behavior must be split to a separate, explicit task/decision.

## Execution Status Snapshot (2026-05-14)

- `S1` completed: v1 layer model and module mapping documented.
- `S2` completed in conservative mode: tracked build/tooling references audited
  and aligned; no tracked CMake artifacts available for mutation in current
  `.gitignore` policy.
- `S3` completed: architecture/runbook backlog coherence updated.
- Evidence is recorded in `docs/tasks/migration-log.md`.
- Task status: `Completed` (2026-05-14).
- Closure rationale: conservative `006` introduced no significant runtime
  structural movement; hardware gate is therefore not blocking for closure in
  this execution mode.
