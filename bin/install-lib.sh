#!/bin/zsh

source ~/dotfiles/commands/utils.sh

cmd="${1:-all}"

install-brew () {
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
}

install-git () {
  brew install git
  ensure-directory-existence $HOME/.zsh
  curl -o ~/.zsh/git-completion.bash https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash
  curl -o ~/.zsh/_git https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.zsh
}

install-languages () {
  # node
  brew install node

  # rust
  # brew install rustup
  # # required by coc-rls
  # rustup-init
  # rustup component add rls rust-analysis rust-src
}

install-vim () {
  brew install vim
}

install-tmux () {
  brew install tmux
  brew install tmuxinator
}

install-fzf () {
  brew install fzf
}

install-ag () {
  brew install fzf
}

install-ranger () {
  pip3 install ranger-fm
}

install-universal-ctags () {
  brew install --HEAD universal-ctags/universal-ctags/universal-ctags
}

install-xquartz () {
  brew cask install xquartz
  sudo launchctl load -w /Library/LaunchAgents/org.macosforge.xquartz.startx.plist
}

cat <<-EOF
install-lib.sh: install-lib.sh: Starting ...

$(cat ~/dotfiles/aa/text/install-lib-sh.txt)

EOF

if [ $cmd = "all" ]; then
  echo install-lib.sh: Installing all the goodies ...

  install-brew

  install-git
  install-languages
  install-vim
  install-tmux
  install-fzf
  install-ranger
  install-universal-ctags
  install-xquartz

  echo "install-lib.sh: Completed installation!"

elif [ $cmd = "git" ]; then
  echo install-lib.sh: Installing git ...
  install-git
fi
