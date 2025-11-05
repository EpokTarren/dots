#!/bin/sh

filename() {
    folder="$HOME/Screenshots/$(date +"%Y-%m")"
    mkdir -p "$folder"

    file="$folder/$1$(tr -dc a-z0-9 < /dev/urandom | head -c 6).png"
    if [ -f "$file" ]; then
        filename $1
    else
        echo -n "$file"
    fi
}

screenshot() {
    [ "$2" != "" ] && exit 0
    grim -l 9 "$1" "$2" - | tee "$3" | wl-copy -t image/png && echo "$3"
    notification "$3" &
}

notification() {
    test ~/Screenshots/screenshot.wav && mpv ~/Screenshots/screenshot.wav &> /dev/null
    case "$(dunstify -I "$1" -A "open,Open" -A "delete,Delete" "Screenshot" "$(basename $1)" -u low)" in
        "open")   xdg-open "$1" ;;
        "delete") rm       "$1" ;;
    esac
}

current_screen_geometry() {
    hyprctl monitors "$(hyprctl activeworkspace -j | jq .monitorID)" -j | \
    jq -r '"\(.[0].x),\(.[0].y) \(.[0].width)x\(.[0].height)"'
}

fullscreen() {
    screenshot -g "$(current_screen_geometry)" "$(filename)"
}

capture_region() {
    screenshot -g "$(slurp -d)" "$(filename)"
}

active_window_geometry() {
    hyprctl activewindow -j | jq -r '"\(.at[0]),\(.at[1]) \(.size[0])x\(.size[1])"'
}

active_window() {
    hyprctl activewindow -j | jq -r '.address'
}

active_window_name() {
    hyprctl activewindow -j | jq -r .class
}

capture_active_window() {
    screenshot -w "$(active_window)" "$(filename "$(active_window_name)_")"
}

capture_active_window_region() {
    window="$(active_window)"
    hyprctl dispatch setprop "address:$window" norounding on
    screenshot -g "$(active_window_geometry)" "$(filename "$(active_window_name)_")"
    hyprctl dispatch setprop "address:$window" norounding off
}

case $1 in
    "screen") fullscreen ;;
    "region") capture_region ;;
    "window") capture_active_window ;;
    "window_region") capture_active_window_region ;;
esac
