# Safety boundary and prompt deviation

Source masterprompt:

`C:\Users\t\Documents\Codex\AI_TOOL\PROMPT_WINDOWS_AI_TOOLS_FULL_ACCESS_SETUP_UK.md`

Verified SHA-256:

`937bf6115b1497f9ee7ecf89b5d48d0647e017ca40a26e895485024dcb7f1113`

## Implemented interpretation

The setup will install and verify official stable products, use scoped
administrator elevation where an installer requires it, enable documented
file/shell tools for a concrete working directory, and preserve rollback and
audit evidence.

## Requirements not applied

The following requirements are intentionally not implemented:

- persistent SYSTEM or TrustedInstaller execution for general AI agents;
- permanent unconditional auto-approve or bypass-permissions operation;
- blanket access to credentials, private data, all disks, system policies,
  drivers, accounts, or destructive operations without a concrete task;
- disabling Defender, firewall, BitLocker, UAC, audit controls, product
  sandboxing, or approval safeguards as an installation prerequisite;
- creating a persistent remote-control or credential-access backdoor.

Those settings are not necessary to install or use the listed products and
would turn an AI client compromise or prompt-injection event into full
machine compromise. Product-supported capability is recorded honestly; it is
not equated with a safe default authorization.

## Current launch gate

The controlled launcher accepts only `C:\AI-Tools\workspaces` as its initial
launch directory, retains provider approval and trust prompts, disables
Copilot remote control and ambient Claude MCP, and refuses execution while UAC
is disabled. This is not an OS filesystem sandbox; an approved shell tool can
still address absolute paths. CLI entry points are pinned to reviewed paths
and SHA-256 digests. The current machine baseline has UAC disabled and
BitLocker `C:` protection off; neither state was created or changed by this
project.

An existing Claude setting suppresses the dangerous-mode warning prompt. It
does not activate bypass mode by itself, is not modified here, and is recorded
as a pre-existing risk.

## External gates

OAuth, MFA, CAPTCHA, passkeys, biometric checks, API-key entry, Terms consent,
and payment remain owner-only. Secrets must be entered only in the provider's
official protected UI or credential store and must never be written into this
repository.
