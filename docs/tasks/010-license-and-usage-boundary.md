# License and Usage Boundary

## Goal

Define legal/public usage boundary by selecting and adding a repository license
and documenting intended usage scope.

## Constraints

- License choice must be explicit and repository-visible.
- Usage boundary notes must not contradict the chosen license.
- Task is governance-focused and should not trigger firmware logic changes.

## Implementation Changes

- Select license with owner approval.
- Add license file at repository root.
- Add concise usage boundary statement in README or companion policy doc.
- Ensure references to license are visible in top-level project docs.

Public interfaces/APIs:
- None.

## Tests

- License file exists and is recognized by repository scanners.
- README (or linked policy) references license and usage intent.
- No conflicting licensing statements remain in docs.

## Acceptance Criteria

- Repository includes an explicit license.
- Public usage/reuse boundary is documented and discoverable.
- No ambiguity remains about default rights for external readers.

## Notes

- If legal/owner decision is pending, this task can prepare options and
  implementation path but cannot close without final decision.
