# Guia de Setup - Múltiplos Repositórios

Este documento explica como dividir o projeto em 3 repositórios Git separados.

## Estrutura de Repositórios

```
projetos/
├── novo_crm-backend/    # Repositório 1: Backend Go
├── novo_crm-frontend/   # Repositório 2: Frontend Next.js
└── novo_crm-infra/      # Repositório 3: Infraestrutura
```

## Passo a Passo

### 1. Criar os Repositórios no Git

Crie 3 repositórios vazios no seu Git (GitHub, GitLab, etc.):
- `novo_crm-backend`
- `novo_crm-frontend`
- `novo_crm-infra`

### 2. Preparar Backend

```bash
cd /var/www/html/novo_crm/backend
git init
git add .
git commit -m "Initial commit: backend Go API"
git remote add origin <URL_DO_REPO_BACKEND>
git push -u origin main
```

### 3. Preparar Frontend

```bash
cd /var/www/html/novo_crm/frontend
git init
git add .
git commit -m "Initial commit: frontend Next.js"
git remote add origin <URL_DO_REPO_FRONTEND>
git push -u origin main
```

### 4. Preparar Infra

```bash
cd /var/www/html/novo_crm/infra
git init
git add .
git commit -m "Initial commit: infraestrutura"
git remote add origin <URL_DO_REPO_INFRA>
git push -u origin main
```

### 5. Estrutura Final Esperada

```
projetos/
├── novo_crm-backend/
│   ├── cmd/
│   ├── internal/
│   ├── migrations/
│   ├── Dockerfile
│   ├── go.mod
│   ├── .gitignore
│   └── README.md
│
├── novo_crm-frontend/
│   ├── app/
│   ├── lib/
│   ├── store/
│   ├── Dockerfile
│   ├── package.json
│   ├── .gitignore
│   └── README.md
│
└── novo_crm-infra/
    ├── nginx/
    ├── docker-compose.yml
    ├── Makefile
    ├── db.env.example
    ├── .gitignore
    └── README.md
```

## Uso Após Migração

### Clonar Todos os Repositórios

```bash
mkdir projetos && cd projetos
git clone <URL_BACKEND> novo_crm-backend
git clone <URL_FRONTEND> novo_crm-frontend
git clone <URL_INFRA> novo_crm-infra
```

### Subir o Ambiente

```bash
cd novo_crm-infra
cp db.env.example db.env
# Ajustar db.env se necessário
make up
```

### Desenvolvimento

- **Backend**: Trabalhe no repositório `novo_crm-backend`
- **Frontend**: Trabalhe no repositório `novo_crm-frontend`
- **Infra**: Ajuste `docker-compose.yml` e `Makefile` no repositório `novo_crm-infra`

## Notas Importantes

1. O `docker-compose.yml` no repositório `infra` assume que os repositórios estão no mesmo nível de diretório
2. Se a estrutura for diferente, ajuste os caminhos `../novo_crm-backend` e `../novo_crm-frontend` no `docker-compose.yml`
3. Cada repositório tem seu próprio `.gitignore` específico
4. As migrations ficam no repositório `backend`, mas são executadas via Makefile do `infra`

