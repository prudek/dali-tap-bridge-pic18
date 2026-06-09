# ADR-0006: PR-First Workflow with Human Approval Gate

- Status: Accepted
- Date: 2026-05-11

## Context

The previous workflow enforced branch build verification, but it still allowed
agent-driven merge into `main` and push to `origin/main`. For repository
hygiene and review safety, changes must pass explicit human review before they
enter `main`.

## Decision

Adopt PR-first delivery with a mandatory human approval gate:

1. Agent creates a dedicated branch and implements changes there.
2. Agent runs local embedded build and records `.hex` hash (pre-PR parity
   evidence).
3. Agent pushes branch and opens a pull request.
4. Agent stops at status: `PR ready for human review`.
5. Agent must not merge to `main` and must not push `main`.
6. Human reviews and decides approval/merge.
7. Post-merge verification is a separate stage, executed by the agent only on
   explicit human request:
   - sync local `main` with `origin/main`,
   - rebuild on `main`,
   - compare branch/main `.hex` hash,
   - confirm `HEAD(main) == origin/main`.
8. After successful post-merge verification, agent asks a final human-gated
   cleanup question: whether to delete the merged branch (local and/or remote).
   Branch deletion is optional and requires explicit human confirmation.

## Consequences

### Benefits

- Clear review gate before any `main` update.
- Better separation between implementation and integration authority.
- Maintains deterministic artifact parity checks before PR and after merge.

### Trade-Offs

- Longer handoff cycle (agent pauses for human review).
- Requires explicit post-merge verification trigger.

## Non-Goals

- No CI/GitHub Actions automation changes.
- No requirement for `.elf`, `.map`, or `.sym` parity.
- No firmware runtime/API behavior changes.
