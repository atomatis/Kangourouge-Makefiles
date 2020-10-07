#!/usr/bin/env bash

KRG_FOLDER="$HOME/.krg"
CONFIGURATION_FILE="$KRG_FOLDER/env.conf"
DOMAIN="NOT_FOUND"
COLOR="\033[38;5;82m"
VOID="\033[0m"

clear

# Creation du fichier d'env krg si il n'existe pas et ajoute le domaine locale
if [[ ! -f $CONFIGURATION_FILE ]]
then
    echo -e "\033[38;5;3mFichier de configuration introuvable ($CONFIGURATION_FILE).\033[0m"
    echo "Voulez-vous le créer? (y/n)"
    read -p "> " response

    if [[ $response != "y" ]]
    then
        exit
    fi

    if [[ ! -d $KRG_FOLDER ]]
    then
        mkdir $KRG_FOLDER
    fi

    touch $CONFIGURATION_FILE

    echo
    echo  "Renseignez votre nom de domaine local (local ou myusername.kangourouge.com par ex)"

    read -p "> " response

    echo "DOMAIN=$response" >> $CONFIGURATION_FILE
    echo -e "Génération du fichier de config krg [OK]"
fi
