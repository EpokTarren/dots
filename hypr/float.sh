#!/usr/bin/env bash

if [[ "$1" != "" ]] then
    source ~/.config/hypr/desktopname.sh $*
    if [[ "$fname" == "" ]] then
        hyprctl dispatch "hl.dsp.exec_cmd(\"uwsm-app -- $*\", {float=true})"
    else
        if [[ "$description" == "" ]] then
            hyprctl dispatch "hl.dsp.exec_cmd(\"uwsm-app -a '$fname' -d '$name' -- $*\", {float=true})"
        else
            hyprctl dispatch "hl.dsp.exec_cmd(\"uwsm-app -a '$fname' -d '$description' -- $*\", {float=true})"
        fi
    fi
fi
