.PHONY: updatedb update-schema remove-schema

# Database

update-schema: ## (Database) Update schema
	${RUN_IN_CONTAINER} ./bin/console do:mi:mi -q

remove-schema: ## (Database) Delete schema
	${RUN_IN_CONTAINER} ./bin/console d:s:d --force

reset-db: remove-schema update-schema ## (Database) Update model and reload fixtures
	${RUN_IN_CONTAINER} ./bin/console h:f:l -q
