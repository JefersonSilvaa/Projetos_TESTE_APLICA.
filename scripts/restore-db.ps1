param(
    [Parameter(Mandatory=$true)]
    [string]$DumpFile,
    [string]$ContainerName = "neo-ia-postgres",
    [string]$Database = "neoia",
    [string]$User = "neoia_user"
)

if (-not (Test-Path -LiteralPath $DumpFile)) {
    Write-Error "Arquivo de dump nao encontrado: $DumpFile"
    exit 1
}

Write-Host "Restaurando banco usando $DumpFile ..."
Get-Content -Raw -LiteralPath $DumpFile | docker exec -i $ContainerName psql -U $User -d $Database

if ($LASTEXITCODE -ne 0) {
    Write-Error "Falha na restauracao do banco."
    exit 1
}

Write-Host "Restauracao concluida."
