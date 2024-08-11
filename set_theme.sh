#!/bin/sh

# Remove special charcters from the name
export normalized=$(echo "$1" | tr [:upper:] [:lower:] | tr -d '[:punct:]' | tr ' ' '_')
export normalized_=$(echo $normalized | tr '_' '-')
export version=$(./version.sh)

dots=$( cd -- "$( dirname -- "$0" )" &> /dev/null && pwd )
if test -f "/proc/sys/fs/binfmt_misc/WSLInterop"; then
  local=$(echo -ne "$dots" | sed 's/\/mnt\/\(.\)/\1:/')
else
  local=$(echo -ne "$dots")
fi

### Neovim ###
echo "let g:theme_style = '$1'" > $dots/nvim/theme.vim

### Alacritty ###
echo "import = [\"$local/themes/$version/alacritty/$normalized_.toml\"]" > $dots/alacritty/theme.yml

# Ignore linux only programs if running in WSL.
if test -f "/proc/sys/fs/binfmt_misc/WSLInterop"; then
  exit 0
fi

### Hypr ###
ln -sf $local/themes/$version/hypr/terminal.conf $local/hypr/terminal.conf
ln -sf $local/themes/$version/hypr/$normalized_.conf $local/hypr/theme.conf
pgrep Hyprland &> /dev/null && hyprctl reload &> /dev/null

### Waybar ###
ln -sf $local/themes/$version/gtk-css/terminal.css $local/waybar/terminal.css
ln -sf $local/themes/$version/gtk-css/$normalized_.css $local/waybar/theme.css
pgrep waybar &> /dev/null && pkill waybar &> /dev/null && waybar &> /dev/null &
