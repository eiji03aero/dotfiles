function ct () { ctags -R ; }
function mkdircd () { mkdir -p "$@" && cd "$_"; }
function psgrep () { ps aux | grep "$1"; }
function gigrep () { git branch | grep "$1" | head -n 1 | xargs git checkout ; }
function girb () { git rebase -i HEAD~"$1"; }
function gigrep () {
  if !(type "git" > /dev/null 2>&1); then
    echo "Ain't gonna get done without git"
    return 1
  fi

  read -p "Input phrase to grep branch: " branch_name

  select branch in $(git branch | grep $branch_name); do
    git checkout $branch
    break
  done
}
