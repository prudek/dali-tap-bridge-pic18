# ADR-0005: Mandatory Branch-Build-Merge Parity Workflow

- Status: Superseded by ADR-0006
- Date: 2026-05-11

Superseded by:
`docs/adr/ADR-0006-pr-first-human-approval-workflow.md`

## Context

This embedded repository needs a strict, repeatable agent workflow that avoids
direct edits on `main` and ensures local reproducibility after integration.

In practice, the key firmware delivery artifact is the generated `.hex` file.
Other build outputs such as `.elf`, `.map`, or `.sym` may vary across local
worktree paths and debug metadata, even when the compiled firmware image is
functionally identical.

## Decision

This ADR is kept as historical context. Its merge-to-main sequence is no longer
the active default for new work.

Historical sequence:

1. Ensure `main` is clean and synchronized with `origin/main` (`fetch` + `pull --ff-only`).
2. Create a dedicated branch.
3. Implement only on that branch.
4. Run local embedded build on the branch.
5. Record `.hex` hash from branch build output.
6. Merge branch into `main`.
7. Checkout `main` and sync again with `origin/main`.
8. Run local embedded build on `main`.
9. Compare `.hex` hash from branch vs `main`.
10. Confirm `HEAD(main) == origin/main`.

Direct-to-main changes are not allowed.

## Consequences

### Benefits

- Strong iteration discipline and safer integration path.
- Deterministic local verification before and after merge.
- Clear and auditable evidence that integrated firmware artifact is unchanged.

### Trade-Offs

- Slightly longer delivery loop for every change.
- More required local Git/build steps per iteration.

## Non-Goals

- No GitHub Actions or CI automation changes in this ADR.
- No requirement for `.elf`, `.map`, or `.sym` hash parity.
- No firmware runtime/API behavior changes.
