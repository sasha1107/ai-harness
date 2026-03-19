# Backend Structure Example

Use a layout like this when applying the harness to a service or API repo.

```text
src/
  api/
  services/
  repositories/
  domain/
tests/
  unit/
  integration/
docs/
scripts/
```

## Notes

- Keep API handlers thin.
- Put business logic in `services/`.
- Restrict persistence code to `repositories/`.
- Place domain types and rules in `domain/`.
- Keep runtime checks and test commands visible from the repo root.
