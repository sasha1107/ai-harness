# Workflow

This repo uses harness engineering as an operating workflow, not as a prompt-writing trick.

## Who Does What

- Human: sets goal, scope, and definition of done
- Agent session: reads, edits, runs checks, and interprets failures
- Repo harness: supplies docs, scripts, tests, structure rules, and CI
- CI: reruns the shared validation after the local session

## Default Loop

1. Read the relevant docs and active plan.
2. Reduce the request to a small, decision-complete change.
3. Implement only within the editable scope.
4. Run the validation entrypoint.
5. Use the first failing signal to drive the next edit.
6. Update docs, plans, or specs before handoff.

## Task Slicing Rules

Good tasks are:

- Small enough to complete in one focused change
- Bounded to named files or subsystems
- Backed by explicit acceptance criteria
- Paired with real validation commands

Avoid asking an agent to implement an entire subsystem in one shot. Split the work into domain model, interfaces, persistence, tests, docs, and rollout concerns.

## Plan Storage

- Put active implementation plans in `docs/plans/active/`.
- Move completed plans to `docs/plans/completed/`.
- If a change affects multiple subsystems, write a plan before editing code.

## PR Shape

- Prefer small PRs with one dominant purpose.
- Keep architectural refactors separate from product behavior changes.
- Include docs changes in the same PR when they describe the new behavior.

## Review Focus

Review should prioritize:

- Behavioral regressions
- Missing validation
- Architecture drift
- Scope creep
- Stale documentation

## Review To Fix Loop

Code review fits naturally into the same harness loop:

1. Agent opens a small PR.
2. A human or another agent leaves review comments.
3. Those comments become the next task input.
4. The agent fixes the scoped issues.
5. The agent reruns validation.
6. CI confirms the result.

## Escalation Rule

If the same class of failure repeats two or three times, stop retrying blindly. Narrow the task further, improve observability, or add a structure check.
