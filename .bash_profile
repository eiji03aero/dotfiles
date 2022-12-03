source ~/.bashrc
source ~/.inputrc

source ~/dotfiles/commands/index.sh

source ~/dotfiles/.bash_profile.local

# Prompt template
# export PS1='\n\h\[\033[34m\] \w\[\033[36m\] $(__git_ps1 [%s])\[\033[00m\]\n\$ ' # jellybeans
export PS1='\n\[\033[0m\]$(date "+%Y/%m/%d %H:%M:%S")\n\[\033[0m\]\h \[\033[34m\]\w \[\033[33m\]$(__git_ps1 %s)\n\[\033[0m\]\$ ' # wombat
export EDITOR="vim"
export LC_ALL=en_US.UTF-8

# option config
stty stop undef # to enable history back on [reverse-i-search]

remove_duplicate_export_path
. "$HOME/.cargo/env"
