# CLAUDE.md

This file is the short entrypoint for Claude Code.

## Purpose

- Treat this repository as an operating template for agent-friendly software development.
- Use repo docs as the source of truth instead of relying on chat context alone.

## Read First

1. [`docs/index.md`](docs/index.md)
2. [`docs/agent-contract.md`](docs/agent-contract.md)
3. [`docs/architecture/README.md`](docs/architecture/README.md)
4. [`docs/workflow.md`](docs/workflow.md)
5. [`docs/testing.md`](docs/testing.md)

## Non-Negotiable Rules

- Keep tasks small and decision-complete.
- Stay within the editable scope.
- Update docs when behavior or structure changes.
- Run `./scripts/validate.sh` before handing off work.
- Add enforceable checks when possible.

## Required Task Fields

- Goal
- Editable scope
- Acceptance criteria
- Validation commands
- Follow-ups

## Validation Entry

Use `./scripts/validate.sh` as the shared harness check.

## Detailed Contract

All detailed rules live in [`docs/agent-contract.md`](docs/agent-contract.md).
