#!/usr/bin/env bash
mkdir -p ~/.config

# Create .giconfig symlink
[[ ! -f ~/.gitconfig ]] && ln -s "$PWD/.gitconfig" ~/.gitconfig

# Create neovim symlink
[[ ! -d ~/.config/nvim ]] && ln -s "$PWD/nvim" ~/.config/nvim

# Create alacritty symlink
[[ ! -d ~/.config/alacritty ]] && ln -s "$PWD/alacritty" ~/.config/alacritty

# Create ghostty symlink
[[ ! -d ~/.config/ghostty ]] && ln -s "$PWD/ghostty" ~/.config/

# Create bash symlinks
[[ ! -f ~/.bashrc ]] && ln -s "$PWD/.bashrc" ~/
[[ ! -f ~/.bash_profile ]] && ln -s "$PWD/.bash_profile" ~/

# Create hyprland and echosystem symlinks
[[ ! -d ~/.config/hypr ]] && ln -s "$PWD/hypr" ~/.config

# Link system config
if [ -f "$PWD/hypr/$HOSTNAME.conf" ]; then
  ln -sf "$PWD/hypr/$HOSTNAME.conf" "$PWD/hypr/system.conf"
fi

# Music notifications
mkdir -p ~/.local/share/thumbnails

# Scripts
[[ ! -d ~/.scripts ]] && ln -s "$PWD/scripts" ~/.scripts
mkdir -p ~/.local/share/applications/
[[ ! -f ~/.local/share/applications/feh.desktop ]] && ln -s "$PWD/scripts/feh.desktop" ~/.local/share/applications/

# Create helix symlink
[[ ! -d ~/.config/helix ]] && ln -s "$PWD/helix" ~/.config

true
