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
    grim -g "$1" - | tee "$2" | wl-copy -t image/png && echo "$2"

    test ~/Screenshots/screenshot.wav && mpv ~/Screenshots/screenshot.wav &> /dev/null
    case "$(dunstify -I "$2" -A "open,Open" -A "delete,Delete" "Screenshot" "$(basename $2)" -u low)" in
        "open")   xdg-open "$2" ;;
        "delete") rm       "$2" ;;
    esac
}

current_screen_geometry() {
    hyprctl monitors "$(hyprctl activeworkspace -j | jq .monitorID)" -j | \
    jq -r '"\(.[0].x),\(.[0].y) \(.[0].width)x\(.[0].height)"'
}

fullscreen() {
    screenshot "$(current_screen_geometry)" "$(filename)"
}

capture_region() {
    screenshot "$(slurp -d)" "$(filename)"
}

active_window_geometry() {
    hyprctl activewindow -j | jq -r '"\(.at[0]),\(.at[1]) \(.size[0])x\(.size[1])"'
}

active_window_name() {
    hyprctl activewindow -j | jq -r .class
}

capture_active_window() {
    screenshot "$(active_window_geometry)" "$(filename "$(active_window_name)_")"
}

case $1 in
    "screen") fullscreen ;;
    "region") capture_region ;;
    "window") capture_active_window ;;
esac
