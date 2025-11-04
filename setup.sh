#!/usr/bin/env bash

export version=$(./version.sh)
export dir=$(pwd)

# Ensure latest themes are available
if [ ! -d "./themes/$version/alacritty" ]; then
  mkdir -p "./themes/$version"
  cd "./themes/$version"

  curl -L https://github.com/EpokTarren/themes/releases/download/v$version/tarrens-themes-v$version-alacritty.tar.gz -o alacritty.tar.gz
  tar -xf alacritty.tar.gz
  rm alacritty.tar.gz

  cd $dir
fi


# Ignore linux only programs if running in WSL.
if ! test -f "/proc/sys/fs/binfmt_misc/WSLInterop"; then
  if [ ! -d "./themes/$version/hypr" ]; then
    cd "./themes/$version"

    curl -L https://github.com/EpokTarren/themes/releases/download/v$version/tarrens-themes-v$version-hypr.tar.gz -o hypr.tar.gz
    tar -xf hypr.tar.gz
    rm hypr.tar.gz

    cd $dir
  fi

  if [ ! -d "./themes/$version/ghostty" ]; then
    cd "./themes/$version"

    curl -L https://github.com/EpokTarren/themes/releases/download/v$version/tarrens-themes-v$version-ghostty.tar.gz -o ghostty.tar.gz
    tar -xf ghostty.tar.gz
    rm ghostty.tar.gz

    cd $dir
  fi

  if [ ! -d "./themes/$version/helix" ]; then
    cd "./themes/$version"

    curl -L https://github.com/EpokTarren/themes/releases/download/v$version/tarrens-themes-v$version-helix.tar.gz -o helix.tar.gz
    tar -xf helix.tar.gz
    rm helix.tar.gz

    cd $dir
  fi

  if [ ! -d ~/.config/quickshell ]; then
    git clone git@github.com:EpokTarren/shell.git ~/.config/quickshell
    ln -s ~/.config/quickshell $dir
    ~/.config/quickshell/init.sh
  fi
fi

echo Available themes
PS3="Select a theme: "

select theme in Rider "Good Job" Slime "\"Girl\"" Bloody "Arch Wizard" Imouto? Gyaru Commander Encore
do
    ./set_theme.sh "$theme"
    echo "Set theme: $theme"
    exit
done
