#!/usr/bin/env bash

if [[ "$1" != "" ]] then
    file=$(rg --type-add 'desktop:*.desktop' -tdesktop --follow -l "Exec=$*" $(echo "$XDG_DATA_DIRS" | tr ':' ' ') 2> /dev/null | head -n 1)

    if [[ "$file" != "" ]] then
        fname="$(basename "$file" | sed 's/.desktop$//')"
        desktop=$(<$file)
        name="$(echo "$desktop" | rg -N "Name=" | head -n 1 | sed 's/Name=//')"
        generic="$(echo "$desktop" | rg -N "GenericName=" | head -n 1 | sed 's/GenericName=/ - /')"
        description="$name$generic"
    fi
fi
