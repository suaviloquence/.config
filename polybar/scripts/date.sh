#!/usr/bin/env sh
t=0
sleep_pid=0

FORMAT="%-l:%M"
FORMAT_ALT="%A, %-e %B"
PREFIX=

if [ "$1" = "c" ]; then
    PREFIX="%{F#81a1c1}%{B#5e81ac}%{F-}%{B#81a1c1} "
    FORMAT_ALT=" ${FORMAT_ALT} "
else
    FORMAT_ALT="${FORMAT_ALT}, "
fi


toggle() {
    t=$(((t + 1) % 2))

    if [ "$sleep_pid" -ne 0 ]; then
        kill $sleep_pid >/dev/null 2>&1
    fi
}


trap "toggle" USR1

while true; do
    if [ $t -eq 1 ]; then
        printf "%s" "$(date +"$FORMAT_ALT")"
    fi
    printf "%s%s\n" "$PREFIX" "$(date +"${FORMAT}")"
    sleep 1 &
    sleep_pid=$!
    wait
done
