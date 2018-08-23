source ~/.bashrc
source ~/.inputrc

# Prompt template
export PS1='\h\[\033[34m\]:\W\[\033[36m\]$(__git_ps1 [%s])\[\033[00m\]\n\$ '

# bin paths
export PATH="/usr/local/opt/imagemagick@6/bin:$PATH"
export PATH="/usr/local/opt/openssl@1.1/bin:$PATH"
export PATH="/usr/local/opt/python/libexec/bin:$PATH"
export PATH=$PATH:./node_modules/.bin
export PATH=/usr/local/bin:$PATH
export PATH=/Users/eijiosakabe/Documents/data/my_pg/bin:$PATH

# tmuxinator
export EDITOR="vim"
source ~/.tmuxinator/tmuxinator.bash

# git config
source /usr/local/etc/bash_completion.d/git-prompt.sh
source /usr/local/etc/bash_completion.d/git-completion.bash
GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWSTASHSTATE=true

# Node Version Manager
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
. "/usr/local/opt/nvm/nvm.sh"

# Python
export PATH=$PATH:/Users/eijiosakabe/Library/Python/2.7/bin

# go env
export GOROOT=/usr/local/opt/go/libexec
export GOPATH=$HOME/go:$HOME/go/src/github.com/eiji03aero
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin
[[ -s "/Users/eijiosakabe/.gvm/scripts/gvm" ]] && source "/Users/eijiosakabe/.gvm/scripts/gvm"
# export GO15VENDOREXPERIMENT=1 # Maybe you can delete this one

# rbenv
export PATH="~/.rbenv/bin:$PATH"
export PATH="$HOME/.rbenv/shims:$PATH"
eval "$(rbenv init -)"

# PostgreSQL
export PKG_CONFIG_PATH="/usr/local/Cellar/imagemagick/7.0.5-0/lib/pkgconfig:$PKG_CONFIG_PATH"

# ssh
SSH_ENV=/Users/eijiosakabe/.ssh/environment

# start the ssh-agent
function start_agent {
  echo "Initializing new SSH agent..."
  # spawn ssh-agent
  /usr/bin/ssh-agent | sed 's/^echo/#echo/' > "${SSH_ENV}"
  echo succeeded
  chmod 600 "${SSH_ENV}"
  . "${SSH_ENV}" > /dev/null
  /usr/bin/ssh-add
}

if [ -f "${SSH_ENV}" ]; then
  . "${SSH_ENV}" > /dev/null
  ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
    start_agent;
  }
else
    start_agent;
fi

# fzf
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# enhancd
source /Users/eijiosakabe/share/enhancd/init.sh
ENHANCD_FILTER=fzf:peco
ENHANCD_USE_FUZZY_MATCH=fzf:peco
ENHANCD_HOOK_AFTER_CD=ls

# option config
stty stop undef # to enable history back on [reverse-i-search]

function mkdircd () { mkdir -p "$@" && cd "$_"; }
