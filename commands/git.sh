#!/bin/zsh

gic () {
  if [ $# -eq 0 ]; then
    branches=$(git branch -vv) &&
    branch=$(echo "$branches" | fzf +m) &&
    git checkout $(echo "$branch" | awk '{print $1}' | sed "s/.* //")
  else
    git checkout $1
  fi
}

gicb () {
  if [ $# -eq 0 ]; then
    echo "error: You need to pass first argument for the name of new branch"
    return 1
  fi
  git checkout -b $(fmt-concat-bars $@)
}

gim () {
  if [ $# -eq 0 ]; then
    branches=$(git branch -vv) &&
    branch=$(echo "$branches" | fzf +m) &&
    git merge $(echo "$branch" | awk '{print $1}' | sed "s/.* //")
  else
    git merge $1
  fi
}

gipl() {
  git pull origin $(gib-current)
}

gipl-f() {
  git pull --force origin $(gib-current)
}

gipl-r() {
  b="$1"
  git fetch origin $b
  git checkout origin $b
}

gir () {
  git reset
}

gir-1 () {
  git reset HEAD~1
}

gib-current () {
  echo $(git rev-parse --abbrev-ref HEAD)
}

gips() {
  git push origin $(gib-current)
}

gips-f() {
  git push -f origin $(gib-current)
}

girb () {
  if [ $# -eq 0 ]; then
    branch=$(git branch -vv | fzf +m) &&
    git rebase $(echo "$branch" | awk '{print $1}' | sed "s/.* //")
  else
    git rebase $1
  fi
}

girb-h () {
  git rebase -i HEAD~$1
}

git_remote_url () {
  echo $(git remote -v \
    | head -n 1 \
    | awk '{print $2}' \
    | sed -E 's@^[^:]*:(.*)\.git$@https://github.com/\1@')
}

giopen () {
  remote_url="$(git_remote_url)"
  command=${1}

  [ ! "$remote_url" ] && return 1;

  if [ "$command" = 'new' ]; then
    open $remote_url/pull/new/$(gib-current)
  elif [ "$command" = 'pr' ]; then
    open $remote_url/pull/$(gib-current)
  else
    open $remote_url
  fi
}

gifin () {
  open_command=${1:-new}

  git push origin $(gib-current)
  giopen $open_command
}

girm-untracked () {
  git status \
    | sed -n '/Untracked files:/, $p' \
    | tail -n +3 \
    | xargs rm -rf
}

gi-config-to-local () {
  g_user_name=$(git config --global user.name)
  g_user_email=$(git config --global user.email)

  git config --local user.name "$g_user_name"
  git config --local user.email "$g_user_email"
}

# ==================== hooks ====================
gi-install-prepare-commit-msg () {
  hooks_path="./.git/hooks"
  file_path="${hooks_path}/prepare-commit-msg"

  if [ ! -d $hooks_path ]; then
    echo 'error: has to be run on git directory'
    return 1
  fi

  if [ -e $file_path ]; then
    echo 'error: cannot override existing hook'
    return 1
  fi

  touch $file_path
  cat ~/dotfiles/templates/git/prepare-commit-msg > $file_path
  chmod +x $file_path
}
