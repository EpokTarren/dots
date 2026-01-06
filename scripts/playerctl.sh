#!/bin/sh

for p in $(playerctl -l)
do
    if [[ $(playerctl status "--player=$p") == "Playing" ]]; then
        player="--player=$p"
        break
    fi
done

playerctl $* "$player"

qs ipc call notifications mediaNotification true
