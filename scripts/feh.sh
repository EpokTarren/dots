#!/bin/sh

dimensions=$(identify -format "w=%[width]
h=%[height]" "$1")

geometry=$(echo "$dimensions
max_w=1600
max_h=900
a=1
b=1

if (w > max_w) {
    a = max_w
    b = w
}

if (h*a/b > max_h) {
    a = max_h
    b = h
}

dw = w*a/b*b - w*a
dh = h*a/b*b - h*a
print((w*a)/b)
print \"x\"
print((h*a)/b)
" | bc)

feh --auto-zoom --scale-down -g "$geometry" $*
