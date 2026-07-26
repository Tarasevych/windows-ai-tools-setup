# AI Tools checkpoint

Status: `IN_PROGRESS_CONTROLLED_LAUNCHER_VALIDATION`

Updated: `2026-07-26T11:22:02.9132583+02:00`

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
- The verified installation/evidence phase is commit
  `a5f60172e8dd907986af01206d8bfa3d6f8af744`, tree
  `2c7ae4874e8567ad11c8ab2c644e1e052760f245`, pushed to private `origin/main`
  with exact local/remote SHA parity.
- A controlled launcher policy now limits the initial launch directory to
  `C:\AI-Tools\workspaces`, keeps provider approval and trust prompts, disables
  remote control and ambient Claude MCP, and refuses persistent permission
  bypasses. This is not an OS filesystem sandbox; prompted shell tools may
  still address absolute paths.
- Local CLI entry points are pinned to their verified paths and SHA-256
  digests. The launcher fails closed if an executable or wrapper drifts.
- The read-only preflight confirms all six CLIs remain installed. It blocks
  local-agent launch because UAC is disabled and the current process is
  elevated. BitLocker `C:` protection off is separately reported as a warning.
  Defender real-time protection and all firewall profiles remain enabled.
- Existing Claude configuration contains
  `skipDangerousModePermissionPrompt=true`. This does not activate
  `bypassPermissions`, was not created or changed by this project, and is
  recorded as a pre-existing warning-suppression risk.

## Current action

Controlled-launcher hardening is implemented and under final validation.
Interactive provider acceptance remains paused at the first owner-only Meta
sign-in gate. Local CLI sessions are additionally blocked until UAC is
restored and Windows has restarted.

## Resume verification (2026-07-26 10:25 CEST)

- Re-read the canonical checkpoint before acting and confirmed the repository
  working tree was clean.
- Verified local `main`, `origin/main`, and the remote `main` ref all pointed
  to `64771769b479c762c5908472c1cb6635d8adaaaf` before this checkpoint update.
- Re-verified the source masterprompt SHA-256 as
  `937bf6115b1497f9ee7ecf89b5d48d0647e017ca40a26e895485024dcb7f1113`.
- Live command readback remained unchanged for GitHub CLI `2.96.0`, Copilot
  CLI `1.0.75`, Grok Build `0.2.112`, Claude Code `2.1.220`, Mistral Vibe
  `2.22.0`, and Gemini CLI `0.52.0`; Comet remains installed as
  `150.0.7871.230`.
- GitHub identity remains `Tarasevych` with credentials in the Windows
  keyring. Claude Code reports `loggedIn: false`.
- Defender antivirus, real-time protection, behavior monitoring, IOAV
  protection, and all firewall profiles remain enabled. UAC `EnableLUA=0`
  and BitLocker `C:` protection off remain pre-existing, unchanged states.
- The Windows Computer Use runtime was unavailable, and the policy-controlled
  fallback did not execute the Meta shortcut. No browser, credential,
  security-policy, service, task, or provider state was changed.

## Controlled-launcher verification (2026-07-26 11:11 CEST)

- PowerShell parser PASS for all setup scripts.
- JSON parsing PASS for all setup evidence and provider policy files.
- Read-only preflight PASS and correctly reported
  `UAC_DISABLED_REBOOT_REQUIRED_AFTER_REENABLE`,
  `CURRENT_PROCESS_ELEVATED`, plus the
  `BITLOCKER_C_PROTECTION_OFF` warning.
- Negative gate tests PASS: a path outside the launch-directory allowlist, a
  reparse-point launch path, and a local agent launch while UAC is disabled
  all failed before any provider process started.
- Git object integrity PASS; the pre-change repository state was clean and
  local `main` matched remote `origin/main` at
  `081401f8a117882ebcd51ab87c79cb842aa7c708`.

## Next safe action

Decide whether to restore UAC and BitLocker protection. UAC must be enabled
and Windows restarted before any controlled local-agent session. Separately,
open `Start` → `AI Tools` → `Meta AI` and complete the official Meta sign-in
without sharing credentials. After those owner actions, run the preflight and
continue once through the remaining provider gates without repeating
completed installs.

## Owner-only gates

OAuth, MFA, CAPTCHA, passkey, biometric checks, Terms consent, API-key entry,
and any payment or billing action. Meta Model API is additionally blocked by
the official US-developer preview region restriction. Gemini CLI requires an
eligible Enterprise Code Assist or API-key route; DeepSeek and Perplexity API
integrations require keys and potentially paid balance. No billing was enabled.

Restoring UAC requires an owner-approved system change and reboot. Re-enabling
BitLocker protection requires the owner to verify recovery-key availability
first. Neither action was performed automatically.
