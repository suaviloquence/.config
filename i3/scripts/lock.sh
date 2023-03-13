#!/bin/sh
#vim: ft=sh
# housekeeping
mpc status | tail -n 2 | grep 'playing' > /dev/null
PLAYING=$?


if [ $PLAYING -eq 0 ]; then
    mpc pause
fi

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
if [ "$PLAYING" -eq 0 ]; then
    sleep 2  # wait to put headphones on lol
    mpc play
fi

dunstctl set-paused false

