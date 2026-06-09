# Agent Edit Boundaries

## Editable Areas

Default writable source zones:

- `dali_library/**`
- `lamp_hardware/**`
- `drivers_peripherals/**`
- `docs/**`
- `README.md`
- `AGENTS.md`

## Generated and Tool-Owned Areas

Treat these as generated or project-managed:

- `DALI_CG_PIC18F47K42.X/mcc_generated_files/**`
- `DALI_CG_PIC18F47K42.X/nbproject/**`

Only edit them when the task explicitly requires it (for example: adding new source files to project metadata, fixing symbol linkage, updating generated interrupt hookups).

## Editing Policy For Generated Areas

If edits are required:

- make the minimum exact change
- preserve surrounding formatting and generated comments
- do not perform broad cleanups in generated files
- document the reason in commit/PR notes

## Documentation Split Policy

Human-facing docs:

- `docs/architecture.md`
- `docs/dali.md`
- `docs/modules*.md`

Agent execution docs:

- `docs/agent/**`
- `docs/tasks/**`
- `docs/adr/**`

When updating architecture, keep human and agent docs in sync.
