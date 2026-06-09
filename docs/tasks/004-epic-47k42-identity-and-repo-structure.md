# Epic: 47K42 Identity and Repository Structure v1

## Goal

Define and track a two-phase stabilization program that:
- restores one coherent technical identity around `PIC18F47K42`, and
- reorganizes repository structure for maintainability and future HAL work.

This epic is an organizational parent for:
- `005-phase1-45k42-to-47k42-identity.md`
- `006-phase2-repo-structure-v1.md`

Execution dependency:
- `005` must be completed before `006`.

Status:
- `Completed` (2026-05-14)

## Constraints

- No direct protocol behavior changes are introduced by epic definition itself.
- Work must follow PR-first workflow from `docs/adr/ADR-0006-pr-first-human-approval-workflow.md`.
- Build must remain valid after each implementation package in child tasks.
- Hardware validation remains mandatory after significant structural changes in phase 2.

## Implementation Changes

- Add planning and sequencing contract for two-phase delivery.
- Define dependency and completion gates at backlog level.
- Centralize shared assumptions to prevent divergence between phase specs.

Public interfaces/APIs:
- None in this epic file (execution details are in child tasks).

## Tests

- Verify both child tasks (`005`, `006`) exist and are implementation-ready.
- Verify dependency order is explicit (`005` before `006`).
- Verify queue registration in `docs/tasks/README.md`.

## Acceptance Criteria

- Epic file exists with explicit goal, constraints, and dependency.
- Child task references are correct and discoverable.
- Backlog queue includes `004`, `005`, and `006` with up-to-date status values.

## Notes

- This epic is organizational and does not authorize firmware logic changes by itself.
- Any scope expansion beyond naming/structure should be captured as separate tasks or ADR decisions.
- Closure note:
  - `005` completed (identity alignment),
  - `006` completed in conservative mode (`S1/S2/S3`) with evidence in `docs/tasks/migration-log.md`.
