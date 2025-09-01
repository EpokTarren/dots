#!/usr/bin/env bash
mkdir -p ~/.config

# Create .giconfig symlink
ln -s "$PWD/.gitconfig" ~/.gitconfig

# Create neovim symlink
ln -s "$PWD/nvim" ~/.config/nvim

# Create alacritty symlink
ln -s "$PWD/alacritty" ~/.config/alacritty

# Create ghostty symlink
ln -s "$PWD/ghostty" ~/.config/

# Create bash symlinks
ln -s "$PWD/.bashrc" ~/
ln -s "$PWD/.bash_profile" ~/

# Create hyprland and echosystem symlinks
ln -s "$PWD/hypr" ~/.config

# Link system config
if [ -f "$PWD/hypr/$HOSTNAME.conf" ]; then
  ln -sf "$PWD/hypr/$HOSTNAME.conf" "$PWD/hypr/system.conf"
fi

# Music notifications
mkdir -p ~/.local/share/thumbnails

# Scripts
ln -s "$PWD/scripts" ~/.scripts
mkdir -p ~/.local/share/applications/
ln -s "$PWD/scripts/feh.desktop" ~/.local/share/applications/

# Create waybar symlink
ln -s "$PWD/waybar" ~/.config

# Create dunst symlink
mkdir -p ~/.config/dunst
ln -s "$PWD/.theme.dunstrc" ~/.config/dunst/dunstrc

# Create helix symlink
ln -s "$PWD/helix" ~/.config
