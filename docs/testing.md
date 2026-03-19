# Testing And Validation

Validation is the core feedback loop of the harness.

## First Principle

The important thing is not the shell script itself. The important thing is that the repo has one repeatable way to ask, "Did this change actually work?"

In many repos that entrypoint will be a shell script such as `./scripts/validate.sh`. In others it could be `make validate`, `just validate`, `npm run validate`, or another command. The harness pattern stays the same.

## Validation Slots

Application repos that adopt this template should map these slots to concrete commands:

- `lint`
- `typecheck`
- `test`
- `build`
- `smoke`
- `observe`

## Default Sequence

Run validation from a single entrypoint such as `./scripts/validate.sh`.

Suggested order:

1. Structure checks
2. Documentation checks
3. Lint
4. Typecheck
5. Unit and integration tests
6. Build
7. Smoke tests
8. Observability queries, when available

## Failure Handling

- Stop at the first failing stage when diagnosing a new issue.
- Summarize errors by stage and file, not by dumping raw logs.
- Fix the narrowest cause before rerunning the full sequence.

## Review Failures Are Also Inputs

Review comments and CI failures should be treated the same way as test failures:

- identify the scoped issue
- make the smallest fix
- rerun validation
- hand off with the updated result

## Three-Level Feedback Model

### Level 1

- Static analysis and tests
- Mandatory for every repo

### Level 2

- App startup and smoke tests
- Recommended for apps with user-facing flows or service contracts

### Level 3

- Runtime observability from logs, metrics, and traces
- Optional extension for mature systems that already expose these signals

## Guardrails

- Do not merge public behavior changes without matching tests or an explicit justification.
- Do not add a new subsystem without defining how it is validated.
- Prefer scriptable validation over manual review steps.
