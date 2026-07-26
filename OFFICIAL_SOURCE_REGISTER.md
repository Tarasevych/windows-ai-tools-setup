# Official source register

Snapshot: `2026-07-26`

| Provider | Official source | Verified conclusion |
|---|---|---|
| Meta | https://about.fb.com/news/2025/04/introducing-meta-ai-app-new-way-access-ai-assistant/ | Desktop route is optimized web; official app links are iOS/Android. The Model API preview is US-developer limited and is not a Windows shell agent. |
| xAI | https://docs.x.ai/build/overview | Grok Build is an official local CLI. Permission modes approve its tools but do not create Windows elevation. |
| GitHub | https://docs.github.com/en/copilot/how-tos/copilot-cli/set-up-copilot-cli/install-copilot-cli | WinGet `GitHub.Copilot` is the official Windows route. |
| GitHub | https://docs.github.com/en/copilot/how-tos/copilot-cli/use-copilot-cli/allowing-tools | `--allow-all`/`--yolo` is recommended only in isolation and not as a permanent alias. |
| Anthropic | https://code.claude.com/docs/en/installation | Native Windows Claude Code is supported. |
| Anthropic | https://code.claude.com/docs/en/permission-modes | `bypassPermissions` is for isolated containers/VMs, not a persistent host default. |
| Mistral | https://docs.mistral.ai/vibe/code/cli/install-setup | Official Windows-capable route is `uv tool install mistral-vibe`. |
| Google | https://github.com/google-gemini/gemini-cli/discussions/28017 | Individual free/Pro/Ultra accounts are no longer served by Gemini CLI; enterprise or API access is required. |
| DeepSeek | https://api-docs.deepseek.com/guides/coding_agents/ | Coding-agent routes use external host agents and API credentials; no first-party Windows CLI was established. |
| Perplexity | https://www.perplexity.ai/help-center/en/articles/14659663-what-is-personal-computer | Personal Computer local-machine control is macOS-only; Comet on Windows is a browser, not general Windows control. |

Exact installer/package versions and hashes are recorded in
`setup/install-evidence-2026-07-26.json`.
