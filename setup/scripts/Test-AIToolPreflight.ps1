[CmdletBinding()]
param(
    [ValidateSet('copilot', 'grok', 'claude', 'vibe', 'gemini')]
    [string]$Tool
)

$ErrorActionPreference = 'Stop'

function Get-CommandVersion {
    param(
        [Parameter(Mandatory)]
        [string]$Name
    )

    $command = @(
        Get-Command -Name $Name -CommandType Application `
            -ErrorAction SilentlyContinue
    ) | Select-Object -First 1
    if (-not $command) {
        return $null
    }

    $output = & $command.Source --version 2>&1
    if ($LASTEXITCODE -ne 0) {
        return 'VERSION_PROBE_FAILED'
    }
    return (($output | Select-Object -First 1) -as [string]).Trim()
}

$identity = [Security.Principal.WindowsIdentity]::GetCurrent()
$principal = [Security.Principal.WindowsPrincipal]::new($identity)
$isAdministrator = $principal.IsInRole(
    [Security.Principal.WindowsBuiltInRole]::Administrator
)

$uac = Get-ItemPropertyValue -LiteralPath `
    'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System' `
    -Name EnableLUA
$defender = Get-MpComputerStatus
$firewall = @(Get-NetFirewallProfile | Select-Object Name, Enabled)
$bitLocker = Get-BitLockerVolume -MountPoint 'C:'

$claudeWarningBypass = $false
$claudeSettingsPath = Join-Path $env:USERPROFILE '.claude\settings.json'
if (Test-Path -LiteralPath $claudeSettingsPath -PathType Leaf) {
    $claudeSettings = Get-Content -LiteralPath $claudeSettingsPath -Raw |
        ConvertFrom-Json
    $claudeWarningBypass = [bool](
        $claudeSettings.skipDangerousModePermissionPrompt
    )
}

$toolVersions = [ordered]@{
    gh = Get-CommandVersion -Name 'gh'
    copilot = Get-CommandVersion -Name 'copilot'
    grok = Get-CommandVersion -Name 'grok'
    claude = Get-CommandVersion -Name 'claude'
    vibe = Get-CommandVersion -Name 'vibe'
    gemini = Get-CommandVersion -Name 'gemini'
}

$toolReady = $true
$toolBlockers = @()
$requestedToolIntegrity = $null
if ($Tool) {
    $requestedVersion = $toolVersions[$Tool]
    if (-not $requestedVersion) {
        $toolReady = $false
        $toolBlockers += "REQUESTED_TOOL_MISSING_$($Tool.ToUpperInvariant())"
    }
    elseif ($requestedVersion -eq 'VERSION_PROBE_FAILED') {
        $toolReady = $false
        $toolBlockers += "REQUESTED_TOOL_VERSION_FAILED_$($Tool.ToUpperInvariant())"
    }

    $policyPath = Join-Path $PSScriptRoot '..\policies\provider-policies.json'
    $policy = Get-Content -LiteralPath $policyPath -Raw | ConvertFrom-Json
    $providerPolicy = $policy.providers.$Tool
    $pinnedPath = [string]$providerPolicy.command_path
    $pinnedPath = $pinnedPath.Replace('{LOCALAPPDATA}', $env:LOCALAPPDATA)
    $pinnedPath = $pinnedPath.Replace('{APPDATA}', $env:APPDATA)
    $pinnedPath = $pinnedPath.Replace('{USERPROFILE}', $env:USERPROFILE)

    if (-not (Test-Path -LiteralPath $pinnedPath -PathType Leaf)) {
        $toolReady = $false
        $requestedToolIntegrity = 'MISSING'
        $toolBlockers += "REQUESTED_TOOL_PINNED_PATH_MISSING_$($Tool.ToUpperInvariant())"
    }
    else {
        $actualHash = (
            Get-FileHash -LiteralPath $pinnedPath -Algorithm SHA256
        ).Hash
        if (-not $actualHash.Equals(
                [string]$providerPolicy.sha256,
                [System.StringComparison]::OrdinalIgnoreCase
            )) {
            $toolReady = $false
            $requestedToolIntegrity = 'HASH_MISMATCH'
            $toolBlockers += "REQUESTED_TOOL_HASH_MISMATCH_$($Tool.ToUpperInvariant())"
        }
        else {
            $requestedToolIntegrity = 'PASS'
        }
    }
}

$result = [ordered]@{
    schema_version = '1.0.0'
    captured_at = (Get-Date).ToString('o')
    safe_local_agent_launch = (
        $uac -eq 1 -and
        -not $isAdministrator -and
        $defender.RealTimeProtectionEnabled -and
        (@($firewall | Where-Object { -not $_.Enabled }).Count -eq 0) -and
        $toolReady
    )
    blockers = @(
        if ($uac -ne 1) { 'UAC_DISABLED_REBOOT_REQUIRED_AFTER_REENABLE' }
        if ($isAdministrator) { 'CURRENT_PROCESS_ELEVATED' }
        if (-not $defender.RealTimeProtectionEnabled) {
            'DEFENDER_REALTIME_DISABLED'
        }
        if (@($firewall | Where-Object { -not $_.Enabled }).Count -gt 0) {
            'FIREWALL_PROFILE_DISABLED'
        }
        $toolBlockers
    )
    warnings = @(
        if ($bitLocker.ProtectionStatus -ne 'On') {
            'BITLOCKER_C_PROTECTION_OFF'
        }
        if ($claudeWarningBypass) {
            'CLAUDE_DANGEROUS_MODE_WARNING_SUPPRESSED'
        }
    )
    windows = [ordered]@{
        identity = $identity.Name
        current_process_elevated = $isAdministrator
        uac_enable_lua = $uac
        defender_realtime = $defender.RealTimeProtectionEnabled
        firewall_profiles = $firewall
        bitlocker_c_protection = [string]$bitLocker.ProtectionStatus
    }
    existing_config_risks = [ordered]@{
        claude_skip_dangerous_mode_permission_prompt = $claudeWarningBypass
    }
    requested_tool = $Tool
    requested_tool_integrity = $requestedToolIntegrity
    tools = $toolVersions
}

$result | ConvertTo-Json -Depth 8
