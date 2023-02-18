#!/usr/bin/env bash
# original script created by clusterF
# modified by ManyRoads
# remodified by driverag22


LOCALTIME=$(cat /tmp/time.txt)
VOL=$(cat /tmp/vol.txt)
WIFI=$(cat /tmp/wifi.txt)
BATTERY=$(cat /tmp/battery.txt)

printf " %s                                                                                                                                                                           %s      %s     %s   " "$LOCALTIME" "$WIFI" "$VOL" "$BATTERY"
