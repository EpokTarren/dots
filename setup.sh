#!/bin/sh

export version=$(./version.sh)
export dir=$(pwd)

# Ensure latest themes are available
if [ ! -d "./themes/$version/alacritty" ]; then
  mkdir -p "./themes/$version"
  cd "./themes/$version"

  curl -L https://github.com/EpokTarren/themes/releases/download/v$version/tarrens-themes-v$version-alacritty.zip -o alacritty.zip
  tar -xf alacritty.zip
  rm alacritty.zip

  cd $dir
fi

echo Available themes
PS3="Select a theme: "

select theme in Rider "Good Job" Slime "\"Girl\"" Bloody "Arch Wizard" Imouto? Gyaru
do
    ./set_theme.sh "$theme"
    echo "Set theme: $theme"
    exit
done
