#!/usr/bin/env bash

# script dir
HERE="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# import var
. $HERE/utils/color.env

KRG_FOLDER="$HOME/.krg"
CONFIGURATION_FILE="$KRG_FOLDER/env.conf"
DOMAIN="NOT_FOUND"

clear

# Creation du fichier d'env krg si il n'existe pas et ajoute le domaine locale
if [[ ! -f $CONFIGURATION_FILE ]]
then
    echo -e "${T_SERIOUS_YELLOW}Fichier de configuration introuvable ($CONFIGURATION_FILE).$EOC"
    echo "Voulez-vous le créer? (y/n)"
    read -p "> " response

    [[ $response != "y" ]] && exit

    [[ ! -d $KRG_FOLDER ]] && mkdir $KRG_FOLDER

    touch $CONFIGURATION_FILE

    echo
    echo  "Renseignez votre nom de domaine local (local ou myusername.kangourouge.com par ex)"

    read -p "> " response

    echo "DOMAIN=$response" >> $CONFIGURATION_FILE
    echo -e "Génération du fichier de config krg [OK]"
fi
