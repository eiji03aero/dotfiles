#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...

source ${HOME}/.bashrc

setopt prompt_subst
setopt clobber

# ---------- prompt related ----------
p_time=""
p_git_branch=""

precmd-prompt-vars () {
  p_time=$(date "+%Y/%m/%d %H:%M:%S")
  p_git_branch=$(__git_ps1 %s)
}

PROMPT='
%F{white}${p_time}%f
%F{white}%f%m %F{blue}%~%f %F{yellow}${p_git_branch}%f
$ '

autoload -Uz add-zsh-hook
add-zsh-hook precmd precmd-prompt-vars
