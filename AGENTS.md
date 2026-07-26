# AI Tools Windows setup rules

- Use only provider-owned documentation, repositories, signed installers, or
  verified WinGet manifests.
- Preserve a secret-free inventory, verification report, and recovery
  checkpoint after every material phase.
- Never record passwords, API keys, OAuth tokens, cookies, recovery codes,
  private keys, credential-store contents, or private user data.
- Do not disable Defender, firewall, BitLocker, UAC, audit controls, sandbox
  boundaries, or approval controls as a persistent prerequisite.
- Do not create persistent SYSTEM or TrustedInstaller launchers, unattended
  auto-approve agents, credential access paths, or unrestricted destructive
  control planes.
- Use the least privilege that completes a concrete task. Elevation is allowed
  only for a scoped installation or diagnostic action with a documented
  rollback.
- Stop only the affected provider flow for OAuth, MFA, CAPTCHA, passkey,
  biometric, payment, or required secret entry; continue independent work.
- Do not create spend, enable billing, or activate a subscription without a
  separate exact owner decision.
- Acceptance tests may touch only their provider-specific synthetic test
  directory and processes created by that test.
- Before resuming, read `AI_TOOLS_CHECKPOINT.md` and verify live state; do not
  repeat successful installation or authentication.
