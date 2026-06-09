# Documentation Consistency Gate

## Goal

Remove factual inconsistencies in public-facing documentation so readers see
one coherent technical truth.

## Constraints

- Scope includes README, AGENTS guidance, build runbooks, and architecture docs.
- Focus on factual consistency, not stylistic rewriting.
- Must align with active repository baseline and validated behavior.

## Implementation Changes

- Build a fact matrix for repeated facts:
  - active MCU target,
  - UART roles,
  - debug baud rate,
  - build command/path,
  - board assumptions and runtime diagnostics behavior.
- Identify conflicting statements and resolve them to one canonical baseline.
- Add or reference a canonical source for repeated operational facts.

Public interfaces/APIs:
- None.

## Tests

- Consistency scan confirms no conflicting values across key docs.
- Canonical fact source is referenced from README/runbook-level docs.
- Spot-check by following docs from onboarding to build instructions succeeds.

## Acceptance Criteria

- Public-facing docs no longer conflict on current baseline facts.
- Canonical source is explicit and discoverable.
- External reader can infer current project state without ambiguity.

## Notes

- This task should be coordinated with `005` and `006` outputs to avoid churn.
