#!/bin/bash

COMMAND=${1:-up}

function execute-docker-compose () {
  docker-compose \
    -f 'docker-compose.yml' \
    $@
}

function execute-docker-sync () {
  docker-sync \
    $@ \
    -c 'docker-sync.yml'
}

function stop-docker-compose () {
  # execute-docker-sync stop
  execute-docker-compose stop
}

if [ $COMMAND = 'up' ] && [ $# -le 1 ]; then
  trap 'stop-docker-compose' SIGINT

  # execute-docker-sync start
  execute-docker-compose up
else
  execute-docker-compose $@
fi
