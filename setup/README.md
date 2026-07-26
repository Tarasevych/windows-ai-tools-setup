# Setup evidence

This directory contains secret-free audit data, reproducible setup scripts,
provider policies, rollback guidance, and provider-specific synthetic
acceptance fixtures. It must never contain real mail, credentials, browser
profiles, tokens, cookies, or private user documents.

Run the read-only preflight before launching a local agent:

```powershell
pwsh -NoProfile -File C:\AI-Tools\setup\scripts\Test-AIToolPreflight.ps1 `
  -Tool copilot
```

The controlled launcher accepts only descendants of
`C:\AI-Tools\workspaces` as initial launch directories. This is not an OS
filesystem sandbox: separately approved shell tools can still use absolute
paths. Consumer web shortcuts remain browser-only and do not receive local
filesystem or shell authority.
