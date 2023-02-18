#!/bin/sh
while true; do
    LOCALTIME=$(date '+ %a. %d %b.   %R')
    echo "$LOCALTIME" > '/tmp/time.txt'
    sleep 45s 
done &
