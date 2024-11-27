#!/bin/bash

# Script principal : main.sh
# Une boucle imbriquée pour effectuer des actions toutes les 30 secondes
# et envoyer un rapport toutes les 5 minutes.

while true
do
    echo "=== Début d'un cycle de 5 minutes ==="
    
    # Initialiser un compteur pour gérer les cycles de 30 secondes
    SECONDES_RESTANTES=300  # 5 minutes en secondes

    while [ $SECONDES_RESTANTES -gt 0 ]
    do
        echo "Ping et mesure du chargement à $(date +'%Y-%m-%d %H:%M:%S')"
        
        # Effectuer le ping et mesurer le temps de chargement des pages
        ./ping_url.sh
        ./charge_page.sh
        ./stocke_donnees.sh

        # Attendre 30 secondes avant le prochain ping et chargement
        sleep 30

        # Réduire le compteur
        SECONDES_RESTANTES=$((SECONDES_RESTANTES - 30))
    done

    # Après 5 minutes, exécuter les autres scripts pour analyser et envoyer le rapport
    echo "Analyse des données et génération du rapport..."
    ./analyse_mesures.sh
    ./genere_rapport.sh
    ./envoi_mail.sh

    echo "Rapport envoyé avec succès. Fin du cycle de 5 minutes."
done
