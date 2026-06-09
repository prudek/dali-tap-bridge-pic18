# Rename Map - 45K42 to 47K42

## Scope

Task: `005-phase1-45k42-to-47k42-identity`  
Phase intent: align repository naming and project identity to `PIC18F47K42`.

## Packages

- `P1-identity-paths`: physical rename of project paths and direct references.
- `P2-target-identifiers`: target identifiers in build/config/docs.
- `P3-mcc-generated`: generated-file device banner alignment via MCC regeneration.
- `P4-docs-coherence`: residual wording cleanup in active documentation.

## Mapping Table

| Old | New | Package | Status | Rationale | Notes |
|---|---|---|---|---|---|
| `.vscode/DALI_CG_PIC18F45K42.mplab.json` | `.vscode/DALI_CG_PIC18F47K42.mplab.json` | P1 | done | Align tool profile filename with active MCU target | File content updated to new project path |
| `DALI_CG_PIC18F45K42.X/` | `DALI_CG_PIC18F47K42.X/` | P1 | done | Remove legacy project folder identity | Full tracked project tree renamed |
| `DALI_CG_PIC18F45K42` project identifiers (nbproject/output names) | `DALI_CG_PIC18F47K42` | P2 | done | Keep project ID, output artifact names, and include paths coherent | Includes Makefile variables and project name |
| `PIC18F45K42` in active docs/config paths | `PIC18F47K42` | P2 | done | Public and process-facing identifiers should match real target | Applied in README, AGENTS, agent runbooks, architecture/dali docs |
| `PIC18F45K42` device banner comments in `mcc_generated_files/*` | `PIC18F47K42` | P3 | deferred | Generated layer must be aligned by MCC regeneration, not manual edits | Deferred until explicit MCC regeneration run |
| Absolute local path segment `.../dali-cg-pic18f45k42/...` in `nbproject` private/genesis files | unchanged | P2 | accepted-exception | Reflects local repository directory name, not MCU target identity | Non-public/local path artifact; can change only if repo folder is renamed |

## Exit Check

- Non-intentional `45K42` references in tracked code/config/docs: cleared.
- Remaining references are only:
  - MCC generated banner comments (deferred to regeneration),
  - local absolute repository folder path tokens (accepted local-path exception).
