#!/bin/sh
source ~/.scripts/bemenu/opts.sh
command=$(echo -e "Idle\nLock\nLogout\nSleep\nRestart\nShutdown" | bemenu -P '     >' -p power)

# Kill browser using shortcut to allow consistent tab restore
kill_browser() { hyprctl dispatch 'hl.dsp.send_shortcut({ mods = "CTRL", key = "Q", window = "class:^librewolf$" })'; }

case "$command" in
    "Idle")     sleep 2 && hyprctl dispatch 'hl.dsp.dpms({ action = "disable" })' ;;
    "Lock")     sleep 2 && hyprctl dispatch 'hl.dsp.dpms({ action = "disable" })' && hyprlock -q ;;
    "Logout")   kill_browser && hyprshutdown -t "Logging out..." --no-exit && uwsm stop ;;
    "Sleep")    hyprlock -q & systemctl suspend ;;
    "Restart")  kill_browser && hyprshutdown -t "Rebooting..." --post-cmd "reboot" ;;
    "Shutdown") kill_browser && hyprshutdown -t "Shutting down..." --post-cmd "shutdown now" ;;
esac
