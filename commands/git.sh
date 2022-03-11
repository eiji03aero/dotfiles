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

gic-remote () {
  local remote_name=${1:-origin}

  git fetch -p

  local branch=$(git branch -r \
    | sed "s@^[ \t]*$remote_name/@@" \
    | fzf +m)

  git checkout $branch
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
  git pull --rebase origin $(gib-current)
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

gib-delete () {
  target=${1}
  inverse=${2}
  if [ -z "$target" ] && [ -z "$inverse" ]; then
    cat <<- EOF
Error gib-delete: not enough arguments.
Usage:
  gib-delete [target] [inverse]
    - target ... used to grep branches whose name include it
    - inverse ... used to grep branches whoce name does not include it

EOF
    return 1
  fi

  whitelist='^(develop|origin|master|main)'
  branches=$(
    git branch \
      | grep -v '\*' \
      | sed -E 's/ +//' \
      | grep -v -E "$whitelist"
  )
  if [ -n "$target" ]; then
    branches=$(echo $branches | grep -E "$target")
  fi
  if [ -n "$inverse" ]; then
    branches=$(echo $branches | grep -v -E "$inverse")
  fi
  if [ -z "$branches" ]; then
    echo "Error gib-delete: no branch found"
    return 1
  fi

  echo ""
  echo $branches
  echo ""
  echo "Above is the branches to delete. Are you sure?"
  read 'answer?Input [yes] to proceed > '
  if [ "$answer" != "yes" ]; then
    echo "Aborting gib-delete"
    return 1
  fi

  git branch -D $(echo $branches | sed 's/\n/ /g')
}

gib-delete-merged () {
  whitelist='^(develop|origin|master|main)'
  git branch --merged \
    | grep -v '\*' \
    | sed -E 's/ +//' \
    | grep -v -E $whitelist \
    | xargs git branch -D
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
  url=$(git remote -v \
    | head -n 1 \
    | awk '{print $2}')

  if [[ $url =~ "^git@github.com" ]]; then
    url=$(echo $url | sed -E 's|^git@github.com:(.*).git$|https://github.com/\1|')
  elif [[ $url =~ "^git@gitlab.com" ]]; then
    url=$(echo $url | sed -E 's|^.*gitlab.com:([^.]*)\.git.*$|https://gitlab.com/\1|')
  elif [[ $url =~ "^https://" ]]; then
    url=$(echo $url | sed -E 's|^(.*).git$|\1|')
  fi


  echo $url
}

giopen () {
  command=${1}
  remote_url="$(git_remote_url)"

  [ ! "$remote_url" ] && return 1;

  # For github
  if [[ $remote_url =~ "github.com" ]]; then
    if [ "$command" = 'new' ]; then
      open $remote_url/pull/new/$(gib-current)
    elif [ "$command" = 'pr' ]; then
      open $remote_url/pull/$(gib-current)
    fi
  # For gitlab
  elif [[ $remote_url =~ "gitlab.com" ]]; then
    params="merge_request%5Bsource_branch%5D=$(urlencode $(gib-current))"
    # open "$remote_url/-/merge_requests/new?$params"
    echo "$remote_url/-/merge_requests/new?$params"
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
