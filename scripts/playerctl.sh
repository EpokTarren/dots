#!/bin/sh

for p in $(playerctl -l)
do
    if [[ $(playerctl status "--player=$p") == "Playing" ]]; then
        player="--player=$p"
        break
    fi
done

playerctl $* "$player"

if [[ $? != 0 ]]; then
    exit 1;
fi

notification() {

format="{{artist}}
<i>{{album}}</i>
<{{status}}> {{playerName}} {{duration(position)}} / {{duration(mpris:length)}}"
title=$(playerctl metadata "$player" -f "{{default(title, playerName)}}")

metadata=$(playerctl metadata "$player" -f "$format" | sed 's/<.><\/.>//' | sed 's/0:00 \/ //' | grep -v -e '^$' | sed 's/<Playing>//' | sed 's/<Paused>//')
icon=$(playerctl metadata "$player" -f "{{mpris:artUrl}}")

if [[ "$icon" != "" ]]; then
    if [[ "$icon" == "https://"* ]]; then
        if [[ "$(playerctl metadata "$player" -f {{playerName}})" == spotify ]]; then
            icon_name="spotify.$(echo "$icon" | sed "s/https:\/\/.*\///").jpg"
            icon_path="$HOME/.local/share/thumbnails/$icon_name"

            if [[ ! -f "$icon_path" ]]; then
                curl -o "$icon_path" "$icon"
            fi

            icon="--icon=$icon_path"
        else
            icon=""
        fi
    else
        icon="--icon=$icon"
    fi
fi

volume=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | sed 's/Volume: 0\?\(.*\)/\1%/' | sed s/\\.// | sed s/^0// | sed 's/ \[MUTED\]%/% (muted)/')

if [[ "$use_volume" == "yes" ]]; then
    body="$metadata
<b>  $volume</b>"
    dunstify "$title" -r 86 "$body" "$icon" --hints=int:value:"$volume%" -u low -t 2000
    return
fi


body="$metadata
  $volume"
div=$(playerctl metadata "$player" -f "{{position}}00/{{mpris:length}}")
if [[ "$div" != *"/" ]]; then
    declare -i progress="$div"
    dunstify "$title" -r 86 "$body" "$icon" --hints=int:value:"$progress%" -u low -t 2000
else
    dunstify "$title" -r 86 "$body" "$icon" --hints=int:value:"$volume%" -u low -t 2000
fi

}

notification

# Refreshes stale metadata, and keeps progress bar up to date.
sleep 0.6
notification
