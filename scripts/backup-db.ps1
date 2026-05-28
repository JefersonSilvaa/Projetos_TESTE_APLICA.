param(
    [string]$OutputDir = "./backups",
    [string]$ContainerName = "neo-ia-postgres",
    [string]$Database = "neoia",
    [string]$User = "neoia_user"
)

$timestamp = Get-Date -Format "yyyyMMdd-HHmmss"
if (-not (Test-Path -LiteralPath $OutputDir)) {
    New-Item -ItemType Directory -Path $OutputDir | Out-Null
}

$outputFile = Join-Path $OutputDir ("neoia-" + $timestamp + ".sql")

Write-Host "Gerando dump em $outputFile ..."
docker exec -t $ContainerName pg_dump -U $User -d $Database | Out-File -FilePath $outputFile -Encoding utf8

if ($LASTEXITCODE -ne 0) {
    Write-Error "Falha ao gerar dump do banco. Verifique se o container esta ativo."
    exit 1
}

Write-Host "Backup concluido: $outputFile"
