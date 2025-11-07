# Infraestrutura - Novo CRM

Repositório de infraestrutura e orquestração do projeto.

> 📚 **Documentação completa**: Veja [docs/README.md](docs/README.md) para visão geral do projeto.

## Estrutura

```
infra/
├── db.env.example      # Variáveis do PostgreSQL (template)
├── nginx/
│   └── nginx.conf      # Configuração do Nginx
├── docker-compose.yml  # Orquestração dos serviços
└── Makefile            # Comandos de desenvolvimento
```

## Pré-requisitos

Este repositório assume que os repositórios estão no mesmo nível de diretório:

```
projetos/
├── novo_crm-backend/
├── novo_crm-frontend/
└── novo_crm-infra/     (este repositório)
```

## Configuração Inicial

1. Clone os repositórios necessários:
```bash
git clone git@github.com:IagoALC/novo_crm_backend.git ../novo_crm-backend
git clone git@github.com:IagoALC/novo_crm_frontend.git ../novo_crm-frontend
```

2. Configure as variáveis de ambiente:
```bash
cp db.env.example db.env
# Edite db.env com suas configurações se necessário
```

3. Configure o backend:
```bash
cd ../novo_crm-backend
cp env.example .env
# Edite .env com suas configurações
cd ../novo_crm-infra
```

4. Suba os serviços:
```bash
make up
make migrate.up
```

## Comandos Disponíveis

### Gerenciamento de Serviços
- `make up` - Sobe todos os serviços em background
- `make down` - Para e remove containers/volumes
- `make logs` - Visualiza logs de todos os serviços
- `make rebuild` - Rebuild sem cache

### Migrations
- `make migrate.up` - Executa todas as migrations pendentes
- `make migrate.down` - Reverte a última migration

### Desenvolvimento
- `make api.run` - Roda a API localmente (fora do Docker)
- `make lint` - Executa linter no código do backend
- `make test` - Executa testes do backend

## Variáveis de Ambiente

### db.env
Configurações do PostgreSQL:
- `POSTGRES_DB` - Nome do banco de dados
- `POSTGRES_USER` - Usuário do banco
- `POSTGRES_PASSWORD` - Senha do banco

### docker-compose.yml
- `NEXT_PUBLIC_API_BASE` - Base URL da API para o frontend (padrão: `/api`)

## Troubleshooting

### Erro ao subir serviços
- Verifique se os repositórios `novo_crm-backend` e `novo_crm-frontend` estão no mesmo nível
- Verifique se as portas 80, 3000, 8080, 5432, 6379 estão livres
- Execute `make logs` para ver erros detalhados

### Migrations não executam
- Verifique se o container `crm_postgres` está rodando
- Verifique se o arquivo `db.env` existe e está configurado corretamente
- Verifique se o caminho `../novo_crm-backend/migrations` existe

