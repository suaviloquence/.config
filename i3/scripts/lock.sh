#!/bin/sh
#vim: ft=sh
dunstctl set-paused true



TEXT=#00000000

RING=#2e3440

SEPARATOR=#4c566a

ACCENT=#81a1c1

BAD=#bf616a

NEUTRAL=#ebcb8b

i3lock -i ~/wallpapers/wallpaper.png -t \
    --inside-color='#00000000' --insidever-color='#00000000' --insidewrong-color='#00000000' --line-color='#00000000' \
    --ring-color="$RING" \
    --ringver-color="$NEUTRAL" \
    --ringwrong-color="$BAD" \
    --separator-color="$SEPARATOR" \
    --keyhl-color="$ACCENT" --bshl-color="$ACCENT" \
    --verif-color="$TEXT" --wrong-color="$TEXT" -n

dunstctl set-paused false

