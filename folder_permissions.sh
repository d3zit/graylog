#!/bin/bash

# Percorso della directory del progetto
PROJECT_DIR="$(pwd)"

# Directory dei volumi
MONGO_DATA_DIR="${PROJECT_DIR}/data/mongo"
OPENSEARCH_DATA_DIR="${PROJECT_DIR}/data/log"
GRAYLOG_DATA_DIR="${PROJECT_DIR}/data/graylog"
GRAYLOG_CONFIG_DIR="${PROJECT_DIR}/config/graylog"

# Crea le directory se non esistono
mkdir -p "$MONGO_DATA_DIR"
mkdir -p "$OPENSEARCH_DATA_DIR"
mkdir -p "$GRAYLOG_DATA_DIR"
mkdir -p "$GRAYLOG_CONFIG_DIR"

# Cambia il proprietario delle directory a UID 1000 e GID 1000
sudo chown -R 1000:1000 "$MONGO_DATA_DIR"
sudo chown -R 1000:1000 "$OPENSEARCH_DATA_DIR"
sudo chown -R 1000:1000 "$GRAYLOG_DATA_DIR"
sudo chown -R 1000:1000 "$GRAYLOG_CONFIG_DIR"

# Imposta i permessi sulle directory
sudo chmod -R 755 "$MONGO_DATA_DIR"
sudo chmod -R 755 "$OPENSEARCH_DATA_DIR"
sudo chmod -R 755 "$GRAYLOG_DATA_DIR"
sudo chmod -R 755 "$GRAYLOG_CONFIG_DIR"

# Aggiungi permessi di scrittura alle directory specifiche
sudo chmod -R 775 "$GRAYLOG_DATA_DIR"

# Cambia temporaneamente la proprietà dei volumi per Graylog
docker run --rm -v "$GRAYLOG_DATA_DIR:/usr/share/graylog/data" alpine chown -R 1100:1100 /usr/share/graylog/data

# Esegui Docker Compose per avviare i container
docker-compose up -d

echo "Setup completato e container avviati."
