#!/bin/sh
while true; do
    LOCALTIME=$(date '+ %a. %d %b.   %R')
    echo "$LOCALTIME" > /home/diego/.local/.macros/dwmBar/readings/time.txt
    sleep 45s 
done &
