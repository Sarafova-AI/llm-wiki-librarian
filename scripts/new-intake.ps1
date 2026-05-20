param(
    [string]$Provider,
    [string]$Surface,
    [string]$SourceDate,
    [string]$Project = "default",
    [string]$Title,
    [string]$NativeUrl = "",
    [string]$PrivacyLevel = "internal",
    [switch]$NoOpen
)

$ErrorActionPreference = "Stop"

function Prompt-IfMissing {
    param([string]$Value, [string]$Prompt, [string]$Default = "")
    if (-not [string]::IsNullOrWhiteSpace($Value)) { return $Value.Trim() }
    if ([string]::IsNullOrWhiteSpace($Default)) { return (Read-Host $Prompt).Trim() }
    $answer = Read-Host "$Prompt [$Default]"
    if ([string]::IsNullOrWhiteSpace($answer)) { return $Default }
    return $answer.Trim()
}

function ConvertTo-Slug {
    param([string]$Text)
    $slug = $Text.ToLowerInvariant() -replace '[^a-z0-9]+', '-'
    $slug = $slug.Trim('-')
    if ([string]::IsNullOrWhiteSpace($slug)) { return "untitled" }
    return $slug
}

$Root = (Resolve-Path (Join-Path $PSScriptRoot "..")).Path
$InboxRoot = Join-Path $Root "inbox"
New-Item -ItemType Directory -Path $InboxRoot -Force | Out-Null

Write-Host ""
Write-Host "Add source to LLM Wiki Librarian" -ForegroundColor Cyan
Write-Host ""

$Provider = Prompt-IfMissing $Provider "Provider (Claude, ChatGPT, Codex, PowerShell, human note)"
$Surface = Prompt-IfMissing $Surface "Surface (web, mobile app, desktop app, terminal, voice note, document)" "desktop app"
$SourceDate = Prompt-IfMissing $SourceDate "Source date (YYYY-MM-DD)"
$Project = Prompt-IfMissing $Project "Project" "default"
$Title = Prompt-IfMissing $Title "Short title"
$PrivacyLevel = Prompt-IfMissing $PrivacyLevel "Privacy level (private, internal, publishable, unknown)" "internal"

if ($SourceDate -notmatch '^\d{4}-\d{2}-\d{2}') {
    throw "SourceDate must start with YYYY-MM-DD."
}

$datePart = $SourceDate.Substring(0, 10)
$fileName = "$datePart-$(ConvertTo-Slug $Provider)-$(ConvertTo-Slug $Surface)-$(ConvertTo-Slug $Project)-$(ConvertTo-Slug $Title).md"
$packetPath = Join-Path $InboxRoot $fileName

$today = Get-Date -Format "yyyy-MM-dd"
$packet = @"
---
title: $Title
source_provider: $Provider
source_surface: $Surface
source_date: $SourceDate
native_url: $NativeUrl
project: $Project
privacy_level: $PrivacyLevel
created_for_import: $today
status: inbox
---

# $Title

BRAIN_IMPORT_PACKET
source_provider: $Provider
source_surface: $Surface
source_date: $SourceDate
native_url: $NativeUrl
project: $Project
title: $Title
privacy_level: $PrivacyLevel
why_this_matters:
key_takeaways:
candidate_tags:
candidate_wikilinks:
limitations:
raw_transcript_or_source_text:

PASTE THE RAW CHAT, NOTE, TERMINAL TRANSCRIPT, OR SOURCE TEXT BELOW THIS LINE.

"@

$utf8NoBom = New-Object System.Text.UTF8Encoding $false
[System.IO.File]::WriteAllText($packetPath, $packet, $utf8NoBom)

Write-Host "Created: $packetPath" -ForegroundColor Green
Write-Host "Paste raw text, save, then ask your agent: Librarian, process the inbox."

if (-not $NoOpen) {
    Start-Process -FilePath "notepad.exe" -ArgumentList "`"$packetPath`""
}
