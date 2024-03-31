#!/bin/sh
TMP="$HOME/.local/.macros/dwmBar/tmp"
while true; do
    LOCALTIME=$(date '+ %a. %d %b.   %R')
    echo "$LOCALTIME" > "$TMP/time.txt"
    sleep 45s 
done &
