#!/bin/sh
TMP="$HOME/.local/.macros/dwmBar/tmp"
while true; do
    mem=$(free -h --kilo | awk '/^Mem:/ {gsub(/[A-Za-z]/, "", $3) gsub(/[A-Za-z]/, "", $2); print $3 "/" $2}')
    echo "$mem" > "$TMP/mem.txt"
    sleep 5s
done &
