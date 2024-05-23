#!/bin/bash

# Percorso della directory del progetto
PROJECT_DIR="$(pwd)"

# Directory dei volumi
MONGO_DATA_DIR="${PROJECT_DIR}/data/mongo"
OPENSEARCH_DATA_DIR="${PROJECT_DIR}/data/log"
GRAYLOG_DATA_DIR="${PROJECT_DIR}/data/graylog_data"


# Sposta il file graylog.conf se esiste nella posizione vecchia
#if [ -f "${PROJECT_DIR}/config/graylog/graylog.conf" ]; then
#  mv "${PROJECT_DIR}/config/graylog/graylog.conf" "$GRAYLOG_CONFIG_DIR/"
#fi

# Cambia il proprietario delle directory a UID 1000 e GID 1000
sudo chown -R 1000:1000 "$MONGO_DATA_DIR"
sudo chown -R 1000:1000 "$OPENSEARCH_DATA_DIR"
#sudo chown -R 1000:1000 "$GRAYLOG_DATA_DIR"


# Cambia il proprietario della directory Graylog a UID 1100 e GID 1100
sudo chown -R 1100:1100 "$GRAYLOG_DATA_DIR"

# Imposta i permessi sulle directory
sudo chmod -R 755 "$MONGO_DATA_DIR"
sudo chmod -R 755 "$OPENSEARCH_DATA_DIR"
sudo chmod -R 755 "$GRAYLOG_DATA_DIR"


# Esegui Docker Compose per avviare i container
docker-compose up -d

echo "Setup completato e container avviati."
