#!/bin/bash

source ~/dotfiles/commands/git.sh
source ~/dotfiles/commands/dkcom-create-template.sh
source ~/dotfiles/commands/remove_duplicate_export_path.sh

function ct () { ctags -R ; }

function mkdircd () { mkdir -p "$@" && cd "$_"; }

function psgrep () { ps aux | grep "$1"; }

function psgrep_kill () { psgrep $1 | awk '{print $2}' | xargs kill -9; }

# -------------------- tmux --------------------
function tmes () {
  tmux new-session \; \
    split-window -h -l 45 \; \
    select-pane -L \; \
    send-keys 'vim' Enter
}

# -------------------- docker --------------------
function dkservicefmt () {
  read -p "Input manager container name: " manager_name
  read -p "Input service name: " service_name

  docker container exec -it $manager_name docker service ps $service_name \
    --no-trunc \
    --filter "desired-state=running" \
    --format "docker container exec -it {{.Node}} docker container exec -it {{.Name}}.{{.ID}} bash"
}

# -------------------- ngrok --------------------
function ngrok_init () {
  if [ $# -ne 2 ]; then
    cat <<- EOF
    ngrok_init: error

    You need to pass exactly two arguments
      - 1: port you want to redirect to
      - 2: port you want to use to inspect ngrok. incremental number
EOF
    return 1;
  fi

  port=${1}
  ngrok_port=${2}
  api_url="http://localhost:${ngrok_port}/api/tunnels"

  ngrok http $port -log=stdout > /dev/null &

  # need to wait a little bit before acquire url
  sleep 3s

  # return ngrok address to stdout
  echo $(curl -s $api_url \
    | grep -oE 'http://.{8}.ngrok.io')
  return 0;
}
