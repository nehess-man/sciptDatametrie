#!/bin/bash

# URL de la page à tester (google.com pour les tests)
url="google.com"

# Fichier CSV pour enregistrer les résultats
csv_file="mesures.csv"

# Vérifier si le fichier CSV existe déjà, sinon créer l'en-tête
if [ ! -f "$csv_file" ]; then
    echo "Date,URL,Ping Status,Temps de chargement (s)" > "$csv_file"
fi

# Fichier temporaire pour stocker les résultats du ping et du temps de chargement
ping_file=$(mktemp)
time_file=$(mktemp)

# Date actuelle
current_date=$(date "+%Y-%m-%d %H:%M:%S")

# 1. Mesurer le statut du ping
ping_status="Échoué"
ping_result=$(ping -c 4 "$url" > "$ping_file" 2>&1)
if grep -q "0% packet loss" "$ping_file"; then
    ping_status="Réussi"
fi

# 2. Mesurer le temps de chargement de la page avec wget
load_time=$( { time wget -q "$url" -O /dev/null; } 2>&1 | grep real | awk '{print $2}' | sed 's/^[0-9]*m//;s/s//')

# 3. Ajouter les données dans le fichier CSV
echo "$current_date,$url,$ping_status,$load_time" >> "$csv_file"

# Optionnellement, afficher le contenu du fichier CSV
cat "$csv_file"

# Optionnellement, supprimer les fichiers temporaires
rm "$ping_file" "$time_file"
