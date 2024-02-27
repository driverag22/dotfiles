#!/bin/sh
while true; do
    mem=$(free -h --kilo | awk '/^Mem:/ {gsub(/[A-Za-z]/, "", $3); print $3 "/" $2}')
    echo "$mem" > '/tmp/mem.txt'
    sleep 5s
done &
