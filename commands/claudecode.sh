#!/bin/zsh

# -------------------- Claude Code --------------------

CLAUDECODE_DIR="$HOME/dotfiles/claudecode"

eiji03aero-cc-setup () {
  echo "Setting up Claude Code..."

  mkdir -p "$HOME/.claude"
  ln -sf "$CLAUDECODE_DIR/settings.json" "$HOME/.claude/settings.json"
  echo "Symlinked settings.json"

  eiji03aero-cc-marketplace-add

  echo "Done!"
}

eiji03aero-cc-marketplace-add () {
  claude plugin marketplace add "$CLAUDECODE_DIR"
  echo "Added marketplace: eiji03aero-plugins"
}
