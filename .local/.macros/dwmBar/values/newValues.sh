#!/usr/bin/env bash
# original script created by clusterF
# modified by ManyRoads
# remodified by driverag22
TMP=($HOME/.local/.macros/dwmBar/tmp)

LOCALTIME=$(cat $TMP/time.txt)
VOL=$(cat $TMP/vol.txt)
MEM=$(cat $TMP/mem.txt)
CPU=$(cat $TMP/usageCPU.txt)
WIFI=$(cat $TMP/wifi.txt)
BATTERY=$(cat $TMP/battery.txt)
SPOTIFY=$(cat $TMP/spotify.txt)
TEMP=$(cat $TMP/temp.txt)


if [ -z "$SPOTIFY" ] 
then
    printf " %s   %s   %s    %s   %s %s    %s " "$MEM" "$CPU" "$TEMP" "$WIFI" "$VOL" "$BATTERY" "$LOCALTIME"
else 
    printf " %s   %s   %s    %s   %s  %s  %s    %s " "$MEM" "$CPU" "$TEMP" "$WIFI" "$SPOTIFY" "$VOL" "$BATTERY" "$LOCALTIME"
fi
