#!/bin/sh

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


  if [ ! -d "./themes/$version/gtk-css" ]; then
    cd "./themes/$version"

    curl -L https://github.com/EpokTarren/themes/releases/download/v$version/tarrens-themes-v$version-gtk-css.tar.gz -o gtk-css.tar.gz
    tar -xf gtk-css.tar.gz
    rm gtk-css.tar.gz

    cd $dir
  fi
fi

echo Available themes
PS3="Select a theme: "

select theme in Rider "Good Job" Slime "\"Girl\"" Bloody "Arch Wizard" Imouto? Gyaru Commander
do
    ./set_theme.sh "$theme"
    echo "Set theme: $theme"
    exit
done
