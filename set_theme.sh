#!/bin/bash

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
echo "import = [\"$local/themes/$version/alacritty/$normalized_.toml\"]"
