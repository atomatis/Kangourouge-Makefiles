vendor/bin/phploc:
	${RUN_IN_CONTAINER} composer require --dev phploc/phploc

vendor/bin/security-checker:
	${RUN_IN_CONTAINER} composer require --dev sensiolabs/security-checker

vendor/bin/phpcs:
	${RUN_IN_CONTAINER} composer require --dev escapestudios/symfony2-coding-standard

vendor/hautelook/alice-bundle:
	@echo install hautelook alice
