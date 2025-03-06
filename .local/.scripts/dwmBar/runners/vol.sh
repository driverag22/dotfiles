#!/bin/sh
TMP="$HOME/.local/.scripts/dwmBar/tmp"
while true; do
    VOL=$(awk -F"[][]" '/Left:/ { print $2 }' <(amixer sget Master))
    STATE=$(awk -F"[][]" '/Left:/ { print $4 }' <(amixer sget Master))
    
    if [ "$STATE" = "off" ] 
    then
        icon=""
        printf "%s%s" "$icon " "$VOL" > "$TMP/vol.txt";
    else
        icon=""
        printf "%s%s" "$icon " "$VOL" > "$TMP/vol.txt";
    fi
    sleep 0.5s
done &
