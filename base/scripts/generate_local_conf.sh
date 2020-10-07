#!/usr/bin/env bash

# script parameters
TARGET=$1

# local var
KRG_FOLDER="$HOME/.krg"
CONFIGURATION_FILE="$KRG_FOLDER/env.conf"
DOMAIN="NOT_FOUND"
VOID="\033[0m"
BLUE="\033[0;34m"
PINK="\033[38;5;163m"
VOID="\033[0m"

# import var
. $CONFIGURATION_FILE

message_output() {
    local file="$1"
    local location="$2"
    echo -e " - $PINK$file$VOID" generated in $BLUE$location$VOID service
}

echo "PROXY_DOMAIN=$DOMAIN" > $TARGET/krg.local.conf
message_output krg.local.conf "configuration folder"
