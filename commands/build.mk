# Install the project and start Docker services
init:
	make permissions
	composer install
	make create-ssl
	sh -c 'cd web/app/themes && git clone -b develop git@github.com:jhoff-dev/half-horizons.git'
	${DOCKER_COMPOSE} up -d
	make composer install
	make yarn install
	make yarn build

# Start the Docker services
up:
	${DOCKER_COMPOSE} up -d

# Stop the Docker services
stop:
	${DOCKER_COMPOSE} stop

# Destroy the Docker services
destroy:
	${DOCKER_COMPOSE} down --volumes

# Restart the Docker services
restart:
	${DOCKER_COMPOSE} restart

# Run Composer commands directly in the theme folder
composer:
	${DOCKER_COMPOSE} exec -i -t composer sh -c 'composer $(filter-out $@,$(MAKECMDGOALS))'

# Run Yarn commands directly in the theme folder
yarn:
	${DOCKER_COMPOSE} exec -u node -i -t node sh -c 'corepack yarn $(filter-out $@,$(MAKECMDGOALS))'

# Run WP-CLI commands directly in the theme folder
wp:
	${DOCKER_COMPOSE} exec -i -t wp-cli sh -c 'wp $(filter-out $@,$(MAKECMDGOALS))'

# Fix file and directory permissions
permissions:
	sudo chown -R ${UID}:${GID} *; \
	sudo chmod -R 777 *; \
	git config core.fileMode false; \

# Clear caches and optimize the application
clear:
	${DOCKER_COMPOSE} exec -i -t wp-cli sh -c 'wp cache flush'
	${DOCKER_COMPOSE} exec -i -t wp-cli sh -c 'wp transient delete --all'
	${DOCKER_COMPOSE} exec -i -t composer sh -c 'composer dump -o'
	${DOCKER_COMPOSE} exec -i -t wp-cli sh -c 'wp acorn package:discover'
	${DOCKER_COMPOSE} exec -i -t wp-cli sh -c 'wp acorn optimize:clear'
