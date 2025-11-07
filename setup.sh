#!/bin/bash

set -e

echo "🚀 Setup do Novo CRM - Infraestrutura"
echo ""

BACKEND_DIR="../novo_crm-backend"
FRONTEND_DIR="../novo_crm-frontend"

if [ ! -d "$BACKEND_DIR" ]; then
    echo "❌ Diretório $BACKEND_DIR não encontrado"
    echo "   Clone o repositório: git clone git@github.com:IagoALC/novo_crm_backend.git $BACKEND_DIR"
    exit 1
fi

if [ ! -d "$FRONTEND_DIR" ]; then
    echo "❌ Diretório $FRONTEND_DIR não encontrado"
    echo "   Clone o repositório: git clone git@github.com:IagoALC/novo_crm_frontend.git $FRONTEND_DIR"
    exit 1
fi

if [ ! -f "db.env" ]; then
    echo "📝 Criando db.env a partir do template..."
    cp db.env.example db.env
    echo "✅ db.env criado. Ajuste as variáveis se necessário."
else
    echo "✅ db.env já existe"
fi

if [ ! -f "$BACKEND_DIR/.env" ]; then
    echo "📝 Criando .env do backend a partir do template..."
    cp "$BACKEND_DIR/env.example" "$BACKEND_DIR/.env"
    echo "✅ Backend .env criado. Ajuste as variáveis se necessário."
else
    echo "✅ Backend .env já existe"
fi

echo ""
echo "✅ Setup concluído!"
echo ""
echo "Próximos passos:"
echo "  1. Ajuste db.env e $BACKEND_DIR/.env se necessário"
echo "  2. Execute: make up"
echo "  3. Execute: make migrate.up"

