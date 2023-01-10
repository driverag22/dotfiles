#!/usr/bin/env bash
# original script created by clusterF
# modified by ManyRoads
# remodified by driverag22


LOCALTIME=$(date '+  %a. %d %b.    %R')
VOL=$(/home/diego/.local/.macros/dwmBar/vol.sh)
# WIFI=$(/home/diego/.local/.macros/dwmBar/wifi.sh)
WIFI=$(/home/diego/.local/.macros/dwmBar/simpleWifi.sh)
SPOTIFY=$(/home/diego/.local/.macros/dwmBar/spotify.sh)
BATTERY=$(/home/diego/.local/.macros/dwmBar/battery.sh)
MEM=$(free -h --kilo | awk '/^Mem:/ {print $3 " / " $2}')
CPU=$(/home/diego/.local/.macros/dwmBar/usageCPU.sh)

# printf "[  $DISK ]   [   $DB ]   [  $MEM ]   [   $CPU% ]   [  $TEMP ]   [ $BATTERY ]   [ $WIFI ]   [ $LOCALTIME ]"
# printf "[  %s ]   [   %s ]   [  %s ]   [   %s ]   [  %s ]   [ %s ]   [ %s ]   [ %s ]" "$DISK" "$DB" "$MEM" "$CPU" "$TEMP" "$BATTERY" "$WIFI" "$LOCALTIME"

if [ -z "$SPOTIFY" ] 
then
    # printf "[ %s ]   [  %s    %s ]   [ %s ]   [ %s ]   [ %s ]" "$VOL" "$MEM" "$CPU" "$WIFI" "$BATTERY" "$LOCALTIME"
    printf "[ %s ]   [ %s ]   [ %s ]   [ %s ]"  "$VOL" "$WIFI" "$BATTERY" "$LOCALTIME"
else 
    printf "[ %s  %s ]   [ %s ]   [ %s ]   [ %s ]" "$SPOTIFY" "$VOL" "$WIFI" "$BATTERY" "$LOCALTIME"
    # printf "[ %s  %s ]   [  %s    %s ]   [ %s ]   [ %s ]   [ %s ]" "$SPOTIFY" "$VOL" "$MEM" "$CPU" "$WIFI" "$BATTERY" "$LOCALTIME"
fi
