# Agent Contract

This document is the shared operating contract for all coding agents that work in a repo adopting this template.

## Plain-Language Model

To avoid confusion:

- The agent session is the worker.
- The harness is the environment around the worker.
- Scripts are tools inside that environment.
- CI reruns the same checks after the local session.

The harness is bigger than any single shell command.

## Repository Role

- The repository is the system of record.
- Durable context must live in versioned files.
- Human direction sets goals; agents implement within explicit boundaries.

## Required Inputs For Any Task

Every task must include:

- Goal
- Editable scope
- Acceptance criteria
- Validation commands
- Follow-ups

Tasks missing these fields should be clarified or reduced before implementation.

## Execution Rules

- Prefer the smallest change that satisfies the goal.
- Keep PRs narrow enough that failures are easy to diagnose.
- Do not expand scope without recording the reason in the relevant plan or spec.
- Update docs, specs, or changelog material whenever public behavior changes.

## Architecture Rules

- Keep architecture decisions documented under `docs/architecture/`.
- Encode important structure rules with validation scripts whenever possible.
- Do not create new subsystems without adding the matching docs entry.

## Validation Rules

- Use a single top-level validation entrypoint.
- Validation should report failures by stage, not as one opaque log.
- Standard validation slots are `lint`, `typecheck`, `test`, `build`, `smoke`, and `observe`.
- Application repos may omit `observe`, but the slot should remain reserved.
- A shell script is only one way to invoke validation. The contract is the loop, not the script.

## Feedback Loop Levels

### Level 1: Static and Test Loop

- Run `lint`, `typecheck`, `test`, and `build`.
- Fix the first failing stage before widening scope.

### Level 2: Runtime Loop

- Restart the app or service.
- Re-run smoke tests or key user journeys.
- Compare the actual runtime behavior with the acceptance criteria.

### Level 3: Observability Loop

- Query logs, metrics, or traces after replaying a workload.
- Use runtime signals to localize the defect before editing code.
- Reserve this level for repos that already maintain observability tooling.

## Drift Management

- Keep active plans current.
- Archive completed plans.
- Delete or update stale docs before adding replacement guidance.
- Add script checks for recurring architecture or process mistakes.

## Handoff Rules

- Final handoff should name the validation commands run.
- If validation was skipped, say so explicitly and state why.
- Record known follow-up work instead of hiding it in chat history.
- Review comments should be treated as a new scoped task, then run through the same validation loop.
