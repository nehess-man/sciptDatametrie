#!/bin/bash

# Script principal : main.sh
# Ce script exécute tous les autres scripts nécessaires dans l'ordre

./ping_url.sh
./charge_page.sh
./stocke_donnees.sh
./analyse_mesures.sh
./genere_rapport.sh
./envoi_mail.sh

# Affichage de la fin de l'exécution
echo "=== Fin de l'exécution des scripts ==="
