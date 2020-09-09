#!/bin/bash

source ~/dotfiles/commands/git.sh
source ~/dotfiles/commands/dkc-runner.sh
source ~/dotfiles/commands/dkcom-create-template.sh
source ~/dotfiles/commands/remove_duplicate_export_path.sh
source ~/dotfiles/commands/bridge.sh

ct () { ctags -R ; }

mkdircd () { mkdir -p "$@" && cd "$_"; }

psgrep () { ps aux | grep "$1"; }

psgrep_kill () { psgrep $1 | awk '{print $2}' | xargs kill -9; }

curl-head ()  { curl -D - -s -o /dev/null $1; }

count-files () { find . | wc -l; }

poll-file-count () {
  threshold=${1}
  while $([ $(count-files) -lt $1 ]); do echo mada desu $(count-files); sleep 2s; done; echo owarimashita
}

fmt-concat-bars () {
  echo "$@" | sed -e "s/[.*#;:]//g" -e "s/[][(), \/]/-/g";
}

fd() {
  local dir
  dir=$(find ${1:-.} -type d -print 2> /dev/null | fzf +m) &&
  cd "$dir"
}

await-nc () {
  host="${1}"
  port="${2}"
  while ! nc -z $host $port; do
    echo waiting for $host:$port ...
    sleep 3s
  done
  echo done waiting $host:$port
}

await-curl () {
  host="${1}"
  port="${2}"
  while ! curl -sf -o /dev/null $host:$port; do
    echo waiting for $host:$port ...
    sleep 3s
  done
  echo done waiting $host:$port
}

await-docker-container-cpu () {
  container_name=$1

  while [ $(docker stats --no-stream \
    | grep $container_name \
    | awk '{print $3}' \
    | sed 's/%//g' \
    | sed 's/^/0.10 > /' \
    | bc) = 1 ]; do
    echo "waiting for docker container $container_name to be stable ..."
    sleep 1s
  done
  echo "done waiting for docker container $container_name"
}

# -------------------- vim --------------------
vim-perf-cursor () {
  file=${1}
  vim +'call ProfileCursorMove()' $file
}

# -------------------- tmux --------------------
tmes () {
  tmux new-session \; \
    split-window -h -l 45 \; \
    select-pane -L \; \
    send-keys 'vim' Enter
}

# -------------------- docker --------------------
dkc-stop-all () { docker container stop $(docker container ls -aq); }

dkc-attach() {
  set -e
  container_id=$(docker container ls \
    | tail +2 \
    | awk '{print $1 ":" $2}' \
    | fzf --prompt "Select container: " \
    | sed 's/:.*$//')

  docker attach $container_id
}

# -------------------- ngrok --------------------
ngrok_init () {
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
