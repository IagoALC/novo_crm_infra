# Infraestrutura - Novo CRM

Repositório de infraestrutura e orquestração do projeto.

## Estrutura

```
infra/
├── db.env.example      # Variáveis do PostgreSQL
├── nginx/
│   └── nginx.conf      # Configuração do Nginx
├── docker-compose.yml  # Orquestração dos serviços
└── Makefile            # Comandos de desenvolvimento
```

## Pré-requisitos

Este repositório assume que os repositórios `novo_crm-backend` e `novo_crm-frontend` estão no mesmo nível:

```
projetos/
├── novo_crm-backend/
├── novo_crm-frontend/
└── novo_crm-infra/     (este repositório)
```

## Configuração

1. Copie `db.env.example` para `db.env` e ajuste as variáveis
2. Ajuste os caminhos no `docker-compose.yml` se necessário
3. Execute `make up` para subir todos os serviços

## Comandos

- `make up` - Sobe todos os serviços
- `make down` - Para e remove containers/volumes
- `make logs` - Visualiza logs
- `make migrate.up` - Executa migrations do backend
- `make migrate.down` - Reverte última migration

