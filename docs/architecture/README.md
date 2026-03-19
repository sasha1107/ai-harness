# Architecture

This folder holds the durable architecture rules for a repo adopting this harness.

## Core Principles

- Optimize for application legibility and agent legibility.
- Make boundaries visible in the directory structure.
- Keep the direction of dependencies obvious.
- Prefer boring, readable abstractions over opaque magic.

## Minimum Expectations

- Name the main layers or subsystems.
- Document forbidden dependency edges.
- Document where new code should go.
- Document where tests belong.

## Enforceable Rules

Architecture docs should eventually map to script checks. Examples:

- database access only in repository layer
- API routes remain thin
- shared types live in a single stable location

If a rule matters enough to repeat in review, add a check for it.
