#!/usr/bin/env bash
mkdir -p ~/.config

# Create .giconfig symlink
[[ ! -f ~/.gitconfig ]] && ln -s "$PWD/.gitconfig" ~/.gitconfig

# Create neovim symlink
command -v nvim > /dev/null && [[ ! -d ~/.config/nvim ]] && ln -s "$PWD/nvim" ~/.config/nvim

# Create alacritty symlink
command -v alacritty > /dev/null && [[ ! -d ~/.config/alacritty ]] && ln -s "$PWD/alacritty" ~/.config/alacritty

# Create ghostty symlink
command -v ghostty > /dev/null && [[ ! -d ~/.config/ghostty ]] && ln -s "$PWD/ghostty" ~/.config/

# Create bash symlinks
[[ ! -f ~/.bashrc ]] && ln -s "$PWD/.bashrc" ~/
[[ ! -f ~/.bash_profile ]] && ln -s "$PWD/.bash_profile" ~/

# Create hyprland and echosystem symlinks
command -v Hyprland > /dev/null && [[ ! -d ~/.config/hypr ]] && ln -s "$PWD/hypr" ~/.config

# Create uwsm symlink
[[ ! -d ~/.config/uwsm ]] && ln -s "$PWD/uwsm" ~/.config/uwsm

# Music notifications
mkdir -p ~/.local/share/thumbnails

# Scripts
[[ ! -d ~/.scripts ]] && ln -s "$PWD/scripts" ~/.scripts

# Create helix symlink
command -v hx > /dev/null && [[ ! -d ~/.config/helix ]] && ln -s "$PWD/helix" ~/.config

true
