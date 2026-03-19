# Architecture Checklist

Use this checklist when applying the harness to a new repo.

## Structure

- Directory responsibilities are obvious.
- Test locations are predictable.
- Major layers or subsystems are named.

## Agent Contract

- `AGENTS.md` exists.
- `CLAUDE.md` exists if Claude Code support is needed.
- `docs/agent-contract.md` exists.

## Validation

- `./scripts/validate.sh` exists.
- Validation stages are named and stage-specific.
- Architecture rules have at least one script check.

## Knowledge Base

- `docs/index.md` exists.
- Architecture, workflow, testing, plans, specs, references, and generated docs are present.

## Drift Management

- Active and completed plans are separated.
- Tech debt or repeated failures are tracked.
