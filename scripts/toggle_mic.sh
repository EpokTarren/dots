#!/bin/sh

wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle
if [[ "$(wpctl get-volume @DEFAULT_AUDIO_SOURCE@)" == *"[MUTED]" ]]; then
    qs ipc call notifications specialNotification "{\"appName\":\"Mic muted\"}"
else
    qs ipc call notifications specialNotification "{\"appName\":\"Mic unmuted\"}"
fi
