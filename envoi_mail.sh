#!/bin/bash

# Script : envoie_mail.sh
# Envoie uniquement le fichier rapport_du_jour.txt par e-mail avec sSMTP

# Configuration
EMAIL_DSI="admlcs36@gmail.com"  # Adresse e-mail du DSI
SUJET="Rapport du jour"  # Objet de l'e-mail

# Chemin vers le fichier du rapport du jour
FICHIER_RAPPORT="/home/kali/Documents/CIEL2/mp02_script/sciptDatametrie/rapport_du_jour.txt"

# Vérification si le fichier de rapport existe
if [ ! -f "$FICHIER_RAPPORT" ]; then
    echo "Erreur : Le fichier $FICHIER_RAPPORT n'existe pas."
    exit 1
fi

# Construction du message et envoi du rapport
{
    echo "To: $EMAIL_DSI"
    echo "Subject: $SUJET"
    echo
    echo "Voici le rapport du jour :"
    cat "$FICHIER_RAPPORT"  # Lire le contenu du fichier et l'inclure dans l'email
} | ssmtp "$EMAIL_DSI"

# Vérification de l'envoi
if [ $? -eq 0 ]; then
    echo "Rapport du jour envoyé avec succès à $EMAIL_DSI."
else
    echo "Erreur lors de l'envoi du rapport."
fi
