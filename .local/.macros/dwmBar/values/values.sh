#!/usr/bin/env bash
# original script created by clusterF
# modified by ManyRoads
# remodified by driverag22

LOCALTIME=$(cat /tmp/time.txt)
DB=$(cat /tmp/dropbox.txt)
VOL=$(cat /tmp/vol.txt)
MEM=$(cat /tmp/mem.txt)
CPU=$(cat /tmp/usageCPU.txt)
WIFI=$(cat /tmp/wifi.txt)
BATTERY=$(cat /tmp/battery.txt)
SPOTIFY=$(cat /tmp/spotify.txt)
TEMP=$(cat /tmp/temp.txt)
DISK=$(df -Ph | grep "/dev/mapper/cryptroot" | awk {'print $3 " / " $2'})


if [ -z "$SPOTIFY" ] 
then
    printf "[ %s ]   [  %s    %s ]   [  %s    %s   %s ]   [ %s ]   [ %s ]   [ %s ]" "$VOL" "$DISK" "$DB" "$MEM" "$CPU" "$TEMP" "$WIFI" "$BATTERY" "$LOCALTIME"
else 
    printf "[ %s %s ]   [  %s    %s ]   [  %s    %s   %s ]   [ %s ]   [ %s ]   [ %s ] " "$SPOTIFY" "$VOL" "$DISK" "$DB" "$MEM" "$CPU" "$TEMP" "$WIFI" "$BATTERY" "$LOCALTIME"
fi
