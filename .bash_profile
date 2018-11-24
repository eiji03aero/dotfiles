source ~/.bashrc
source ~/.inputrc
source ~/dotfiles/commands/bash.sh

if [ -e ~/dotfiles/.bash_profile.local ]; then
  source ~/dotfiles/.bash_profile.local
fi

# Prompt template
export PS1='\n\h\[\033[34m\]:\w\[\033[36m\]$(__git_ps1 [%s])\[\033[00m\]\n\$ '
export EDITOR="vim"

# option config
stty stop undef # to enable history back on [reverse-i-search]
