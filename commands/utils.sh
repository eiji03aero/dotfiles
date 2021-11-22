#!/bin/bash

# -------------------- log --------------------
log-func-info () {
echo "[Info] $(caller-name): $@"
}

log-func-error () {
  echo "[Error] $(caller-name): $@"
}

# -------------------- assertion --------------------
assert-enough-arguments () {
  if [ $1 -lt $2 ]; then
    echo "[Error] $(caller-name): not enough arguments"
    exit-shell
  fi
}

# -------------------- ensurer --------------------
ensure-file-existence () {
  assert-enough-arguments $# 1
  file_path=${1}

  if [ -e "$file_path" ]; then
    log-func-info "already exists $file_path"
  else
    log-func-info "creating $file_path"
    touch $file_path
  fi
}

ensure-directory-existence () {
  assert-enough-arguments $# 1
  dir_path=${1}

  if [ -e "$file_path" ]; then
    log-func-info "already exists $dir_path"
  else
    log-func-info "creating $dir_path"
    mkdir -p $dir_path
  fi
}

# -------------------- process --------------------
current-shell () {
  ps -p $$ | awk "NR==2" | awk '{ print $4 }' | tr -d '-';
}

exit-shell () {
  kill -INT $$
}

func-name() {
  idx=${1:-1}
  shell=$(current-shell)
  if [[ $shell =~ 'bash' ]]; then
    echo ${FUNCNAME[$idx]}
  elif [[ $shell =~ 'zsh' ]]; then
    echo $funcstack[$((idx+1))]
  else
    log-func-error "not supported shell: $shell"
  fi
}

caller-name() {
  # Thisis brain-numbing :(
  # example func stack:
  # func-name <- caller-name <- [client func name] <- [caller of client func]
  func-name 3
}

psgrep () { ps aux | grep "$1"; }

psgrep_kill () { psgrep $1 | awk '{print $2}' | xargs kill -9; }

# -------------------- filesystem --------------------
mkdircd () { mkdir -p "$@" && cd "$_"; }

cd-fzf () {
  local dir
  dir=$(find ${1:-.} -type d -print 2> /dev/null | fzf +m) &&
  cd "$dir"
}

# -------------------- network --------------------
curl-head ()  { curl -D - -s -o /dev/null $1; }

urlencode () {
  echo "$1" | nkf -WwMQ | sed 's/=$//g' | tr = % | tr -d '\n'
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
