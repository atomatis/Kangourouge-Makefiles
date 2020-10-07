.PHONY: init console composer sh bash shell

RUN_IN_CONTAINER := @docker exec -it --env APP_ENV=dev ${PROJECT_NAME}-${CONTAINER}

# Generic

init: .env.local ## (generic) Init project

console: ## (Generic) Symfony console | example : make console cache:clear ++env=prod [++help]
	${RUN_IN_CONTAINER} ./bin/console ${SUBCOMMAND}

composer: ## (Generic) Composer | example : make composer install ++optimize-autoloader [++help]
	${RUN_IN_CONTAINER} composer ${SUBCOMMAND};

sh: ## (Generic) Shell Sh | example : make sh 'ls -lah'
	${RUN_IN_CONTAINER} sh -c "${SUBCOMMAND}"

bash: ## (Generic) Shell Bash | example : make bash 'tail -f ./path/to/a/file'
	${RUN_IN_CONTAINER} bash -c "${SUBCOMMAND}"

php: ## (Generic) PHP | example : make php [++help]
	${RUN_IN_CONTAINER} /usr/local/bin/php ${SUBCOMMAND}

shell: ## (Generic) Enter in app container
	$(RUN_IN_CONTAINER) bash
