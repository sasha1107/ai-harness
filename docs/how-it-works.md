# How It Works

This document explains the harness in plain language.

## The Five Parts

### 1. Human

The human sets direction:

- what to build
- what not to touch
- what counts as done

### 2. Agent Session

The agent session is the worker.

It can:

- read the repo docs
- edit files
- run commands
- inspect test failures
- respond to review comments

Examples:

- Codex
- Claude Code

### 3. Repo Harness

The harness is the environment around the agent.

It includes:

- repository structure
- `AGENTS.md` and `CLAUDE.md`
- docs under `docs/`
- scripts under `scripts/`
- tests, lint rules, build checks
- CI configuration

The harness is what makes the agent reliable.

### 4. Validation Tools

Validation tools are the checks the agent runs after editing code.

Typical examples:

- `lint`
- `typecheck`
- `test`
- `build`
- `smoke`

In this repo, `./scripts/validate.sh` is the single entrypoint that calls those checks or their placeholders.

### 5. CI And Observability

CI is the automatic rerun of the same validation after a push or PR.

Observability is the next layer after tests:

- logs
- metrics
- traces

It is optional for simple repos and useful for mature runtime systems.

## The Core Loop

```text
Human request
  -> Agent reads repo rules
  -> Agent edits code
  -> Agent runs validation
  -> Validation fails or passes
  -> Agent fixes or hands off
```

This is harness engineering in practice. The shell command is only one step inside the loop.

## Local Session vs CI

### Local Session

The agent works interactively:

1. read docs
2. make a change
3. run `./scripts/validate.sh`
4. fix failures

### CI

CI repeats the same check later:

1. PR opens
2. CI runs `./scripts/validate.sh`
3. failures show up in the PR
4. the agent fixes them in a new edit

## Code Review Loop

Yes, this model supports code review and follow-up fixes well.

A practical review loop looks like this:

1. Agent makes a small PR.
2. A human or another agent reviews it.
3. Review comments become a new task input.
4. The agent edits only the scoped files.
5. The agent reruns validation.
6. CI confirms the fix.

This is why the template prefers:

- small PRs
- explicit scope
- explicit validation commands
- docs that explain where changes belong

## What This Repo Is Trying To Teach

The point is not "make agents run shell commands."

The point is:

- make the repo readable
- make the rules explicit
- make validation repeatable
- make review feedback easy to turn into the next edit
