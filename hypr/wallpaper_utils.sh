#!/bin/sh

symlink_as_png() {
    if [[ "${1: -4}" == ".png" ]] then
        ln -sf "$(realpath "$1")" "$2"
    else
        if ! test -f "$1.png"; then
            magick convert "$1" "$1.png"
        fi

        ln -sf "$(realpath "$1.png")" "$2"
    fi
}

set_lock() {
    symlink_as_png "$1" ~/Wallpapers/lock.png
}

set_wp() {
    symlink_as_png "$1" ~/Wallpapers/home.png
    wp "$1"
}

wp () {
    hyprctl hyprpaper preload "$(realpath "$1")"
    hyprctl hyprpaper wallpaper ",$(realpath "$1")"
}
