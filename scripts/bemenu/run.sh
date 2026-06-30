#!/usr/bin/env bash

source ~/.scripts/bemenu/opts.sh
j4-dmenu-desktop --dmenu="bemenu -i -p run --fork $*" --term='termite' --no-generic --display-binary-base --wrapper "uwsm-app --"
