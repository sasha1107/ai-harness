# Web App Structure Example

Use a layout like this when applying the harness to a frontend or full-stack web app.

```text
src/
  app/
  features/
  components/
  services/
  domain/
tests/
  unit/
  e2e/
docs/
scripts/
```

## Notes

- Keep feature boundaries obvious.
- Put network and storage integrations behind `services/`.
- Avoid dumping domain logic into UI components.
- Keep e2e or smoke coverage separate from fast unit coverage.
