#!/bin/sh
command=$(echo -e "Lock\nLogout\nSleep\nRestart\nShutdown" | ~/.config/bemenu/bemenu.sh)

case $command in
    "Lock")     hyprlock ;;
    "Logout")   hyprctl dispatch exit ;;
    "Sleep")    hyprlock -q & systemctl suspend ;;
    "Restart")  reboot ;;
    "Shutdown") shutdown now ;;
esac
