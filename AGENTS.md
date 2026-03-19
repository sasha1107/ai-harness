# AGENTS.md

This file is the short entrypoint for OpenAI-style coding agents.

## Purpose

- Treat this repository as an operating template for agent-friendly software development.
- Keep durable knowledge in versioned docs, not only in prompts or chat.

## Read First

1. [`docs/index.md`](docs/index.md)
2. [`docs/agent-contract.md`](docs/agent-contract.md)
3. [`docs/architecture/README.md`](docs/architecture/README.md)
4. [`docs/workflow.md`](docs/workflow.md)
5. [`docs/testing.md`](docs/testing.md)

## Non-Negotiable Rules

- Keep tasks small and decision-complete.
- Do not invent architecture outside the documented system.
- Update docs when changing public behavior or repository structure.
- Run `./scripts/validate.sh` before considering work complete.
- Prefer adding enforceable checks over adding more prose.

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
