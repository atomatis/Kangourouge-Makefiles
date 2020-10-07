${PROJECT_ROOT}/configuration/krg.local.conf: check-krg-env
	@${SCRIPTS}/generate_local_conf.sh ${PROJECT_ROOT}/configuration

${PROJECT_ROOT}/.env: ${PROJECT_ROOT}/configuration/krg.local.conf
	@sort -u -t '=' -k 1,1 ${PROJECT_ROOT}/configuration/krg.conf ${PROJECT_ROOT}/configuration/krg.local.conf > ${PROJECT_ROOT}/.env
	@echo " - \033[38;5;163m.env\033[0m generated in \033[0;34mroot project\033[0m service"
	@echo '' | cat - ${PROJECT_ROOT}/.env > temp && mv temp ${PROJECT_ROOT}/.env
	@echo '# docker-compose env' | cat - ${PROJECT_ROOT}/.env > temp && mv temp ${PROJECT_ROOT}/.env

${PROJECT_ROOT}/vixnsci.schema.json:
	@wget https://apt.vixns.net/vixnsci.schema.json -P ${PROJECT_ROOT}
