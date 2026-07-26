# Official AI tools for Windows

This private project preserves the reproducible, secret-free installation and
verification state for official AI clients and CLIs on Windows 11.

Primary artifacts:

- `AI_TOOLS_CHECKPOINT.md` — safe recovery point;
- `AI_TOOLS_INVENTORY.json` — machine-readable component inventory;
- `AI_TOOLS_VERIFICATION.md` — acceptance results and blockers;
- `setup/phase0-audit.json` — sanitized baseline audit;
- `SAFETY_BOUNDARY.md` — boundary between supported access and a dangerous
  persistent system backdoor.

No secrets are stored here. OAuth, API keys, and paid decisions remain separate
owner-only actions.
