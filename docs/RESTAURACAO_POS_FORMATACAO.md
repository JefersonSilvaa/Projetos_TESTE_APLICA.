# Restauracao Pos Formatacao

## 1) Clonar o repositorio

```powershell
git clone https://github.com/JefersonSilvaa/Projetos_TESTE_APLICA..git
cd Projetos_TESTE_APLICA.
```

## 2) Subir os servicos

```powershell
docker compose up -d
```

A aplicacao n8n deve abrir em:
- http://localhost:5678

## 3) Estrutura de pastas ja versionada

As pastas principais ja estao no repositorio:
- backend/
- docker/
- docs/
- flows/
- logs/
- n8n/
- postgres/

## 4) Banco de dados

O repositorio nao versiona dados brutos do Postgres em database/ por seguranca e tamanho.
Se voce tiver um dump SQL, restaure com:

```powershell
docker exec -i neo-ia-postgres psql -U neoia_user -d neoia < .\backups\neoia.sql
```

## 5) Arquivos sensiveis

O arquivo n8n/config nao e versionado por conter chave de criptografia.
Depois de subir o n8n, o arquivo sera recriado automaticamente.
Se voce quiser manter a mesma chave de criptografia, guarde-a em local seguro e reimporte manualmente.

## 6) Comandos uteis

Parar stack:

```powershell
docker compose down
```

Ver logs:

```powershell
docker compose logs -f
```
