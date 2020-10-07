#!/usr/bin/env bash

# script parameters
PROJECT_ROOT=$1

# import vars
. ${PROJECT_ROOT}/configuration/krg.local.conf

# local var
VOID="\033[0m"
BLUE="\033[0;34m"
PINK="\033[38;5;163m"
apiUrl=https://eastimage-api.${PROXY_DOMAIN}

message_output() {
    local file="$1"
    local location="$2"
    echo -e " - $PINK$file$VOID" generated in $BLUE$location$VOID service
}

# generate admin local .env
echo "REACT_APP_API_ENTRYPOINT=$apiUrl" > ${PROJECT_ROOT}/admin/.env.local
message_output .env.local admin

# generate client local .env
echo "REACT_APP_API_ENTRYPOINT=$apiUrl" > ${PROJECT_ROOT}/client/.env
message_output .env client
