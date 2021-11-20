#!/bin/zsh

cat <<-EOF
init-macos.sh:
  Starting the initialization process for mac os ...
  Expecting login shell is [zsh]

EOF

~/dotfiles/bin/init-unix.sh
~/dotfiles/bin/install-lib.sh
~/dotfiles/bin/init-zsh.sh

cat <<-EOF

init-macos.sh:
  Completed the initialization!
  Let's make the world better place!!!

$(cat ~/dotfiles/aa/silicon-valley-logo@160.txt)

$(cat ~/dotfiles/aa/silicon-valley-jobs@160.txt)

EOF
