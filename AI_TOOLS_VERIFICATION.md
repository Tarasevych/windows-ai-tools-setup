# AI Tools verification

Updated: `2026-07-26T07:42:27.3906751+02:00`

| Tool | Official component | Version | Auth | Admin | FS/shell | Full-access mode | Test | Status/blocker |
|---|---|---:|---|---|---|---|---|---|
| GitHub | GitHub CLI | 2.96.0 | Tarasevych/keyring | Current shell elevated | Git/GitHub only | Not applicable | Version, auth status, API identity PASS | READY |
| Meta AI | Chrome app-mode official web shortcut | Web | Owner login pending | Browser only | No local FS/shell | Not product-supported | Shortcut/readback PASS | META_LOGIN; Model API US-only preview |
| xAI | Grok Build | 0.2.112 | Not authenticated | Current token only | Supported after login | Default Ask retained | Version + doctor PASS | OWNER_DEVICE_LOGIN |
| GitHub | Copilot CLI | 1.0.75 | Tarasevych via gh/keyring | Current token only | Supported, scoped by path/tool controls | Default prompts; no persisted allow-all | Auth + isolated file tools PASS | READY |
| Anthropic | Claude Desktop | 1.24012.1.0 | Owner login pending | App installed | Product/plan-dependent | Product boundary | Install/signature PASS | OWNER_LOGIN |
| Anthropic | Claude Code | 2.1.220 | None | Current token only | Supported after auth/trust | Default Manual retained | Signature + doctor PASS | OWNER_LOGIN_AND_ELIGIBLE_PLAN |
| Mistral | Vibe CLI | 2.22.0 | Setup pending | Current token only | Supported after auth/trust | Default agent retained | Version/help PASS | OWNER_BROWSER_OR_API_SETUP |
| Google | Gemini CLI + web shortcut | 0.52.0 | No eligible auth configured | Current token only | CLI supports tools | Default approval retained | Version/help/shortcut PASS | ENTERPRISE_OR_API_KEY_GATE |
| DeepSeek | Official web shortcut | Web | Owner web login optional | Browser only | No first-party Windows CLI | Not applicable | Shortcut/readback PASS | API_KEY_AND_PAYMENT_GATE |
| Perplexity | Comet | 150.0.7871.230 | Owner login pending | Browser only | Browser assistant, not Windows control | Not applicable | WinGet/hash/signature/Start PASS | OWNER_LOGIN; MCP API payment gate |

Installer exit alone will not be treated as acceptance. Each local agent must
pass a provider-specific synthetic test after authentication and explicit
workspace trust.

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
