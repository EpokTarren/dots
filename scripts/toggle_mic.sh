#!/bin/sh

wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle
if [[ "$(wpctl get-volume @DEFAULT_AUDIO_SOURCE@)" == *"[MUTED]" ]]; then
    dunstify "Mic muted" -r 130003 -u low -t 5000
else
    dunstify "Mic unmuted" -r 130003 -u low -t 5000
fi
