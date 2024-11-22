#!/bin/bash

# Fichier CSV contenant les mesures
csv_file="mesures.csv"

# Fichier texte de rapport
rapport_file="rapport_du_jour.txt"

# Vérifier si le fichier CSV existe
if [ ! -f "$csv_file" ]; then
    echo "Le fichier $csv_file n'existe pas. Veuillez exécuter les scripts de mesure d'abord."
    exit 1
fi

# Extraire les temps de chargement (en secondes), sans l'en-tête, et les convertir en millisecondes
times=$(awk -F',' 'NR > 1 {print $4 * 1000}' "$csv_file")

# Vérifier si des données sont présentes
if [ -z "$times" ]; then
    echo "Aucune donnée de temps de chargement trouvée dans $csv_file."
    exit 1
fi

# Calculer les valeurs min, max et moyenne
min_time=$(echo "$times" | sort -n | head -n 1)
max_time=$(echo "$times" | sort -n | tail -n 1)
avg_time=$(echo "$times" | awk '{sum+=$1} END {print sum/NR}')

# Créer le rapport
{
    echo "Rapport du jour"
    echo "Min : $min_time ms"
    echo "Max : $max_time ms"
    echo "Moy : $avg_time ms"
} > "$rapport_file"

# Afficher le contenu du rapport
cat "$rapport_file"

echo "Le rapport a été généré et sauvegardé dans $rapport_file."
