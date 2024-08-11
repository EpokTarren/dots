#!/bin/sh

source "$( dirname $0 )/wallpaper_utils.sh"

case "$1" in
    tmp)  wp       "$2" "$3" ;;
    set)  set_wp   "$2" "$3" ;;
    lock) set_lock "$2" "$3" ;;
esac
