# dotfiles

# Todo
- add the add chrome page url ... service to macos folder
  - with how to use it, how to install it on other device
  - workflow is completed in `~/Library/Services/Add chrome page url to safari reading list.workflow`
  - rest of todos are:
    - configure alfred to run this
      - probably this type of script is not supported to index into alfred by default
      - probably I will have to look into other approach (like write command to execute this quick action)
    - add the content of script into dotfiles
      - with brief explanation on top of file
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

# Installation (and initial setup for machine)
- Install applications
  - XCode
  - Chrome
  - Iterm
  - Alfred
  - Karabinar elements
  - Docker
    - and rosetta for m1 chip
  - CopyClip2
    - Make sure to enable Advanced > Paste directly
  - bettersnaptool
  - wally
- Clone repo and run initialization script

```sh
cd ~
git clone https://github.com/eiji03aero/dotfiles.git
~/dotfiles/bin/init-macos.sh
```

# Scribbles
- set brew zsh as login shell
```sh
sudo dscl . -create /Users/eijiosakabe UserShell /usr/local/bin/zsh
```
