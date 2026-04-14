# Getting Started

1. Install [Alacritty](https://github.com/alacritty/alacritty).
2. Install [tmux](https://github.com/tmux/tmux/wiki).
3. Install `git`, `stow`, and `curl`.
4. Install the `BlexMono Nerd Font Mono` font.
5. Clone this repo.
6. From the repo root, run:

```sh
./install.sh
```

The script:

- installs [starship](https://starship.rs) if missing
- clones the upstream Alacritty theme collection to `~/.config/alacritty/themes` if it is missing
- clones TPM to `~/.tmux/plugins/tpm` if it is missing
- clones the Catppuccin tmux theme to `~/.config/tmux/plugins/catppuccin/tmux` if it is missing
- uses `stow` to symlink the `alacritty` and `tmux` packages into `$HOME`

To switch themes later, edit `alacritty/.config/alacritty/alacritty.toml` and replace the theme filename in `[general].import` with another file from `~/.config/alacritty/themes/themes/`.

After opening tmux for the first time, press `prefix + I` to install plugins.
