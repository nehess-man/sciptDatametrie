#!/bin/bash

# URL cible
TARGET="google.fr"
# Boucle infinie
while true; do

        echo "Pinging $TARGET - $(date)"
        ping -c 1 $TARGET
   
    # Attendre 10 secondes avant le prochain test
    sleep 10
done
