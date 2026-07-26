# AI Tools checkpoint

Status: `OWNER_ACTION_REQUIRED_META_AI_LOGIN_FIRST`

Updated: `2026-07-26T07:42:27.3906751+02:00`

## Objective

Install and verify official Windows AI clients and CLIs for Meta AI, xAI,
GitHub Copilot, Anthropic, Mistral, Google Gemini, DeepSeek, and Perplexity,
without secrets, unapproved spend, persistent security-control bypasses, or
unattended system-level backdoors.

## Verified progress

- Source masterprompt exists and its SHA-256 matches
  `937bf6115b1497f9ee7ecf89b5d48d0647e017ca40a26e895485024dcb7f1113`.
- Phase 0 read-only audit completed and is recorded in
  `setup/phase0-audit.json`.
- GitHub CLI `2.96.0` is already installed, current in the verified WinGet
  manifest, and authenticated as `Tarasevych` through the Windows keyring.
  No reinstall or repeated OAuth is needed.
- Claude Desktop `1.24012.1.0` and Claude Code `2.1.217` already exist.
  Claude Code is not authenticated; WinGet advertises `2.1.218`.
- Grok, Copilot CLI, Mistral Vibe, Gemini CLI, and provider-specific
  DeepSeek/Perplexity CLIs were absent from PATH at audit time.
- Defender real-time protection and all firewall profiles are enabled.
  UAC was already disabled before this task. BitLocker `C:` was encrypted but
  protection was already off. No security baseline setting has been changed.
- The secret-free baseline is committed as
  `0e2c7e4517a508f14e29d1a7e40768947f6f8feb` and pushed with exact SHA parity
  to private repository
  `https://github.com/Tarasevych/windows-ai-tools-setup`.
- Installed and verified:
  - GitHub Copilot CLI `1.0.75`, valid GitHub signature;
  - Grok Build `0.2.112`, exact xAI npm integrity;
  - Mistral Vibe `2.22.0` through `uv tool`;
  - Gemini CLI `0.52.0`, exact Google npm integrity;
  - Claude Code updated from `2.1.217` to `2.1.220`, valid Anthropic
    signature and `claude doctor` PASS;
  - Perplexity Comet `150.0.7871.230`, valid Perplexity signature.
- Start Menu entries under `AI Tools` were created and read back for Meta AI,
  Google Gemini, and DeepSeek using only official HTTPS URLs in signed Google
  Chrome app mode.
- Copilot reused the existing `Tarasevych` GitHub keyring identity and passed
  a no-shell, no-URL, isolated file read/write acceptance test. The generated
  test files were removed.
- No persistent `allow-all`, `yolo`, `bypassPermissions`, sandbox-disable,
  SYSTEM, TrustedInstaller, remote-control, or credential-access setting was
  written.
- Post-install readback confirms Defender, firewall, UAC, and BitLocker
  baseline values are unchanged. No installer or provider process remains.

## Current action

All owner-independent installation, provenance, doctor, safe launcher,
security-baseline, and local acceptance work is complete. The first provider
in the required order is paused at Meta account sign-in.

## Next safe action

Open `Start` → `AI Tools` → `Meta AI`, complete the official Meta sign-in
without sharing credentials in chat, then reply `Готово`. After that, verify
Meta and continue once through Grok, Claude, Mistral, Gemini, DeepSeek, and
Perplexity owner-only gates without repeating completed installs.

## Owner-only gates

OAuth, MFA, CAPTCHA, passkey, biometric checks, Terms consent, API-key entry,
and any payment or billing action. Meta Model API is additionally blocked by
the official US-developer preview region restriction. Gemini CLI requires an
eligible Enterprise Code Assist or API-key route; DeepSeek and Perplexity API
integrations require keys and potentially paid balance. No billing was enabled.
