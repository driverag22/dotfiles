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

if [ -z "$SPOTIFY" ] 
then
    # printf "  %s   %s    %s  %s %s    %s " "$MEM" "$CPU" "$VOL" "$WIFI" "$BATTERY" "$LOCALTIME" 
    printf "  %s   %s    %s    %s  %s    %s " "$MEM" "$CPU" "$WIFI" "$VOL" "$BATTERY" "$LOCALTIME" 
else  
    printf "  %s   %s  %s %s  %s %s  %s " "$MEM" "$CPU" "$SPOTIFY" "$VOL" "$WIFI" "$BATTERY" "$LOCALTIME" 
fi
