#!/bin/sh

cat <<-EOF

init-zsh.sh:
  Starting initialization of zsh ...

$(cat ~/dotfiles/aa/text/init-zsh-sh.txt)

EOF

touch ~/dotfiles/zsh/.zprofile.local

git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

ln -sf ~/dotfiles/zsh/.zprofile ~/.zprofile
ln -sf ~/dotfiles/zsh/.zlogin ~/.zlogin
ln -sf ~/dotfiles/zsh/.zlogout ~/.zlogout
ln -sf ~/dotfiles/zsh/.zpreztorc ~/.zpreztorc
ln -sf ~/dotfiles/zsh/.zshenv ~/.zshenv
ln -sf ~/dotfiles/zsh/.zshrc ~/.zshrc


cat <<-EOF

init-zsh.sh:
  Completed initialization!

EOF
