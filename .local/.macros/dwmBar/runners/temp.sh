#!/bin/sh
while true; do
    TEMP=$(sensors|grep 'Core 0'|awk '{print $3}' )
    echo "$TEMP" > '/tmp/temp.txt'
    sleep 10s 
done &
