.PHONY: init check-krg-env generate-local-env generate-jwt-key

# Generic

check-krg-env: ## (Project) check or init krg global config file
	@${SCRIPTS}/krg_env.sh

init: ${PROJECT_ROOT}/.env generate-local-env generate-jwt-key## (Project) Init project. Caution, Files are overide if exist.
	@echo
	@echo "\033[38;5;70mYour project is ready to start!\033[0m"
	@echo "Use \033[38;5;3mmake start\033[0m for build and use container"

generate-local-env: ## (Project) Generate local env files. Caution, Files are overide if exist.
	@${SCRIPTS}/generate_project_local_env.sh ${PROJECT_ROOT}

generate-jwt-key: ## (Project) Generate jwt keys for local use
	@${SCRIPTS}/generate_jwt_key.sh ${PROJECT_ROOT}
