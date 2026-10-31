#!/bin/zsh
set -euo pipefail

DOTDIR=$(cd "$(dirname "$0")" && pwd)

link() {
  local src=$1 dst=$2
  if [ -e "$dst" ] || [ -L "$dst" ]; then
    echo "⚠️  skip (already exists): $dst"
  else
    ln -s "$src" "$dst"
    echo "✅ linked: $dst"
  fi
}

link "$DOTDIR/.zshrc"     ~/.zshrc
link "$DOTDIR/.zshenv"    ~/.zshenv
link "$DOTDIR/.ideavimrc" ~/.ideavimrc

mkdir -p ~/.config
link "$DOTDIR/nvim/"      ~/.config/nvim
link "$DOTDIR/tmux/"      ~/.config/tmux
link "$DOTDIR/wezterm/"   ~/.config/wezterm
link "$DOTDIR/alacritty/" ~/.config/alacritty
link "$DOTDIR/zellij/"    ~/.config/zellij
