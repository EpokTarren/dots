#!/bin/sh

dimensions=$(identify -format "w=%[width]
h=%[height]
orientation='%[orientation]'" "$1")

screen=$(hyprctl monitors "$(hyprctl activeworkspace -j | jq .monitorID)" -j | jq -r '"maxW=\(.[0].width); maxH=\(.[0].height)"')

geometry=$(node -e "$dimensions
$screen
if (['LeftTop', 'RightTop', 'RightBottom', 'LeftBottom'].includes(orientation)) {
    const tmp = w;
    w = h;
    h = tmp;
}

targetW = maxW / 1.2
targetH = maxH / 1.2
maxW -= 48
maxH -= 96
targetArea = targetW * targetH;

bestDistance = Infinity;

function check(tempW, tempH) {
    if (tempW > maxW || tempH > maxH) return;

    tempArea = tempW * tempH;
    distance = Math.abs(targetArea - tempArea);

    if (distance < bestDistance) {
        bestDistance = distance;
        bestW = tempW;
        bestH = tempH;
    }
}

for (i = 1; i < 30; ++i) check(Math.round(w / i), Math.round(h / i));
for (i = 2; i < 30; ++i) check(Math.round(w * i), Math.round(h * i));

console.log(bestW + 'x' + bestH);
")

hyprctl dispatch exec "[float; dimaround; center; rounding 0; noborder]" -- feh --auto-zoom --scale-down -g "$geometry" $* > /dev/null
