#!/bin/bash

# URL de la page à tester (google.com pour les tests)
url="google.com"

# Fichier temporaire pour enregistrer les résultats
temp_file=$(mktemp)

# Date et heure actuelles
current_date=$(date "+%Y-%m-%d %H:%M:%S")

# Mesure du temps de chargement de la page avec wget et time
{
    echo "Date: $current_date"
    echo "Mesure du temps de chargement de la page : $url"
    
    # Exécuter wget et mesurer le temps avec `time` intégré dans bash
    { time wget -q "$url" -O /dev/null; } 2>&1 | tee -a "$temp_file" | tail -n 1
} >> "$temp_file"

# Afficher le contenu du fichier temporaire
cat "$temp_file"

# Optionnellement, supprimer le fichier temporaire après utilisation
# rm "$temp_file"
