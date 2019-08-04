source ~/.bashrc
source ~/.inputrc

source ~/dotfiles/commands/index.sh

source ~/dotfiles/.bash_profile.local

# Prompt template
# export PS1='\n\h\[\033[34m\] \w\[\033[36m\] $(__git_ps1 [%s])\[\033[00m\]\n\$ ' # jellybeans
export PS1='\n\h \e[34m\w \e[33m$(__git_ps1 %s)\e[0m\n\$ ' # wombat
export EDITOR="vim"
export LC_ALL=en_US.UTF-8

# option config
stty stop undef # to enable history back on [reverse-i-search]

remove_duplicate_export_path
