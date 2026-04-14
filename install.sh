#!/usr/bin/env bash

set -euo pipefail

repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

require_command() {
  if ! command -v "$1" >/dev/null 2>&1; then
    printf 'Missing required command: %s\n' "$1" >&2
    exit 1
  fi
}

require_command git
require_command stow
require_command curl

if [ ! -d "$HOME/.oh-my-zsh" ]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi

mkdir -p "$HOME/.config"
mkdir -p "$HOME/.tmux/plugins"

if ! command -v starship >/dev/null 2>&1; then
  curl -sS https://starship.rs/install.sh | sh -s -- --yes
fi

if [ ! -f "$HOME/.config/starship.toml" ]; then
  starship preset pastel-powerline -o "$HOME/.config/starship.toml"
fi

if [ ! -d "$HOME/.config/alacritty/themes/.git" ]; then
  git clone https://github.com/alacritty/alacritty-theme "$HOME/.config/alacritty/themes"
fi

if [ ! -d "$HOME/.tmux/plugins/tpm/.git" ]; then
  git clone https://github.com/tmux-plugins/tpm "$HOME/.tmux/plugins/tpm"
fi

if [ ! -d "$HOME/.config/tmux/plugins/catppuccin/tmux/.git" ]; then
  mkdir -p "$HOME/.config/tmux/plugins/catppuccin"
  git clone -b v2.3.0 https://github.com/catppuccin/tmux.git "$HOME/.config/tmux/plugins/catppuccin/tmux"
fi

rm -f "$HOME/.zshrc"
stow --dir "$repo_root" --target "$HOME" alacritty tmux zsh

printf 'Installed dotfiles with stow.\n'
printf 'Open tmux and press prefix + I to install tmux plugins.\n'
