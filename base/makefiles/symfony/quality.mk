#!make
.PHONY: behat phpunit fixtures phploc phpmd security phpcpd phpcs phpcbf

## Quality assurance

## Tests

behat: vendor/bin/behat ## (QA) Functional tests | example : make behat [++tags order_list] [++help]
	docker exec -it --env APP_ENV=test ${PROJECT_NAME} ./vendor/bin/behat ${SUBCOMMAND}

phpunit: vendor/bin/phpunit ## (QA) Unit tests | example : make phpunit [++help]
	@echo ${SUBCOMMAND}
	${RUN_IN_CONTAINER} ./vendor/bin/phpunit --configuration ./phpunit.xml.dist ${SUBCOMMAND}

fixtures: vendor/hautelook/alice-bundle ## (QA) Load tests fixtures | example : make fixtures [++purge-with-truncate]
	${RUN_IN_CONTAINER} ./bin/console hautelook:fixtures:load --env=dev -q ${SUBCOMMAND}

## Analyse

phploc: vendor/bin/phploc ## (QA) Code statistics
	${RUN_IN_CONTAINER} ./vendor/bin/phploc src

phpmd: vendor/bin/phpmd ## (QA) Mess detector. Good practice rules (SOLID)
	${RUN_IN_CONTAINER} phpmd src text .phpmd.xml

security: vendor/bin/security-checker ## (QA) Check security of your dependencies
	${RUN_IN_CONTAINER} ./vendor/bin/security-checker security:check

phpcpd: vendor/bin/phpcpd ## (QA) PHP Copy/Paste Detector
	${RUN_IN_CONTAINER} phpcpd src

phpcs: vendor/bin/phpcs ## (QA) PHP Code Style
	${RUN_IN_CONTAINER} ./vendor/bin/phpcs ${SUBCOMMAND}

## Fixer

phpcbf: vendor/bin/phpcbf ## (QA) PHP Code Beautifier and Fixer
	${RUN_IN_CONTAINER} ./vendor/bin/phpcbf ${SUBCOMMAND}

