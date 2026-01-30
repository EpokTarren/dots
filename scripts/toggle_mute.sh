#!/bin/sh

wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
qs ipc call notifications mediaNotification false
