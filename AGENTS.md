# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

Dotfiles managed with GNU `stow`. Two packages: `alacritty` and `tmux`. Running `./install.sh` bootstraps dependencies and symlinks both packages into `$HOME`.

## Installation

```sh
./install.sh
```

Requires: `git`, `stow`. Clones [alacritty-theme](https://github.com/alacritty/alacritty-theme) to `~/.config/alacritty/themes` and [TPM](https://github.com/tmux-plugins/tpm) to `~/.tmux/plugins/tpm`, then stows both packages.

After first tmux launch: `prefix + I` to install plugins via TPM.

## Structure

- `alacritty/.config/alacritty/alacritty.toml` — stowed to `~/.config/alacritty/alacritty.toml`
- `tmux/.tmux.conf` — stowed to `~/.tmux.conf`

## Theme

Both alacritty and tmux use **Catppuccin Mocha**. To switch the alacritty theme, edit the `import` path in `alacritty/.config/alacritty/alacritty.toml` to point to another file under `~/.config/alacritty/themes/themes/`.

## Applying changes

After editing configs, re-run `stow` or just edit the symlink targets directly (changes reflect immediately since stow uses symlinks):

```sh
stow --dir . --target "$HOME" alacritty tmux
```
