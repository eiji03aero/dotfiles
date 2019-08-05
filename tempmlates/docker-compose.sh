#!/bin/bash

COMMAND=${1:-up}

function execute_docker_compose () {
  docker-compose \
    -f 'docker-compose.yml' \
    $@
}

function execute_docker_sync () {
  docker-sync \
    $@ \
    -c 'docker-sync.yml'
}

function stop_docker_compose () {
  # execute_docker_sync stop
  execute_docker_compose stop
}

if [ $COMMAND = 'up' ] && [ $# -le 1 ]; then
  trap 'stop_docker_compose' SIGINT

  # execute_docker_sync start
  execute_docker_compose up
else
  execute_docker_compose $@
fi
