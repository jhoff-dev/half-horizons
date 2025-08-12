# Necessary to avoid errors in commands with parameters.
%:
	@:

include .env

export UID=$(shell id -u)
export GID=$(shell id -g)

DOCKER_COMPOSE = docker compose -f docker-compose.yml --env-file .env
PATH_THEME = web/themes/half-horizons
