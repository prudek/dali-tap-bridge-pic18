# Agent Layer Public Positioning

## Goal

Decide and document how the agent-oriented layer should appear in the public
repository without obscuring firmware identity.

## Constraints

- Decision must keep repository understandable for firmware-first readers.
- Avoid ambiguous middle state for `AGENTS.md` and `docs/agent/*`.
- No removal or relocation should break internal workflow without replacement.

## Implementation Changes

- Evaluate options:
  - highlight agent workflow as public strength,
  - minimize and keep as secondary contributor aid,
  - relocate/reframe to reduce front-page dominance.
- Select one option and document rationale.
- Align README and docs hierarchy with selected positioning.

Public interfaces/APIs:
- None.

## Tests

- New reader path from README clearly communicates repository identity.
- Agent layer placement matches declared positioning decision.
- Internal execution docs remain usable after positioning update.

## Acceptance Criteria

- One explicit positioning decision is recorded and implemented in docs layout.
- Public and internal readers can navigate docs without role confusion.
- Firmware identity remains primary in top-level narrative.

## Notes

- Positioning is a strategy/documentation decision, not a firmware change.
