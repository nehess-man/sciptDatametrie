#!/bin/bash

# URL de la page à tester (google.com pour les tests)
url="google.com"

# Fichier temporaire pour stocker le résultat du ping
ping_file=$(mktemp)

# Date actuelle
current_date=$(date "+%Y-%m-%d %H:%M:%S")

# Ping de l'URL et vérification du succès
ping_status="Échoué"
ping_result=$(ping -c 4 "$url" > "$ping_file" 2>&1)
if grep -q "0% packet loss" "$ping_file"; then
    ping_status="Réussi"
fi

# Afficher le statut du ping
echo "Date: $current_date"
echo "Ping vers $url : $ping_status"

# Enregistrer le résultat dans un fichier temporaire
{
    echo "Date: $current_date"
    echo "Ping vers $url : $ping_status"
} >> ping_results.txt

# Optionnellement, afficher le contenu du fichier temporaire
cat ping_results.txt

# Optionnellement, supprimer le fichier temporaire après utilisation
# rm "$ping_file"
