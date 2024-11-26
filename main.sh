#!/bin/bash

echo "=== Début de l'exécution des scripts ==="

# Exécuter les scripts précédents dans l'ordre
./ping_url.sh
./charge_page.sh
./stocke_donnees.sh
./analyse_mesures.sh
./genere_rapport.sh

# Envoyer le rapport par email
echo "Tâche 6 : Envoi du rapport au DSI"


echo "=== Fin de l'exécution des scripts ==="
