alias ls='ls -G'
alias cdr='. ranger'

alias gis='git status'
alias gif='git fetch'
alias girh='git reset --hard'
alias gilg='git log --graph'
alias gilgp='git log --graph -p'
alias gilgo='git log --graph --oneline'
alias gia='git add .'
alias gicm='git commit'
alias gicmm='git commit -m'
alias gicmn='git commit -n -m'
alias gicmb='git commit --allow-empty -m "base commit"'
alias gicma='git commit --amend --no-edit'
alias gicm-base='git commit --allow-empty -m "base commit"'
alias gib='git branch'
alias gicl='git clone'
alias girb-c='git rebase --continue'
alias girb-a='git rebase --abort'
alias gicp='git cherry-pick'
alias gicp-c='git cherry-pick --continue'
alias gicp-a='git cherry-pick --abort'

alias tm='tmux new-session'
alias tmls='tmux ls'
alias tma='tmux a -t'
alias tmn='tmux new -s'
alias tmkss='tmux kill-session -t'
alias tmksr='tmux kill-server'
alias tmr='tmuxinator'

alias dk='docker'
alias dkc='docker container'
alias dki='docker image'
alias dkcom='docker-compose'
alias dkcom-e='docker-compose -f .eiji03aero.local.docker-compose.yml'
alias dkv='docker volume'
alias dks='docker stats'

# cds
alias cd-mash='cd ~/projects/mash'
alias cd-mskit='cd ~/projects/mskit'
alias cd-cu='cd ~/projects/conciergeu'
alias cd-cu-web='cd ~/projects/conciergeu/conciergeu_website'

alias curl-json='curl -H "Content-Type: application/json" -H "Accept: application/json"'
