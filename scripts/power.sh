#!/bin/sh
source ~/.scripts/bemenu/opts.sh
command=$(echo -e "Lock\nLogout\nSleep\nRestart\nShutdown" | bemenu -P '     >' -p power)

# Kill browser using shortcut to allow consistent tab restore
kill_browser() { hyprctl dispatch sendshortcut "ctrl,q,class:librewolf"; }

case $command in
    "Lock")     sleep 1 && hyprctl dispatch dpms off && hyprlock -q ;;
    "Logout")   hyprshutdown -t "Logging out..." ;;
    "Sleep")    hyprlock -q & systemctl suspend ;;
    "Restart")  kill_browser && hyprshutdown --dry-run -t 'Restarting...' && reboot ;;
    "Shutdown") kill_browser && hyprshutdown --dry-run -t 'Shutting down...' && shutdown now ;;
esac
