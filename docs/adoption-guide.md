# Adoption Guide

Use this sequence to install the harness into an existing software repository.

## Step 1: Make The Repo Readable

- Split code by responsibility.
- Make ownership and layering obvious from the directory layout.
- Keep tests in predictable locations.

## Step 2: Install The Agent Contract

- Add `AGENTS.md` and, if needed, `CLAUDE.md`.
- Keep them short.
- Move detailed rules into versioned docs.

## Step 3: Define The Knowledge Base

- Add `docs/index.md`.
- Create architecture, workflow, testing, specs, plans, references, and generated-doc sections.
- Move important design knowledge out of chat or external notes.

## Step 4: Encode The Validation Loop

- Create a single validation entrypoint.
- Map the standard slots to real stack commands.
- Make structure and docs checks part of the same loop.

## Step 5: Encode Guardrails

- Detect forbidden dependencies or directory violations with scripts.
- Require docs updates for public behavior changes.
- Keep plan state visible in the repo.

## Step 6: Manage Drift

- Archive completed plans.
- Remove dead docs.
- Track quality debt and repetitive failures.

## Done When

- A new agent can onboard by reading the repo alone.
- Architecture rules are enforceable, not only descriptive.
- Validation failures are actionable and stage-specific.
