#!make
.PHONY: ps start stop restart recreate build logs kill info up upd

ps: ## (Docker) Show containers
	@clear
	${DOCKER_COMPOSE} ps

info: ## (Docker) App info
	@${SCRIPTS}/info.sh ${PROJECT_ROOT}

up:
	${DOCKER_COMPOSE} up ${SERVICES}

upd:
	${DOCKER_COMPOSE} up -d ${SERVICES}

start: upd info ## (Docker) Start containers

stop: ## (Docker) Stop containers
	${DOCKER_COMPOSE} stop ${SERVICES}

restart: stop start ## (Docker) Restart containers

recreate: stop ## (Docker) Recreate containers
	${DOCKER_COMPOSE} up --force-recreate --build -d ${SERVICES}

build: ## (Docker) Buid containers
	${DOCKER_COMPOSE} build --force-rm --no-cache ${SERVICES}

logs: ## (Docker) show logs
	${DOCKER_COMPOSE} logs -f --tail=100 ${SERVICES}

kill: ## (Docker) kill and clean
	$(DOCKER_COMPOSE) kill {SERVICES}
	$(DOCKER_COMPOSE) down --volumes --remove-orphans $SERVICES}
