#!/bin/bash

dkcom-create-template() {
  DIRECTORY="."

  SH_FILE_NAME="docker-compose.sh"
  COMPOSE_FILE_NAME="docker-compose.yml"
  SYNC_FILE_NAME="docker-sync.yml"

  SH_FILE_PATH="${DIRECTORY}/${SH_FILE_NAME}"
  COMPOSE_FILE_PATH="${DIRECTORY}/${COMPOSE_FILE_NAME}"
  SYNC_FILE_PATH="${DIRECTORY}/${SYNC_FILE_NAME}"

  SH_TEMPLATE_PATH="~/dotfiles/tempmlates/docker-compose.sh"
  COMPOSE_TEMPLATE_PATH="~/dotfiles/tempmlates/docker-compose.yml"
  SYNC_TEMPLATE_PATH="~/dotfiles/tempmlates/docker-sync.yml"

  cat ${SH_TEMPLATE_PATH} > ${SH_FILE_PATH}
  cat ${COMPOSE_TEMPLATE_PATH} > ${COMPOSE_FILE_PATH}
  cat ${SYNC_TEMPLATE_PATH} > ${SYNC_FILE_PATH}

  chmod +x ${SH_FILE_PATH}
}
