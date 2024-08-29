#!/bin/sh

wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ $1

export use_volume="yes"
~/.scripts/playerctl.sh metadata -f ""
if [[ $? == 0 ]]; then
    exit 0;
fi

volume=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | sed 's/Volume: //' | sed s/\\.// | sed s/^0//)

if [[ "$volume" == *"[MUTED]" ]]; then
    dunstify "Volume (muted)" -r 86 "$(echo $volume | sed 's/ .*//')%" --hints=int:value:"$volume%" -u low -t 2000
else
    dunstify Volume -r 86 "$volume%" --hints=int:value:"$volume%" -u low -t 2000
fi
