source ~/.config/bemenu/opts.sh
shift
j4-dmenu-desktop --dmenu="bemenu -i $*" --term='termite'
