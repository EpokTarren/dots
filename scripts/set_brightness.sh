#!/bin/sh

brightness=$(brightnessctl -s set $1 | grep Current | sed 's/.*(\(.*\))/\1/')
progress=$(echo $brightness | sed 's/100%/1/' | sed 's/\(..\)%/0.\1/' | sed 's/\(.\)%/0.0\1/')
qs ipc call notifications specialNotification "{\"appName\":\"Brightness $brightness\",\"progress\":$progress}"
