#!make
.PHONY: help
.DEFAULT_GOAL:= help

# Help display
help:
	@clear
	@echo
	@${SCRIPTS}/krg_logo.sh
	@echo
	@echo List of available cmd
	@echo
	@echo "Docker subcommand replace:"
	@echo "use ++ instead of --"
	@echo "use £ instead of ="
	@echo
	@printf "\033[36m%-30s\033[0m %s\n" help "(help) Show this help"
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | cut -d: -f2- | sort -t: -k 2,2 | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

# Wilcard unused targets, including error
# Need for avoid ${SUBCOMMAND} missing target false flag. ( Clever, if you find better ;) )
%:
	@echo "♪ღ♪*•.¸¸¸.•*¨¨*•.¸¸¸.•*•♪ღ♪¸.•*¨¨*•.¸¸¸.•*•♪ღ♪•*"
