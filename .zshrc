fpath=(/usr/local/share/zsh-completions $fpath)
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

source ${HOME}/.bashrc
source /usr/local/etc/bash_completion.d/git-prompt.sh

# ---------- prompt related ----------
setopt prompt_subst
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
