# Launch and setup scripts

- `Install-WebAppShortcuts.ps1` installs verified Chrome app-mode Start Menu
  shortcuts for Meta AI, Google Gemini, and DeepSeek.
- `Start-AITool.ps1` launches one installed local CLI with the provider's
  approval-prompting default mode and the selected workspace.

Example:

```powershell
pwsh -NoProfile -File C:\AI-Tools\setup\scripts\Start-AITool.ps1 `
  -Tool copilot `
  -Workspace C:\AI-Tools
```

The launcher intentionally does not persist `--yolo`, `--allow-all`,
`bypassPermissions`, SYSTEM, TrustedInstaller, remote control, or sandbox
disablement. For an exceptional isolated test, pass a session-scoped provider
flag directly and keep the working directory synthetic.
