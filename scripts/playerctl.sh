#!/bin/sh

if command -v qs; then
    player_name="$(qs ipc call media playerName)"
fi

for p in $(playerctl -l)
do
    if [[ $(playerctl status "--player=$p") == "Playing" ]]; then
        player="--player=$p"
        break
    fi
done

if [[ "$player_name" == "" ]]; then
    playerctl $* "$player"
else
    playerctl $* --player "${player_name//org.mpris.MediaPlayer2./}"
fi

[[ command -v qs ]] && qs ipc call notifications mediaNotification true
