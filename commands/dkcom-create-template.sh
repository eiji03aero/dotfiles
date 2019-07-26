#!/bin/bash

dkcom-create-template() {
  SH_FILE_NAME="docker-compose.sh"
  COMPOSE_FILE_NAME="docker-compose.yml"
  DIRECTORY="."
  SH_FILE_PATH="${DIRECTORY}/${SH_FILE_NAME}"
  COMPOSE_FILE_PATH="${DIRECTORY}/${COMPOSE_FILE_NAME}"

  cat > ${SH_FILE_PATH} <<-EOF
#!/bin/bash

COMMAND=\${1:-up}

function execute_docker_compose () {
  docker-compose \\
    -f 'docker-compose.yml' \\
    \$@
}

function execute_docker_sync () {
  docker-sync \\
    \$@ \\
    -c 'docker-sync.yml'
}

function stop_docker_compose () {
  # execute_docker_sync stop
  execute_docker_compose stop
}

if [ \$COMMAND = 'up' ] && [ \$# -le 1 ]; then
  trap 'stop_docker_compose' SIGINT

  # execute_docker_sync start
  execute_docker_compose up
else
  execute_docker_compose \$@
fi
EOF

  chmod +x ${SH_FILE_PATH}

  cat > ${COMPOSE_FILE_PATH} <<-EOF
version: '3'

services:
  app:
    container_name: app
    build: .
    image: local/node:11.15.0
    ports:
      - "8080:8080"
    volumes:
      - .:/projects
    tty: true
    command: /bin/bash
EOF
}
