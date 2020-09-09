#!/bin/bash

echo "you need to configure [project_name] and [container_name]"
exit 1

cmd=${1:-up}
project_name="workspace"
container_name="workspace"

execute-docker-compose () {
  docker-compose \
    -p $project_name \
    -f 'docker-compose.yml' \
    $@
}

execute-docker-sync () {
  docker-sync \
    $@ \
    -c 'docker-sync.yml'
}

stop-docker-compose () {
  # execute-docker-sync stop
  execute-docker-compose stop
}

if [ $cmd = 'up' ] && [ $# -le 1 ]; then
  # trap 'stop-docker-compose' SIGINT
  # execute-docker-sync start
  # execute-docker-compose up

  # execute-docker-sync start
  # execute-docker-compose up -d
  # execute-docker-compose exec $container_name /bin/bash
  # stop-docker-compose
elif [ $cmd = 'bash' ]; then
  execute-docker-compose exec $container_name /bin/bash
else
  execute-docker-compose $@
fi
