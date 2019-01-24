#!/bin/bash

source ~/dotfiles/commands/remove_duplicate_export_path.sh

function ct () { ctags -R ; }

function mkdircd () { mkdir -p "$@" && cd "$_"; }

function psgrep () { ps aux | grep "$1"; }

function girb () { git rebase -i HEAD~"$1"; }

function gigrep () {
  if !(type "git" > /dev/null 2>&1); then
    echo "Ain't gonna get done without git"
    return 1
  fi

  if [ $# -eq 0 ]; then
    read -p "Input phrase to grep branch: " branch_name
  else
    branch_name=$1
  fi

  candidates=$(git branch | grep $branch_name)
  candidates_length=$(git branch | grep -c $branch_name)

  if [ $candidates_length -eq 1 ]; then
    git checkout $candidates
  else
    select branch in $candidates; do
      git checkout $branch
      break
    done
  fi
}

function giopen () {
  remote_url=$(git remote -v \
    | head -n 1 \
    | awk '{print $2}' \
    | sed -E 's@^[^:]*:(.*)\.git$@https://github.com/\1@')

  [ ! "$remote_url" ] && return 1;

  while getopts np OPT
  do
    case $OPT in
      n)
        branch=$(git branch --contains | sed -E 's/^\*.(.*)/\1/')
        name=$remote_url/pull/new/$branch
        open $name
        return 1
        ;;
      p)
        branch=$(git branch --contains | sed -E 's/^\*.(.*)/\1/')
        name=$remote_url/pull/$branch
        open $name
        return 1
        ;;
    esac
  done

  open $remote_url
}
