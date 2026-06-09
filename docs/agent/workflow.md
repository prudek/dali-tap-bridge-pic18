# Agent Workflow

This document defines the default execution path for agents in this repository.

## Start Here

1. Read `AGENTS.md`.
2. Read `docs/agent/repo-map.md` and `docs/agent/edit-boundaries.md`.
3. Check active tasks in `docs/tasks/README.md`.
4. Read latest architecture decisions in `docs/adr/`.

## Decision Sources

- **Task specs** (`docs/tasks/*.md`) define what to implement.
- **ADRs** (`docs/adr/*.md`) define why key decisions were made.
- **Agent logs** (`docs/agent/logs/`) define what was already tried and changed.

If task intent conflicts with ADRs, prefer the latest ADR and record the mismatch
in the session log.

## Execution Model

- Keep ISR code lightweight and deterministic.
- Prefer diagnostics/state changes in `dali_diag` over terminal-specific logic.
- Keep terminal rendering and transport concerns isolated in debug modules.
- Avoid generated-file edits unless strictly required.

## Mandatory Execution Pipeline (Per Iteration)

This repository uses PR-first delivery defined by:
`docs/adr/ADR-0006-pr-first-human-approval-workflow.md`.

### Pre-PR Pipeline (Mandatory)

1. Ensure local `main` is clean and synchronized with `origin/main`.
2. Create a dedicated branch (`codex/<short-change-slug>`).
3. Implement and validate on that branch.
4. Run local embedded build on the branch.
5. Record branch `.hex` hash.
6. Push branch and open PR.
7. Stop at: `PR ready for human review`.

PR description formatting rule:
- When using `gh pr create` or `gh pr edit`, pass a real multiline body (`--body-file` or PowerShell here-string).
- Do not pass escaped newline sequences like `\n` in plain string literals.

### Post-Merge Verify Pipeline (On Request)

Run only when a human explicitly asks for post-merge verification:

1. Checkout `main` and sync with `origin/main`.
2. Rebuild on `main`.
3. Compare `.hex` hash from branch and `main` (must match).
4. Verify `HEAD(main) == origin/main`.
5. Ask human gate: `delete merged branch?`.
6. Perform branch cleanup only if human confirms.

## Blocking Conditions (Do Not Close Iteration)

- branch build failed
- PR not opened for material change
- agent attempted merge to `main` without human review
- agent attempted push on `main` in pre-PR phase

## Blocking Conditions (Post-Merge Verify)

- `main` build after merge failed
- `.hex` hash mismatch (branch vs `main`)
- `HEAD(main)` is not equal to `origin/main`
- branch cleanup attempted without explicit human confirmation

## Session Recording

After each iteration:

1. Add a session note in `docs/agent/logs/`.
2. Update `docs/agent/logs/index.md`.
3. Include:
   - objective,
   - applied changes,
   - validation outcome,
   - open risks,
   - next step.
