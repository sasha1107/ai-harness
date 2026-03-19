# ai-harness

Agent-friendly repository operating template for general software projects.

This repository packages the harness engineering patterns from the OpenAI playbook into a portable starter that works across OpenAI-style agents and Claude Code. It is not an application scaffold. It is a repo operating system for teams that want humans to set direction while agents execute safely.

## What This Repo Provides

- Short agent entrypoints in `AGENTS.md` and `CLAUDE.md`
- Versioned source-of-truth docs in `docs/`
- Reusable templates in `templates/`
- Stack-specific examples in `examples/`
- Validation scripts in `scripts/`

## Operating Model

1. Keep the important knowledge in versioned repo docs, not in chat history.
2. Break work into small, decision-complete tasks with explicit validation commands.
3. Make architecture rules enforceable with scripts, not just prose.
4. Run validation after every change and use failures as the feedback loop.
5. Regularly clean up stale plans, dead docs, and drift.

## Repository Map

- [`AGENTS.md`](AGENTS.md): OpenAI/Codex-oriented entrypoint
- [`CLAUDE.md`](CLAUDE.md): Claude Code-oriented entrypoint
- [`docs/index.md`](docs/index.md): repo documentation map
- [`docs/agent-contract.md`](docs/agent-contract.md): shared agent contract
- [`docs/workflow.md`](docs/workflow.md): task slicing and review loop
- [`docs/testing.md`](docs/testing.md): validation loop design
- [`docs/adoption-guide.md`](docs/adoption-guide.md): how to apply this template to another repo

## Standard Task Shape

Every agent task should define:

- Goal
- Editable scope
- Acceptance criteria
- Validation commands
- Follow-ups

Use [`templates/task-request.template.md`](templates/task-request.template.md) when starting a change.

## Validation Loop

Run the repo harness checks through a single entrypoint:

```sh
./scripts/validate.sh
```

For an application repo built on top of this template, map these standard slots to real commands:

- `lint`
- `typecheck`
- `test`
- `build`
- `smoke`
- `observe` (optional)

## Apply This To Another Repo

1. Copy `AGENTS.md` or `CLAUDE.md` plus the relevant templates.
2. Port the docs under `docs/` that describe architecture, workflow, and testing.
3. Replace the validation command placeholders with the real stack commands.
4. Add structure checks that encode your architecture rules.
5. Keep plans, specs, and generated references in version control.

See [`docs/adoption-guide.md`](docs/adoption-guide.md) for the full sequence.
