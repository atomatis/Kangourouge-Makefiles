#!make
.PHONY: vixns-ci-check

## Quality assurance

## Analyse

valid-vixns-ci: ${PROJECT_ROOT}/vixnsci.schema.json  ## (QA) Valid vixns schema
	@pajv -s ${PROJECT_ROOT}/vixnsci.schema.json -d ${PROJECT_ROOT}/configuration/.vixns-ci.yml
	@rm ${PROJECT_ROOT}/vixnsci.schema.json
