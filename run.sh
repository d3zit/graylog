#!/bin/bash

# Working directory
PROJECT_DIR="$(pwd)"

# Bind volumes directories
MONGO_DATA_DIR="${PROJECT_DIR}/data/mongo"
OPENSEARCH_DATA_DIR="${PROJECT_DIR}/data/log"
GRAYLOG_DATA_DIR="${PROJECT_DIR}/data/graylog"

fancy_echo() {
  local message=$1
  local color=$2
  echo -e "${color}******************************************\e[0m"
  echo -e "${color}* ${message} *\e[0m"
  echo -e "${color}******************************************\e[0m"
}

# Run docker to launch containers
docker-compose up -d

fancy_echo "Waiting a few seconds before stopping running containers, please wait" "\e[1;31m"
sleep 20

fancy_echo "Stopping containers" "\e[1;31m"

docker stop $(docker ps -q)

sleep 5

fancy_echo "Change folder ownership in progress" "\e[1;33m"

# Change folder owner
sudo chown -R 1000:1000 "$MONGO_DATA_DIR"
sudo chown -R 1000:1000 "$OPENSEARCH_DATA_DIR"

# Change folder owner
sudo chown -R 1100:1100 "$GRAYLOG_DATA_DIR"

fancy_echo "Ownership changed, containers restarting. Please wait 2 minutes" "\e[1;32m"
docker-compose restart

sleep 100

fancy_echo "Access Graylog on port 9000" "\e[1;32m"
