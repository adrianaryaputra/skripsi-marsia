param(
    [ValidateSet('main', 'proposal', 'all')]
    [string]$Target = 'all'
)

$ErrorActionPreference = 'Stop'

$repoRoot = $PSScriptRoot
$tempBase = Join-Path $env:LOCALAPPDATA 'Temp\opencode\latex-build'
$sessionName = 'run-' + (Get-Date -Format 'yyyyMMdd-HHmmss')
$workRoot = Join-Path $tempBase $sessionName
$copyRoot = Join-Path $workRoot 'workspace'

if (-not (Test-Path -LiteralPath $tempBase)) {
    New-Item -ItemType Directory -Path $tempBase | Out-Null
}

New-Item -ItemType Directory -Path $copyRoot -Force | Out-Null

$robocopyArgs = @(
    $repoRoot,
    $copyRoot,
    '/E',
    '/XD', '.git',
    '/XF',
    '*.aux',
    '*.bbl',
    '*.bcf',
    '*.blg',
    '*.fdb_latexmk',
    '*.fls',
    '*.loa',
    '*.lof',
    '*.log',
    '*.lot',
    '*.run.xml',
    '*.synctex.*',
    '*.toc',
    '*.xml',
    'main.pdf',
    'proposal.pdf'
)

& robocopy @robocopyArgs | Out-Null
$robocopyExitCode = $LASTEXITCODE
if ($robocopyExitCode -gt 7) {
    throw "Robocopy failed with exit code $robocopyExitCode."
}

$targets = switch ($Target) {
    'main' { @('main.tex') }
    'proposal' { @('proposal.tex') }
    default { @('main.tex', 'proposal.tex') }
}

Push-Location -LiteralPath $copyRoot
try {
    foreach ($document in $targets) {
        "Compiling $document in isolated workspace: $copyRoot"
        & latexmk -pdf $document
        if ($LASTEXITCODE -ne 0) {
            throw "latexmk failed for $document with exit code $LASTEXITCODE."
        }

        $baseName = [System.IO.Path]::GetFileNameWithoutExtension($document)
        $builtPdf = Join-Path $copyRoot ($baseName + '.pdf')
        $builtBbl = Join-Path $copyRoot ($baseName + '.bbl')
        $repoPdf = Join-Path $repoRoot ($baseName + '.pdf')
        $repoBbl = Join-Path $repoRoot ($baseName + '.bbl')

        if (Test-Path -LiteralPath $builtPdf) {
            try {
                Copy-Item -LiteralPath $builtPdf -Destination $repoPdf -Force
                "Copied PDF to repo: $repoPdf"
            }
            catch {
                "Could not copy PDF back to repo (likely locked): $repoPdf"
            }
            "Built PDF available at: $builtPdf"
        }

        if (Test-Path -LiteralPath $builtBbl) {
            try {
                Copy-Item -LiteralPath $builtBbl -Destination $repoBbl -Force
                "Copied BBL to repo: $repoBbl"
            }
            catch {
                "Could not copy BBL back to repo: $repoBbl"
            }
        }
    }
}
finally {
    Pop-Location
}

"Build workspace kept at: $copyRoot"
