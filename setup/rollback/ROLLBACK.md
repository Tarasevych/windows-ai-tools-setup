# Controlled launcher rollback

This phase changes only files tracked in the private `C:\AI-Tools` repository.
It does not modify credentials, provider accounts, Windows security policies,
services, scheduled tasks, Defender, firewall, UAC, or BitLocker.

Before rollback, record the current state:

```powershell
git -C C:\AI-Tools status --short --branch
git -C C:\AI-Tools rev-parse HEAD
```

Review the target commit before restoring. Restore only the task-owned paths:

```powershell
git -C C:\AI-Tools restore --source <verified-commit> -- `
  .gitignore `
  AI_TOOLS_CHECKPOINT.md `
  AI_TOOLS_INVENTORY.json `
  AI_TOOLS_VERIFICATION.md `
  README_EN.md `
  README_UK.md `
  SAFETY_BOUNDARY.md `
  setup\README.md `
  setup\scripts\README.md `
  setup\scripts\Start-AITool.ps1 `
  setup\scripts\Test-AIToolPreflight.ps1 `
  setup\policies `
  setup\rollback\ROLLBACK.md `
  workspaces\README.md
```

Do not remove provider credentials, applications, services, scheduled tasks,
or user configuration as part of this rollback. Those items are outside this
phase and may predate the project.
