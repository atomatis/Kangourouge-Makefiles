#!/usr/bin/env bash

# Script parameter
TARGET_DIR=$1 # Base dir where key will be generated

# script dir
HERE="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# import var
. $HERE/utils/color.env

# Create keys
if [[ ! -d $TARGET_DIR ]]; then
  mkdir $TARGET_DIR
fi
openssl genpkey -out $TARGET_DIR/private.pem -aes256 -algorithm rsa -pkeyopt rsa_keygen_bits:4096 -pass pass:local
openssl pkey -in $TARGET_DIR/private.pem -out $TARGET_DIR/public.pem -pubout -passin pass:local
echo -e " - ${T_PINK}RSA keys$RESET_COLOR" generated in ${T_BLUE}${TARGET_DIR}${EOC}
