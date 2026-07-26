# AI Tools verification

Updated: `2026-07-26T11:25:55.4589607+02:00`

| Tool | Official component | Version | Auth | Admin | FS/shell | Full-access mode | Test | Status/blocker |
|---|---|---:|---|---|---|---|---|---|
| GitHub | GitHub CLI | 2.96.0 | Tarasevych/keyring | Current shell elevated | Git/GitHub only | Not applicable | Version, auth status, API identity PASS | READY |
| Meta AI | Chrome app-mode official web shortcut | Web | Owner login pending | Browser only | No local FS/shell | Not product-supported | Shortcut/readback PASS | META_LOGIN; Model API US-only preview |
| xAI | Grok Build | 0.2.112 | Not authenticated | Blocked while UAC off | Supported after login | Controlled default Ask; no memory | Version + doctor PASS | OWNER_DEVICE_LOGIN; UAC_GATE |
| GitHub | Copilot CLI | 1.0.75 | Tarasevych via gh/keyring | Blocked while UAC off | Approved launch directory; remote disabled; no OS sandbox | Default prompts; no persisted allow-all | Auth + isolated file tools PASS | INSTALLED; UAC_GATE |
| Anthropic | Claude Desktop | 1.24012.1.0 | Owner login pending | App installed | Product/plan-dependent | Product boundary | Install/signature PASS | OWNER_LOGIN |
| Anthropic | Claude Code | 2.1.220 | None | Blocked while UAC off | Approved launch directory; ambient MCP disabled; no OS sandbox | Manual permission mode | Signature + doctor PASS | OWNER_LOGIN; UAC_GATE |
| Mistral | Vibe CLI | 2.22.0 | Setup pending | Blocked while UAC off | Approved launch directory; no OS sandbox | Default agent + trust prompt | Version/help PASS | OWNER_SETUP; UAC_GATE |
| Google | Gemini CLI + web shortcut | 0.52.0 | No eligible auth configured | Blocked while UAC off | Approved launch directory; no OS sandbox | Default approval + trust prompt | Version/help/shortcut PASS | ENTERPRISE_OR_API_KEY; UAC_GATE |
| DeepSeek | Official web shortcut | Web | Owner web login optional | Browser only | No first-party Windows CLI | Not applicable | Shortcut/readback PASS | API_KEY_AND_PAYMENT_GATE |
| Perplexity | Comet | 150.0.7871.230 | Owner login pending | Browser only | Browser assistant, not Windows control | Not applicable | WinGet/hash/signature/Start PASS | OWNER_LOGIN; MCP API payment gate |

Installer exit alone will not be treated as acceptance. Each local agent must
pass a provider-specific synthetic test after authentication and explicit
workspace trust.

## Controlled launcher preflight

- Approved initial launch-directory root: `C:\AI-Tools\workspaces`.
- This path gate is not a filesystem sandbox. A tool approved to execute a
  shell command may still use an absolute path outside the launch directory.
- Each local CLI entry point is pinned to its verified path and SHA-256 digest;
  drift blocks launch until provenance and the policy are reviewed.
- Consumer browser apps never receive local shell or filesystem authority.
- Copilot remote control and remote export are disabled.
- Claude starts with a strict empty MCP configuration.
- Grok starts in `default` permission mode with memory disabled.
- Vibe and Gemini retain provider trust prompts.
- Persistent `allow-all`, `yolo`, `bypassPermissions`, sandbox disablement,
  SYSTEM, and TrustedInstaller modes are absent.
- Current preflight is `BLOCKED` because UAC is disabled and the current
  process is elevated. BitLocker `C:` protection off is reported separately
  as a warning. No provider process was launched during gate tests.
- Pre-existing Claude
  `skipDangerousModePermissionPrompt=true` is recorded but does not itself
  activate bypass mode.
- Controlled-launcher implementation is preserved in private commit
  `ed2ad495a5b50c298b2edc32c363d6b28fe811a3` with verified remote SHA parity.

## Security-control readback

- Defender antivirus and real-time protection: unchanged, enabled.
- Domain, Private, and Public firewall profiles: unchanged, enabled.
- UAC `EnableLUA`: unchanged at the pre-existing value `0`.
- BitLocker `C:`: unchanged, 100% encrypted with pre-existing protection
  status off.
- Persistent permissive settings: none written.
- Task-owned installer/provider processes: none remain.

## Corrected, non-repeated errors

1. The initial bulk version audit encountered an interactive/hanging command.
   Only the verified task-owned audit PID was stopped; each command was then
   checked separately.
2. The first Gemini provenance gate addressed literal npm JSON key
   `repository.url` incorrectly. No install occurred; the corrected check
   verified version, repository, integrity, and Node requirement before one
   successful install.
3. Copilot rejected `--max-ai-credits 1` because its minimum is 30. No model
   request was sent. The one corrected acceptance omitted that cap and used a
   single non-autopilot prompt with shell/URL/MCP denied.
4. `grok inspect --cwd` was rejected because `--cwd` is a top-level option.
   The corrected read-only `grok inspect` ran once.
5. Comet treats `--version` as a normal browser launch. The exact task-owned
   PID `9724` and verified Comet-only descendants were stopped; file version,
   WinGet record, hash, publisher, and valid signature remain the acceptance
   evidence.
