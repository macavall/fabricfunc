#!/usr/bin/env pwsh
# myhook - sessionStart hook (PowerShell)
#
# Runs when a Copilot agent session starts. It logs the event and injects the
# current git branch into the session as additionalContext.
#
# Contract:
#   stdin : JSON payload describing the sessionStart event
#   stdout: JSON with an "additionalContext" field (injected into the session)
#   exit 0: success (non-zero would signal hook failure)
$ErrorActionPreference = 'Stop'

# Read the event payload (unused here, but available for customization).
$payload = [Console]::In.ReadToEnd()

$logDir = './.github/hooks/logs'
New-Item -ItemType Directory -Force -Path $logDir | Out-Null
$timestamp = (Get-Date).ToUniversalTime().ToString('yyyy-MM-ddTHH:mm:ssZ')
Add-Content -Path (Join-Path $logDir 'myhook.log') -Value "$timestamp myhook: session started"

# Determine the current git branch, if this is a git repository.
$branch = 'unknown'
if (Get-Command git -ErrorAction SilentlyContinue) {
    git rev-parse --is-inside-work-tree 2>$null | Out-Null
    if ($LASTEXITCODE -eq 0) {
        $branch = (git rev-parse --abbrev-ref HEAD 2>$null)
        if (-not $branch) { $branch = 'unknown' }
    }
}

# Emit context that Copilot injects into the session conversation.
$context = @{ additionalContext = "Current git branch: $branch" } | ConvertTo-Json -Compress
Write-Output $context

exit 0
