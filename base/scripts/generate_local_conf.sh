#!/usr/bin/env bash

# script parameters
TARGET_DIR=$1

# script dir
HERE="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# local var
KRG_FOLDER="$HOME/.krg"
CONFIGURATION_FILE="$KRG_FOLDER/env.conf"
DOMAIN="NOT_FOUND"

VOID="\033[0m"

# import var
. $CONFIGURATION_FILE

message_output() {
    local file="$1"
    local location="$2"
    echo -e " - $PINK$file$VOID" generated in $BLUE$location$VOID service
}

echo "PROXY_DOMAIN=$DOMAIN" > TARGET_DIR/krg.local.conf
message_output krg.local.conf "configuration folder"
