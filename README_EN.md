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
- `setup/policies/provider-policies.json` — initial-directory allowlist and
  safe session defaults for local agents;
- `setup/scripts/Test-AIToolPreflight.ps1` — read-only launch preflight;
- `workspaces/` — the controlled launcher's approved initial-directory root.

No secrets are stored here. OAuth, API keys, and paid decisions remain separate
owner-only actions.

Local agents are currently launch-blocked because UAC was already disabled
before this project. BitLocker `C:` protection off is reported separately as
a warning. Restoring those controls requires a separate owner decision and,
for UAC, a Windows restart.

The launch-directory allowlist is not an OS sandbox: after separate approval,
a shell tool can technically address an absolute path outside `workspaces`.
