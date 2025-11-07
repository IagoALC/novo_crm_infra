SHELL := /usr/bin/bash

PROJECT := novo_crm
COMPOSE := docker compose
NET := crm_net

BACKEND_DIR := ../backend
MIGRATIONS := $(BACKEND_DIR)/migrations
DB_URL := postgres://crm_user:crm_pass@postgres:5432/crm?sslmode=disable

.PHONY: up down logs rebuild api.run migrate.up migrate.down lint test

up:
	$(COMPOSE) up -d --build

down:
	$(COMPOSE) down -v

logs:
	$(COMPOSE) logs -f --tail=200

rebuild:
	$(COMPOSE) build --no-cache

api.run:
	set -a; source $(BACKEND_DIR)/.env; set +a; cd $(BACKEND_DIR) && go run ./cmd/api

migrate.up:
	-docker network create $(NET)
	docker run --rm \
		--network=$(NET) \
		-v $(MIGRATIONS):/migrations \
		ghcr.io/golang-migrate/migrate:latest \
		-path=/migrations -database "$(DB_URL)" up

migrate.down:
	-docker network create $(NET)
	docker run --rm \
		--network=$(NET) \
		-v $(MIGRATIONS):/migrations \
		ghcr.io/golang-migrate/migrate:latest \
		-path=/migrations -database "$(DB_URL)" down 1

lint:
	docker run --rm -v $(BACKEND_DIR):/app -w /app golangci/golangci-lint:v1.61 golangci-lint run

test:
	docker run --rm -v $(BACKEND_DIR):/app -w /app golang:1.22 bash -lc "go test ./..."

