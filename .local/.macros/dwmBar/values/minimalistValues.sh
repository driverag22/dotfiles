#!/usr/bin/env bash
# original script created by clusterF
# modified by ManyRoads
# remodified by driverag22


LOCALTIME=$(date '+  %a. %d %b.    %R')
VOL=$(/home/diego/.local/.macros/dwmBar/vol.sh)
WIFI=$(/home/diego/.local/.macros/dwmBar/simpleWifi.sh)
BATTERY=$(/home/diego/.local/.macros/dwmBar/battery.sh)

# printf "[  $DISK ]   [   $DB ]   [  $MEM ]   [   $CPU% ]   [  $TEMP ]   [ $BATTERY ]   [ $WIFI ]   [ $LOCALTIME ]"
# printf "[  %s ]   [   %s ]   [  %s ]   [   %s ]   [  %s ]   [ %s ]   [ %s ]   [ %s ]" "$DISK" "$DB" "$MEM" "$CPU" "$TEMP" "$BATTERY" "$WIFI" "$LOCALTIME"

printf " %s                                                                                                                                                                           %s      %s     %s   " "$LOCALTIME" "$WIFI" "$VOL" "$BATTERY"
