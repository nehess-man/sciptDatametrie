#!/bin/bash

# Vérifie que le fichier existe
FILE="mesures.csv"
if [[ ! -f $FILE ]]; then
    echo "Erreur : Le fichier $FILE n'existe pas."
    exit 1
fi

# Ignore la première ligne (header) et extrait les temps de chargement
temps=($(tail -n +2 "$FILE" | cut -d ',' -f 4))

# Vérifie qu'il y a des données
if [[ ${#temps[@]} -eq 0 ]]; then
    echo "Erreur : Aucune donnée disponible dans $FILE."
    exit 1
fi

# Calcule min, max et moyenne
min=$(printf "%s\n" "${temps[@]}" | sort -n | head -1)
max=$(printf "%s\n" "${temps[@]}" | sort -n | tail -1)
somme=$(printf "%s\n" "${temps[@]}" | awk '{sum+=$1} END {print sum}')
moyenne=$(echo "scale=3; $somme / ${#temps[@]}" | bc)

# Affiche le rapport
echo "Analyse des mesures stockées :"
echo "Min : $min s"
echo "Max : $max s"
echo "Moyenne : $moyenne s"
