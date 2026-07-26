# Launch and setup scripts

- `Install-WebAppShortcuts.ps1` installs verified Chrome app-mode Start Menu
  shortcuts for Meta AI, Google Gemini, and DeepSeek.
- `Start-AITool.ps1` launches one installed local CLI with the provider's
  approval-prompting default mode from an allowlisted initial directory.
- `Test-AIToolPreflight.ps1` performs a read-only, secret-free security and
  version preflight before a local agent is launched. Pass `-Tool` to make a
  missing or failed requested CLI an explicit blocker.

Example:

```powershell
pwsh -NoProfile -File C:\AI-Tools\setup\scripts\Start-AITool.ps1 `
  -Tool copilot `
  -Workspace C:\AI-Tools\workspaces\example-project
```

```powershell
pwsh -NoProfile -File C:\AI-Tools\setup\scripts\Test-AIToolPreflight.ps1 `
  -Tool copilot
```

The launcher intentionally does not persist `--yolo`, `--allow-all`,
`bypassPermissions`, SYSTEM, TrustedInstaller, remote control, or sandbox
disablement. It refuses local-agent launch while UAC is disabled, refuses an
elevated shell, and does not accept paths outside
`C:\AI-Tools\workspaces` as initial directories. This path gate is not an OS
filesystem sandbox.
