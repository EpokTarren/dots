#!/bin/sh
source ~/.scripts/bemenu/opts.sh
command=$(echo -e "Lock\nLogout\nSleep\nRestart\nShutdown" | bemenu -P '     >' -p power)

case $command in
    "Lock")     hyprlock -q ;;
    "Logout")   hyprctl dispatch exit ;;
    "Sleep")    hyprlock -q & systemctl suspend ;;
    "Restart")  reboot ;;
    "Shutdown") shutdown now ;;
esac
