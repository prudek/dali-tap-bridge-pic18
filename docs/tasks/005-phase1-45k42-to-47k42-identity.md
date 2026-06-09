# Phase 1: 45K42 to 47K42 Naming and Technical Identity

## Goal

Restore a single, coherent repository identity around `PIC18F47K42` by removing non-intentional `45K42` traces from code/config/docs and closing the rename process with auditable control.

## Constraints

- Scope includes only versioned code, configuration, and active documentation.
- Historical logs and non-authoritative tool artifacts may remain if explicitly marked as out-of-scope.
- MPLAB project rename is required: `DALI_CG_PIC18F45K42.X -> DALI_CG_PIC18F47K42.X`.
- `mcc_generated_files` updates must be done via MCC regeneration, not by manual comment patching.
- Changes must be delivered in small, single-purpose packages for reviewability.
- Every change package must include explicit rollback guidance.
- No runtime protocol behavior changes are allowed in this phase.

## Implementation Changes

- Produce full inventory of `45K42` traces:
  - file/folder names,
  - MPLAB project/config names,
  - target identifiers in tracked files,
  - documentation/comment references that affect technical understanding.
- Create and maintain `rename-map` as source of truth containing:
  - old name,
  - new name,
  - rationale,
  - package assignment,
  - status.
- Execute package-based updates:
  - identity paths package (physical renames and path references),
  - target identifiers package (active target strings and build identifiers),
  - MCC regeneration package (generated source alignment to `PIC18F47K42`),
  - docs coherence package (single naming narrative in active docs).
- Synchronize all build/editor references impacted by project rename (MPLAB, CMake, VS Code, runbooks).
- Record every package outcome in `docs/tasks/migration-log.md`:
  - scope of package,
  - legacy-token scan result,
  - build result,
  - hardware smoke-test result (when executed),
  - rollback notes used or prepared.

Public interfaces/APIs:
- Runtime firmware API behavior unchanged.
- Process/build-facing names and paths may change to `47K42` identity.

## Tests

- Search regression:
  - no non-intentional `45K42` references in tracked code/config/active docs.
- Build regression:
  - canonical embedded build command succeeds after each change package.
- Delivery evidence:
  - each package has a log entry in `docs/tasks/migration-log.md`.
- Rename-map integrity:
  - every discovered item mapped and closed or explicitly accepted as out-of-scope.
- Reviewability:
  - each package is isolated and traceable in PR diff.

## Acceptance Criteria

- No unintended `45K42` references remain in scoped areas.
- Rename-map is complete, consistent, and marked closed.
- Repository presents one coherent naming narrative centered on `47K42`.
- Each package passed review controls and is traceable end-to-end.
- `docs/tasks/migration-log.md` contains complete evidence and rollback guidance per package.

## Notes

- This phase is foundational and must finish before structural migration in phase 2.
- Any newly discovered ambiguity in target identity should be resolved here, not deferred.
