#!/bin/bash

# Mostra un messaggio all'utente
echo "Choose your timezone:"

# Esegui tzselect e salva la selezione in una variabile
timezone=$(tzselect)

# Estrai la parte finale della timezone
timezone=$(echo $timezone | awk '{print $NF}')

# Mostra la timezone selezionata dall'utente
echo "You selected: $timezone"

# Chiede conferma all'utente
read -p "Do you want to apply this timezone (y/n): " confirm

# Se l'utente conferma, imposta la nuova timezone
if [[ $confirm == "y" || $confirm == "Y" ]]; then
    sudo timedatectl set-timezone $timezone
    echo "Timezone changed to $timezone"
else
    echo "Timezone not updated."
fi
