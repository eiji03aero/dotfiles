source ~/.bashrc
source ~/.inputrc

# Prompt template
export PS1='\n\h\[\033[34m\]:\w\[\033[36m\]$(__git_ps1 [%s])\[\033[00m\]\n\$ '

# bin paths
export PATH="/usr/local/opt/imagemagick@6/bin:$PATH"
export PATH="/usr/local/opt/openssl@1.1/bin:$PATH"
export PATH="/usr/local/opt/python/libexec/bin:$PATH"
export PATH=$PATH:./node_modules/.bin
export PATH=/usr/local/bin:$PATH

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
[[ -s "/Users/eijiosakabe/.gvm/scripts/gvm" ]] && source "/Users/eijiosakabe/.gvm/scripts/gvm"
export GOROOT=${GOROOT:-/usr/local/opt/go/libexec}
export GOPATH=$GOPATH:$HOME/go:$HOME/go/src/github.com/eiji03aero
export PATH=$PATH:$GOROOT/bin:$HOME/go/bin

# rbenv
export PATH="~/.rbenv/bin:$PATH"
export PATH="$HOME/.rbenv/shims:$PATH"
eval "$(rbenv init -)"

# flutter
export PATH="$HOME/flutter/bin:$PATH"

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
export FZF_DEFAULT_OPTS='--height 40% --reverse'

# enhancd
export ENHANCD_FILTER=fzf:peco
export ENHANCD_USE_FUZZY_MATCH=fzf:peco
export ENHANCD_HOOK_AFTER_CD='ls -a'
export ENHANCD_HYPHEN_NUM=50
source /Users/eijiosakabe/enhancd/init.sh

# option config
stty stop undef # to enable history back on [reverse-i-search]

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/eijiosakabe/.sdkman"
[[ -s "/Users/eijiosakabe/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/eijiosakabe/.sdkman/bin/sdkman-init.sh"
export PATH="/Users/eijiosakabe/Library/Android/sdk/platform-tools:$PATH"

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
