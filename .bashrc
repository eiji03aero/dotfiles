function mkdircd () { mkdir -p "$@" && cd "$_"; }
function psgrep () { ps aux | grep "$1"; }
function gigrep () { git branch | grep "$1" | head -n 1 | xargs git checkout ; }
function girb () { git rebase -i HEAD~"$1"; }
function ct () { ctags -R ; }

# alias
alias ls='ls -G'

alias vimrc='vim ~/.vimrc'
alias authc='cd auth-conciergeu'
alias dia='cd dialog_api'
alias cuw='cd cu_webplugin'
alias lenga='cd lenga_app'

alias gis='git status'
alias girh='git reset --hard'
alias gilg='git log --graph'
alias gilgp='git log --graph -p'
alias gilgo='git log --graph --oneline'
alias gia='git add .'
alias gicm='git commit -m'
alias gib='git branch'
alias gic='git checkout'
alias gicb='git checkout -b'
alias gim='git merge'
alias gip='git push'
alias gipl='git pull'
alias giplom='git pull origin master'

alias tm='tmux'
alias tma='tmux a -t'
alias tmn='tmux new -s'
alias tmkss='tmux kill-session -t'
alias tmksr='tmux kill-server'
alias tmslmv='tmux split-window -h & tmux resize-pane -R 40'
alias tmr='tmuxinator'

alias vg='vagrant'
