# ai-harness

Agent-friendly repository operating template for general software projects.

This repository packages the harness engineering patterns from the OpenAI playbook into a portable starter that works across OpenAI-style agents and Claude Code. It is not an application scaffold. It is a repo operating system for teams that want humans to set direction while agents execute safely.

## What Harness Engineering Means Here

Harness engineering does not mean "run a shell script."

It means designing the environment around the agent so the agent can work safely:

- The `agent session` reads docs, edits files, runs checks, and interprets results.
- The `repo harness` is the environment the agent works inside.
- `scripts/validate.sh` is one tool inside that harness.
- `CI` reruns the same checks automatically after the local session.
- `observability` is an optional later layer for logs, metrics, and traces.

The shortest mental model is:

```text
Human -> Agent session -> Repo harness -> Validation result -> Agent session
```

See [`docs/how-it-works.md`](docs/how-it-works.md) for the plain-language version.

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
- [`docs/how-it-works.md`](docs/how-it-works.md): plain-language explanation of sessions, scripts, CI, and review loops
- [`docs/agent-contract.md`](docs/agent-contract.md): shared agent contract
- [`docs/workflow.md`](docs/workflow.md): task slicing and review loop
- [`docs/testing.md`](docs/testing.md): validation loop design
- [`docs/adoption-guide.md`](docs/adoption-guide.md): how to apply this template to another repo
- [`.github/workflows/validate.yml`](.github/workflows/validate.yml): CI draft for enforcing the harness checks

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

The included GitHub Actions workflow runs the same command on pushes and pull requests.

That does not replace the agent session. It reinforces it:

1. The agent edits code and runs `./scripts/validate.sh` locally.
2. The agent fixes failures until the local loop is green.
3. After a PR, CI runs the same command again.
4. Review comments or CI failures become the next input to the agent.

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
