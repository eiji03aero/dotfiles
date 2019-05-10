#!/bin/bash

source ~/dotfiles/commands/remove_duplicate_export_path.sh

function ct () { ctags -R ; }

function mkdircd () { mkdir -p "$@" && cd "$_"; }

function psgrep () { ps aux | grep "$1"; }

function psgrep_kill () { psgrep $1 | awk '{print $2}' | xargs kill -9; }

# -------------------- git --------------------
function gic () {
  if [ $# -eq 0 ]; then
    branches=$(git branch -vv) &&
    branch=$(echo "$branches" | fzf +m) &&
    git checkout $(echo "$branch" | awk '{print $1}' | sed "s/.* //")
  else
    git checkout $1
  fi
}

function gic-parent () {
  git checkout $(gib-parent)
}

function gicb () {
  if [ $# -eq 0 ]; then
    echo "error: You need to pass first argument for the name of new branch"
    return 1
  fi
  git checkout -b $1
}

function gicb-child () {
  if [ $# -lt 1 ]; then
    echo "error: You need to pass first argument to append the name of new branch"
    return 1
  fi

  branch=$(gib-current \
    | sed "s/parent$/${1}/")
  git checkout -b $branch
}

function gim-parent () {
  parent_branch=$(gib-current \
    | sed "s/\/[^/]*$/\/parent/")
  git merge $parent_branch
}

gicb-origin () {
  origin_branch_name=$(git branch -r | fzf)
  branch_name=$(echo $origin_branch_name | sed -E "s@origin/(.*)@\1@")

  git checkout -b $branch_name $origin_branch_name
}

function girb () { git rebase -i HEAD~"$1"; }

function gib-current () {
  echo $(git branch \
    | grep -oE '^\* .*' \
    | sed -E 's@\* (.*)@\1@')
}

function gib-parent () {
  echo $(gib-current \
    | sed "s/\/[^/]*$/\/parent/")
}

function gips-current() {
  git push origin $(gib-current)
}

function gipl-current() {
  git pull origin $(gib-current)
}

function gipl-master() {
  git pull origin master
}

function git_remote_url () {
  echo $(git remote -v \
    | head -n 1 \
    | awk '{print $2}' \
    | sed -E 's@^[^:]*:(.*)\.git$@https://github.com/\1@')
}

function giopen () {
  remote_url=$(git_remote_url)

  [ ! "$remote_url" ] && return 1;

  if [ $1 = 'new' ]; then
    open $remote_url/pull/new/$(gib-current)
  elif [ $1 = 'pr' ]; then
    open $remote_url/pull/$(gib-current)
  elif [ $1 = 'pr-parent' ]; then
    open $remote_url/compare/$(gib-parent)...$(gib-current)?expand=1
  else
    open $remote_url
  fi
}

function gifin () {
  open_command=${1:-new}

  git push origin $(gib-current)
  giopen $open_command
}

function girbmaster () {
  branch=$(gib-current)
  git checkout master
  git pull origin master
  git checkout $branch
  git rebase master
}

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

function dkcom-exec () {
  yml=$(find . | fzf --prompt="Select the config > " --query="'docker-compose")
  echo "Use config: ${yml}"
  echo
  service_name=$(docker-compose -f $yml config --services | fzf --prompt="Select the service > ")
  echo "Use service: ${service_name}"
  echo
  read -p "Input the command: " command_string
  docker-compose -f $yml exec $service_name $command_string
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
