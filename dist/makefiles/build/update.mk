.PHONY: update-dependencies

RUN_IN_API := @docker exec -it --env APP_ENV=dev ${PROJECT_NAME}-api
RUN_IN_CLIENT := @docker exec -it --env APP_ENV=dev ${PROJECT_NAME}-client
RUN_IN_ADMIN := @docker exec -it --env APP_ENV=dev ${PROJECT_NAME}-admin

update-api-dependencies: ## (Update) update api vendor
	${RUN_IN_API} composer install

update-client-dependencies: ## (Update) update client vendor
	${RUN_IN_CLIENT} yarn

update-admin-dependencies: ## (Update) update admin vendor
	${RUN_IN_ADMIN} yarn

update-dependencies: update-api-dependencies update-client-dependencies update-admin-dependencies ## (Update) update all vendor
