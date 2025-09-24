source ~/.scripts/bemenu/opts.sh
command="$(j4-dmenu-desktop --dmenu="bemenu -i -P '     >' -p float $*" --term='termite' --no-exec)"
hyprctl dispatch exec '[float]' "$command"
