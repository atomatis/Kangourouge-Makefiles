#!/usr/bin/env bash

# script parameters
projectRoot=$1

# local var
VOID="\033[0m"
BLUE="\033[0;34m"
PINK="\033[38;5;163m"

# Create keys
mkdir -p ${projectRoot}/api/var/jwt
openssl genpkey -out ${projectRoot}/api/var/jwt/private.pem -aes256 -algorithm rsa -pkeyopt rsa_keygen_bits:4096 -pass pass:local
openssl pkey -in ${projectRoot}/api/var/jwt/private.pem -out ${projectRoot}/api/var/jwt/public.pem -pubout -passin pass:local
echo -e " - ${PINK}RSA keys$VOID" generated in ${BLUE}api$VOID service
