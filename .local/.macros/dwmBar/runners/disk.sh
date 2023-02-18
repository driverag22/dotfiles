#!/bin/sh
while true; do
    DISK=$(df -Ph | grep "/dev/mapper/cryptroot" | awk {'print $3 " / " $2'})
    echo "$DISK" > '/tmp/disk.txt'
    sleep 600s 
done &
