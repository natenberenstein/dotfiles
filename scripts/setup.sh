#!/usr/bin/env bash
# setup.sh — symlink dotfiles configs into their expected locations
# Run this from the root of the dotfiles repo after cloning.

set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

link() {
  local src="$1"
  local dest="$2"
  if [ -e "$dest" ] && [ ! -L "$dest" ]; then
    echo "  [backup] $dest -> ${dest}.bak"
    mv "$dest" "${dest}.bak"
  fi
  ln -sf "$src" "$dest"
  echo "  [linked] $dest -> $src"
}

echo "==> Linking bash config"
link "$DOTFILES_DIR/bash/.bashrc" "$HOME/.bashrc"

echo "==> Linking starship config"
mkdir -p "$HOME/.config"
link "$DOTFILES_DIR/starship/starship.toml" "$HOME/.config/starship.toml"

echo "==> Linking tmux config"
link "$DOTFILES_DIR/tmux/.tmux.conf" "$HOME/.tmux.conf"

echo "==> Linking nvim config"
mkdir -p "$HOME/.config"
link "$DOTFILES_DIR/nvim" "$HOME/.config/nvim"

echo ""
echo "==> Done. Run: source ~/.bashrc"
