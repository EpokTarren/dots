#!/usr/bin/env bash

if [[ "$1" != "" ]] then
    if command -v rg > /dev/null; then
        file=$(rg --type-add 'desktop:*.desktop' -tdesktop --follow -l "Exec=$*" $(echo "$XDG_DATA_DIRS" | tr ':' ' ') 2> /dev/null | head -n 1)
    else
        file=$(grep -l "Exec=steam" $(find $(echo "$XDG_DATA_DIRS" | sed 's/:/ /g') -name '*.desktop' 2> /dev/null) | head -n 1)
    fi

    if [[ "$file" != "" ]] then
        fname="$(basename "$file" | sed 's/.desktop$//')"
        desktop=$(<$file)
        name="$(echo "$desktop" | grep "Name=" | head -n 1 | sed 's/Name=//')"
        generic="$(echo "$desktop" | grep "GenericName=" | head -n 1 | sed 's/GenericName=/ - /')"
        description="$name$generic"
    fi
fi
