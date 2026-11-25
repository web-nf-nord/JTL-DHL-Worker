param(
    [string]$OutputFile = (Join-Path $PSScriptRoot 'production-credentials.json')
)

$ErrorActionPreference = 'Stop'

function Read-AppCredential {
    param([string]$Label, [int]$TestedLength)

    while ($true) {
        $mode = Read-Host "$Label - Z = Zwischenablage (Standard), M = manuell"
        if ($mode -eq 'M') {
            $value = Read-Host "$Label eingeben" -AsSecureString
        } elseif ($mode -eq 'Z' -or $mode -eq '') {
            [void](Read-Host "$Label im DHL Developer Portal kopieren, dann hier nur Enter druecken")
            $clipboard = ([string](Get-Clipboard -Raw)).Trim()
            if ($clipboard.Length -le 1 -or $clipboard -match '\s') {
                Write-Warning "Zwischenablage: $($clipboard.Length) Zeichen. Bitte den vollstaendigen Wert erneut kopieren."
                continue
            }
            $value = ConvertTo-SecureString -String $clipboard -AsPlainText -Force
            $clipboard = $null
        } else {
            continue
        }

        Write-Host "$Label eingelesen: $($value.Length) Zeichen (beim erfolgreichen Test: $TestedLength)"
        if ($value.Length -gt 1) {
            $confirm = Read-Host 'Diesen Wert uebernehmen? J = ja, Enter = erneut eingeben'
            if ($confirm -eq 'J') { return $value }
        } else {
            Write-Warning 'Zu wenige Zeichen. Bitte erneut eingeben.'
        }
        $value.Dispose()
    }
}

$apiKey = Read-AppCredential -Label 'DHL Production API Key' -TestedLength 48
$apiSecret = Read-AppCredential -Label 'DHL Production API Secret' -TestedLength 64
$username = Read-Host 'DHL Production Benutzername'
$password = Read-Host 'DHL Production Passwort' -AsSecureString
if ([string]::IsNullOrWhiteSpace($username) -or $password.Length -eq 0) {
    throw 'Benutzername und Passwort muessen ausgefuellt sein.'
}

function Protect-Secure([Security.SecureString]$Value) {
    if (-not $Value) { return '' }
    return ($Value | ConvertFrom-SecureString)
}

$obj = [ordered]@{
    ApiKey    = (Protect-Secure $apiKey)
    ApiSecret = (Protect-Secure $apiSecret)
    Username  = (($username | ConvertTo-SecureString -AsPlainText -Force) | ConvertFrom-SecureString)
    Password  = (Protect-Secure $password)
}

$obj | ConvertTo-Json | Set-Content -LiteralPath $OutputFile -Encoding UTF8
Write-Host "Production-Zugang verschluesselt gespeichert: $OutputFile"
Write-Host 'Wichtig: Die Datei ist an das Windows-Benutzerkonto gebunden, unter dem sie erstellt wurde.'