#!/bin/sh

wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ $1

volume=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | sed 's/Volume: //' | sed s/\\.// | sed s/^0//)

if [[ "$volume" == *"[MUTED]" ]]; then
    dunstify "Volume (muted)" -r 86 "<s>$(echo $volume | sed 's/ .*//')%</s>" --hints=int:value:"$volume%" -u low -t 5000
else
    dunstify Volume -r 86 "$volume%" --hints=int:value:"$volume%" -u low -t 5000
fi
