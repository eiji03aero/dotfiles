#!/bin/bash

cmd=${1:-up}
project_name=""
file_prefix="{{file_prefix}}"
container_name="workspace"

has-docker-sync() {
  command -v docker-sync 1>/dev/null
}

execute-docker-compose () {
  opts="-f ${file_prefix}docker-compose.yml"

  if has-docker-sync; then
    opts="$opts -f ${file_prefix}docker-compose-sync.yml"
  fi

  if [ -n "$project_name" ]; then
    opts="$opts -p $project_name"
  fi

  docker-compose $opts $@
}

execute-docker-sync () {
  if ! has-docker-sync; then
    return 0
  fi

  opts="-c ${file_prefix}docker-sync.yml"
  docker-sync $@ $opts
}

stop-docker-compose () {
  execute-docker-sync stop
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

elif [ $cmd = 'stop' ]; then
  stop-docker-compose

elif [ $cmd = 'bash' ]; then
  execute-docker-compose exec $container_name /bin/bash

else
  execute-docker-compose $@
fi
