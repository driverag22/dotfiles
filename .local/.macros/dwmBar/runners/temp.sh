#!/bin/sh
TMP="$HOME/.local/.macros/dwmBar/tmp"
while true; do
    TEMP=$(sensors|grep 'Core 0'|awk '{print $3}' )
    echo "$TEMP" > "$TMP/temp.txt"
    sleep 5s 
done &
