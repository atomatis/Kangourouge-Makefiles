#!make
.PHONY: sh shell yarn

RUN_IN_CONTAINER := @docker exec -it --env APP_ENV=dev ${PROJECT_NAME}-${CONTAINER}

# Generic

yarn: ## (Generic) Yarn | example : make yarn add lodash
	${RUN_IN_CONTAINER} yarn ${SUBCOMMAND}

sh: ## (Generic) Shell Sh | example : make sh 'ls -lah'
	${RUN_IN_CONTAINER} sh -c "${SUBCOMMAND}"

shell: ## (Generic) Enter in app container
	$(RUN_IN_CONTAINER) sh
