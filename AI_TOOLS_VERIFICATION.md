# AI Tools verification

Updated: `2026-07-26T07:16:28.9915898+02:00`

| Tool | Official component | Version | Auth | Admin | FS/shell | Full-access mode | Test | Status/blocker |
|---|---|---:|---|---|---|---|---|---|
| GitHub | GitHub CLI | 2.96.0 | Tarasevych/keyring | Current shell elevated | Git/GitHub only | Not applicable | Version, auth status, API identity PASS | READY |
| Meta AI | Web/developer review | — | Not attempted | — | Web app has none | Not product-supported for web | Pending | OFFICIAL_RESEARCH |
| xAI | Grok Build | — | Not attempted | — | Pending official verification | Pending | Pending | NOT_INSTALLED |
| GitHub | Copilot CLI | — | Not attempted | — | Pending install | Pending | Pending | NOT_INSTALLED |
| Anthropic | Claude Desktop | 1.24012.1.0 | Unverified | App installed | Product-dependent | Pending | Launch/auth pending | INSTALLED_PARTIAL |
| Anthropic | Claude Code | 2.1.217 | None | Current shell elevated | Supported after auth/trust | Not configured | Version PASS; auth FAIL | AUTH_REQUIRED |
| Mistral | Vibe CLI | — | Not attempted | — | Pending official verification | Pending | Pending | NOT_INSTALLED |
| Google | Gemini CLI | — | Not attempted | — | Supported by CLI | Pending | Pending | ACCESS_PATH_REVIEW |
| DeepSeek | Web/API integration | — | Not attempted | — | No first-party Windows CLI proven | Not applicable | Pending | API_KEY_PAYMENT_GATE |
| Perplexity | Windows client/MCP | — | Not attempted | — | MCP does not control Windows | Not applicable | Pending | PRODUCT_OR_API_GATE |

Installer exit alone will not be treated as acceptance. Each local agent must
pass a provider-specific synthetic test after authentication and explicit
workspace trust.
