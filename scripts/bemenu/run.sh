source ~/.scripts/bemenu/opts.sh
shift
j4-dmenu-desktop --dmenu="bemenu -i -p run $*" --term='termite'
