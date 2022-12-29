#!/usr/bin/env bash
# original script created by clusterF
# modified by ManyRoads
# remodified by driverag22


LOCALTIME=$(date '+  %a. %d %b.    %R')
DB=$(dropbox-cli status)
VOL=$(/home/diego/.local/.macros/dwmBar/vol.sh)
MEM=$(free -h --kilo | awk '/^Mem:/ {print $3 " / " $2}')
# CPU=$(/home/diego/.local/.macros/dwmBar/cpu.sh)
CPU=$(/home/diego/.local/.macros/dwmBar/usageCPU.sh)
WIFI=$(/home/diego/.local/.macros/dwmBar/wifi.sh)
SPOTIFY=$(/home/diego/.local/.macros/dwmBar/spotify.sh)
BATTERY=$(/home/diego/.local/.macros/dwmBar/battery.sh)

# printf "[  $DISK ]   [   $DB ]   [  $MEM ]   [   $CPU% ]   [  $TEMP ]   [ $BATTERY ]   [ $WIFI ]   [ $LOCALTIME ]"
# printf "[  %s ]   [   %s ]   [  %s ]   [   %s ]   [  %s ]   [ %s ]   [ %s ]   [ %s ]" "$DISK" "$DB" "$MEM" "$CPU" "$TEMP" "$BATTERY" "$WIFI" "$LOCALTIME"

if [ -z "$SPOTIFY" ] 
then
    printf "[   %s ]   [  %s    %s ]   [ %s ]   [ %s ]   [ %s ]   [ %s ]" "$DB" "$MEM" "$CPU" "$WIFI" "$VOL" "$BATTERY" "$LOCALTIME"
    # printf "[ %s ]   [   %s ]   [  %s    %s ]   [ %s ]   [ %s ]   [ %s ]" "$VOL" "$DB" "$MEM" "$CPU" "$WIFI" "$BATTERY" "$LOCALTIME"
else 
    printf "[   %s ]    [  %s    %s ]   [ %s ]   [ %s  %s ]   [ %s ]   [ %s ]" "$DB" "$MEM" "$CPU" "$WIFI" "$SPOTIFY" "$VOL" "$BATTERY" "$LOCALTIME" 
fi
