#!/usr/bin/env bash
# original script created by clusterF
# modified by ManyRoads
# remodified by driverag22


LOCALTIME=$(cat /tmp/time.txt)
VOL=$(cat /tmp/vol.txt)
WIFI=$(cat /tmp/wifi.txt)
BATTERY=$(cat /tmp/battery.txt)
SPOTIFY=$(cat /tmp/spotify.txt)

if [ -z "$SPOTIFY" ] 
then
    # printf "[ %s ]   [  %s    %s ]   [ %s ]   [ %s ]   [ %s ]" "$VOL" "$MEM" "$CPU" "$WIFI" "$BATTERY" "$LOCALTIME"
    printf "[ %s ]   [ %s ]   [ %s ]   [ %s ]"  "$VOL" "$WIFI" "$BATTERY" "$LOCALTIME"
else 
    printf "[ %s  %s ]   [ %s ]   [ %s ]   [ %s ]" "$SPOTIFY" "$VOL" "$WIFI" "$BATTERY" "$LOCALTIME"
    # printf "[ %s  %s ]   [  %s    %s ]   [ %s ]   [ %s ]   [ %s ]" "$SPOTIFY" "$VOL" "$MEM" "$CPU" "$WIFI" "$BATTERY" "$LOCALTIME"
fi
