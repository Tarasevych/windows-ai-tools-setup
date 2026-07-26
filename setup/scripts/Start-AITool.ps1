[CmdletBinding()]
param(
    [Parameter(Mandatory)]
    [ValidateSet('copilot', 'grok', 'claude', 'vibe', 'gemini')]
    [string]$Tool,

    [string]$Workspace = 'C:\AI-Tools'
)

$ErrorActionPreference = 'Stop'
$resolvedWorkspace = (Resolve-Path -LiteralPath $Workspace).Path
if (-not (Test-Path -LiteralPath $resolvedWorkspace -PathType Container)) {
    throw "Workspace is not a directory: $resolvedWorkspace"
}

Push-Location -LiteralPath $resolvedWorkspace
try {
    switch ($Tool) {
        'copilot' {
            & copilot -C $resolvedWorkspace --no-remote --no-remote-export
        }
        'grok' {
            & grok --cwd $resolvedWorkspace --permission-mode default --no-memory
        }
        'claude' {
            & claude --permission-mode default
        }
        'vibe' {
            & vibe --workdir $resolvedWorkspace --agent default --trust
        }
        'gemini' {
            & gemini --approval-mode default --skip-trust
        }
    }

    exit $LASTEXITCODE
}
finally {
    Pop-Location
}
