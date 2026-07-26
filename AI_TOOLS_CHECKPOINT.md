# AI Tools checkpoint

Status: `PHASE_0_COMPLETE_OFFICIAL_RESEARCH_RUNNING`

Updated: `2026-07-26T07:20:27.8398417+02:00`

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

## Current action

Verify current provider-owned documentation, exact packages, Windows support,
authentication, plan/cost gates, and real permission boundaries before any
installation.

## Next safe action

Install only missing official stable components whose package provenance and
cost-free path have been verified. Preserve exact versions and installer
evidence; do not repeat `gh` setup.

## Owner-only gates

OAuth, MFA, CAPTCHA, passkey, biometric checks, Terms consent, API-key entry,
and any payment or billing action.
