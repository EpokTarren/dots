#!/usr/bin/env bash

if [[ "$1" != "" ]] then
    source ~/.config/hypr/desktopname.sh $*
    if [[ "$fname" == "" ]] then
        uwsm-app -- $*
    else
        if [[ "$description" == "" ]] then
            uwsm-app -a "$fname" -d "$name" -- $*
        else
            uwsm-app -a "$fname" -d "$description" -- $*
        fi
    fi
fi
