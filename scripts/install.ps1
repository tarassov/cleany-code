param(
    [Parameter(Mandatory = $true)]
    [ValidateSet('codex', 'claude')]
    [string]$Client,

    [ValidateSet('user', 'project')]
    [string]$Scope = 'user',

    [ValidatePattern('^[a-z0-9]+(-[a-z0-9]+)*$')]
    [string]$Skill
)

$ErrorActionPreference = 'Stop'

$clientDir = if ($Client -eq 'codex') { '.agents' } else { '.claude' }
$basePath = if ($Scope -eq 'user') { $HOME } else { (Get-Location).ProviderPath }
$installRoot = Join-Path (Join-Path $basePath $clientDir) 'skills'
$sourceRoot = Join-Path (Split-Path -Parent $PSScriptRoot) 'skills'

$sources = @(Get-ChildItem -LiteralPath $sourceRoot -Directory | Where-Object {
    (-not $Skill -or $_.Name -ceq $Skill) -and
        (Test-Path -LiteralPath (Join-Path $_.FullName 'SKILL.md') -PathType Leaf)
})

if ($sources.Count -eq 0) {
    throw "No matching skill found in $sourceRoot"
}

foreach ($source in $sources) {
    $destination = Join-Path $installRoot $source.Name
    [System.IO.Directory]::CreateDirectory($destination) | Out-Null
    foreach ($item in Get-ChildItem -LiteralPath $source.FullName -Force) {
        Copy-Item -LiteralPath $item.FullName -Destination $destination -Recurse -Force
    }
    Write-Output "Installed $destination"
}
