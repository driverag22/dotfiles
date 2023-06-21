#!/usr/bin/env bash
# original script created by clusterF
# modified by ManyRoads
# remodified by driverag22

LOCALTIME=$(cat /tmp/time.txt)
VOL=$(cat /tmp/vol.txt)
MEM=$(cat /tmp/mem.txt)
CPU=$(cat /tmp/usageCPU.txt)
WIFI=$(cat /tmp/wifi.txt)
BATTERY=$(cat /tmp/battery.txt)
SPOTIFY=$(cat /tmp/spotify.txt)
TEMP=$(cat /tmp/temp.txt)


if [ -z "$SPOTIFY" ] 
then
    printf " %s   %s   %s    %s    %s %s    %s " "$MEM" "$CPU" "$TEMP" "$WIFI" "$VOL" "$BATTERY" "$LOCALTIME"
else 
    printf " %s   %s   %s    %s    %s %s  %s    %s " "$MEM" "$CPU" "$TEMP" "$WIFI" "$SPOTIFY" "$VOL" "$BATTERY" "$LOCALTIME"
fi
