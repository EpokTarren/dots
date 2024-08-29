#!/bin/sh

brightness=$( brightnessctl -s set $1 | grep Current | sed 's/.*(\(.*\))/\1/' )
dunstify Brightness -r 162804 "$brightness" --hints=int:value:"$brightness" -u low -t 5000
