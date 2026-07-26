[CmdletBinding()]
param(
    [Parameter(Mandatory)]
    [ValidateSet('copilot', 'grok', 'claude', 'vibe', 'gemini')]
    [string]$Tool,

    [string]$Workspace = 'C:\AI-Tools\workspaces'
)

$ErrorActionPreference = 'Stop'

$policyPath = 'C:\AI-Tools\setup\policies\provider-policies.json'
$emptyClaudeMcpPath = 'C:\AI-Tools\setup\policies\empty-claude-mcp.json'

if (-not (Test-Path -LiteralPath $Workspace -PathType Container)) {
    throw "Workspace is not an existing directory: $Workspace"
}
if (-not (Test-Path -LiteralPath $policyPath -PathType Leaf)) {
    throw "Provider policy is missing: $policyPath"
}
if (-not (Test-Path -LiteralPath $emptyClaudeMcpPath -PathType Leaf)) {
    throw "Claude MCP deny-by-default configuration is missing: $emptyClaudeMcpPath"
}

$resolvedWorkspace = (Resolve-Path -LiteralPath $Workspace).Path.TrimEnd('\')
$policy = Get-Content -LiteralPath $policyPath -Raw | ConvertFrom-Json

$matchedRoot = $null
foreach ($allowedRoot in $policy.allowed_launch_roots) {
    if (-not (Test-Path -LiteralPath $allowedRoot -PathType Container)) {
        continue
    }

    $resolvedRoot = (Resolve-Path -LiteralPath $allowedRoot).Path.TrimEnd('\')
    if ($resolvedWorkspace.Equals(
            $resolvedRoot,
            [System.StringComparison]::OrdinalIgnoreCase
        ) -or $resolvedWorkspace.StartsWith(
            "$resolvedRoot\",
            [System.StringComparison]::OrdinalIgnoreCase
        )) {
        $matchedRoot = $resolvedRoot
        break
    }
}
if (-not $matchedRoot) {
    throw "Workspace is outside the launch-directory allowlist: $resolvedWorkspace"
}

$currentPath = Get-Item -LiteralPath $resolvedWorkspace -Force
while ($currentPath) {
    if (($currentPath.Attributes -band [IO.FileAttributes]::ReparsePoint) -ne 0) {
        throw "Workspace path contains a reparse point: $($currentPath.FullName)"
    }
    if ($currentPath.FullName.TrimEnd('\').Equals(
            $matchedRoot,
            [System.StringComparison]::OrdinalIgnoreCase
        )) {
        break
    }
    $currentPath = $currentPath.Parent
}
if (-not $currentPath) {
    throw 'Unable to prove that the workspace remains inside its matched root.'
}

$uac = Get-ItemPropertyValue -LiteralPath `
    'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System' `
    -Name EnableLUA
if ($uac -ne 1) {
    throw 'Local AI-agent launch is blocked: UAC is disabled. Enable UAC and restart Windows before running local agents.'
}

$defender = Get-MpComputerStatus
if (-not $defender.RealTimeProtectionEnabled) {
    throw 'Local AI-agent launch is blocked: Defender real-time protection is disabled.'
}

$disabledFirewallProfiles = @(
    Get-NetFirewallProfile | Where-Object { -not $_.Enabled }
)
if ($disabledFirewallProfiles.Count -gt 0) {
    throw 'Local AI-agent launch is blocked: one or more firewall profiles are disabled.'
}

$identity = [Security.Principal.WindowsIdentity]::GetCurrent()
$principal = [Security.Principal.WindowsPrincipal]::new($identity)
$isAdministrator = $principal.IsInRole(
    [Security.Principal.WindowsBuiltInRole]::Administrator
)
if ($isAdministrator) {
    throw 'Elevated AI-agent launch is blocked. Re-run from a standard, non-elevated shell.'
}

$providerPolicy = $policy.providers.$Tool
if (-not $providerPolicy -or $providerPolicy.consumer_only) {
    throw "No controlled local-agent policy exists for tool: $Tool"
}

$commandPath = [string]$providerPolicy.command_path
$commandPath = $commandPath.Replace('{LOCALAPPDATA}', $env:LOCALAPPDATA)
$commandPath = $commandPath.Replace('{APPDATA}', $env:APPDATA)
$commandPath = $commandPath.Replace('{USERPROFILE}', $env:USERPROFILE)
if (-not (Test-Path -LiteralPath $commandPath -PathType Leaf)) {
    throw "Pinned provider command is missing: $commandPath"
}

$actualCommandHash = (
    Get-FileHash -LiteralPath $commandPath -Algorithm SHA256
).Hash
if (-not $actualCommandHash.Equals(
        [string]$providerPolicy.sha256,
        [System.StringComparison]::OrdinalIgnoreCase
    )) {
    throw "Pinned provider command hash mismatch: $commandPath"
}

$toolArguments = @(
    foreach ($argument in $providerPolicy.safe_args) {
        $expandedArgument = [string]$argument
        $expandedArgument = $expandedArgument.Replace(
            '{workspace}',
            $resolvedWorkspace
        )
        $expandedArgument = $expandedArgument.Replace(
            '{empty_claude_mcp}',
            $emptyClaudeMcpPath
        )
        $expandedArgument
    }
)

Push-Location -LiteralPath $resolvedWorkspace
try {
    & $commandPath @toolArguments

    $toolExitCode = $LASTEXITCODE
    if ($null -eq $toolExitCode) {
        $toolExitCode = 0
    }
    exit $toolExitCode
}
finally {
    Pop-Location
}
