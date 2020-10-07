#!/usr/bin/env bash

PROJECT_NAME="UNKNOWN_PROJECT_NAME"
PROXY_DOMAIN="UNKNOWN_PROXY_DOMAIN"
PROJECT_ROOT=$1

# import var from config file
. $PROJECT_ROOT/.env

VOID="\033[0m"
BLUE="\033[0;34m"
YELLOW="\033[38;5;3m"
GREEN="\033[38;5;70m"
RED="\033[38;5;1m"
PINK="\033[38;5;163m"

getStatus() {
    local service="$@"
    result=$(docker ps -f name=$service --format "{{.Status}}" -a)

    regex="Up"
    if [[ $result =~ $regex ]];then
        echo "["$GREEN"disponible"$VOID"]"
    elif [[ -z "$result" ]];then
        echo "["$RED"inexistant"$VOID"]"
    else
        echo "["$YELLOW"indisponible"$VOID"]"
    fi
}

getUrl() {
    local service="$@"
    echo "https://$PROJECT_NAME-$service.$PROXY_DOMAIN"
}

getPort() {
    local service="$@"
    result=$(docker ps -f name=$PROJECT_NAME-$service --format "{{.Ports}}" -a | sed -n 's/.*0.0.0.0:\([0-9]*\).*/\1/p')

    if [[ -z "$result" ]];then
        echo $RED"X"$VOID
    else
        echo $result
    fi
}

getApplicationUrl() {
    local service="$1"
    local suffix="$2"
    echo -e " $service ->$BLUE $(getUrl $service)$suffix $VOID$(getStatus $PROJECT_NAME-$service)$VOID"
}

getDatabasePort() {
    local service="$@"
    echo -e " Postgres -> port $(getPort $service) $(getStatus $PROJECT_NAME-$service)$VOID"

}

clear
echo -e "               \033[1;7;47m------ $PROJECT_NAME ------\033[0m"
echo
echo "Pour ouvrir un lien dans le navigateur, cmd + clic gauche"
echo
echo -e $PINK"Application.s$VOID"
echo
getApplicationUrl client
getApplicationUrl admin
getApplicationUrl api /api
echo
echo -e $PINK"Base.s de données$VOID"
echo
getDatabasePort db
echo
echo -e $PINK"Reverse proxy$VOID"
echo
echo -e " Traefik -> $BLUE"http://traefik.$PROXY_DOMAIN "$VOID$(getStatus "traefik-reverse-proxy")"
