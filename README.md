# dotfiles

# Installation (and initial setup for machine)
- Install applications
  - Chrome
  - Alfred
  - Karabinar elements
  - Iterm
  - Docker (and rosetta for m1 chip)
  - CopyClip2
    - Make sure to enable Advanced > Paste directly
  - bettersnaptool
  - wally
  - vim (should replace the system one with homebrew-ed one)
- Clone this repository and run initialization script.
  - Update the init script to add necessary configuration

```sh
cd ~
git clone https://github.com/eiji03aero/dotfiles.git
~/dotfiles/bin/init-macos.sh
```

# Todo
- update open help command
  - it should open help in current buffer if it is empty
  - else it should open help in new tab, full window
- update dkc-create-template
  - receive optional arguments
    - one for private/public
    - one for if it should use sync
- learn about Twiggy
- learn about coc
  - coc action
    - the one that shown as system popup
      - should have good usage of it. learn it!
- migrate to karabinar-elements from btt
  - some keyboard shortcuts to support

    - move window to other display
    - maximize window
    - fullscreen window
- cleanup the mess around zsh config files
  - do research on how it should really be used
  - take care about init script

# Scribbles
- set brew zsh as login shell
```sh
sudo dscl . -create /Users/eijiosakabe UserShell /usr/local/bin/zsh
```
