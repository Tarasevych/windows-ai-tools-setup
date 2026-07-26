[CmdletBinding()]
param()

$ErrorActionPreference = 'Stop'

$chromePath = 'C:\Program Files\Google\Chrome\Application\chrome.exe'
if (-not (Test-Path -LiteralPath $chromePath -PathType Leaf)) {
    throw "Verified Chrome executable is missing: $chromePath"
}

$chrome = Get-Item -LiteralPath $chromePath
$signature = Get-AuthenticodeSignature -LiteralPath $chromePath
if ($chrome.VersionInfo.CompanyName -ne 'Google LLC' -or
    $signature.Status -ne [System.Management.Automation.SignatureStatus]::Valid) {
    throw 'Chrome publisher or Authenticode validation failed.'
}

$startMenu = Join-Path $env:APPDATA 'Microsoft\Windows\Start Menu\Programs\AI Tools'
$null = New-Item -ItemType Directory -Path $startMenu -Force
$shell = New-Object -ComObject WScript.Shell

$apps = @(
    [pscustomobject]@{
        Name = 'Meta AI'
        Url = 'https://www.meta.ai/'
        Description = 'Official Meta AI web app in Chrome app mode'
    },
    [pscustomobject]@{
        Name = 'Google Gemini'
        Url = 'https://gemini.google.com/'
        Description = 'Official Google Gemini web app in Chrome app mode'
    },
    [pscustomobject]@{
        Name = 'DeepSeek'
        Url = 'https://chat.deepseek.com/'
        Description = 'Official DeepSeek web app in Chrome app mode'
    }
)

$created = foreach ($app in $apps) {
    $shortcutPath = Join-Path $startMenu "$($app.Name).lnk"
    $shortcut = $shell.CreateShortcut($shortcutPath)
    $shortcut.TargetPath = $chromePath
    $shortcut.Arguments = "--app=`"$($app.Url)`""
    $shortcut.WorkingDirectory = Split-Path -Parent $chromePath
    $shortcut.IconLocation = "$chromePath,0"
    $shortcut.Description = $app.Description
    $shortcut.Save()

    $readback = $shell.CreateShortcut($shortcutPath)
    if ($readback.TargetPath -ne $chromePath -or
        $readback.Arguments -ne "--app=`"$($app.Url)`"") {
        throw "Shortcut readback failed: $shortcutPath"
    }

    [pscustomobject]@{
        name = $app.Name
        url = $app.Url
        shortcut = $shortcutPath
        target = $readback.TargetPath
        arguments = $readback.Arguments
    }
}

$created
