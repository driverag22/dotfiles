#!/usr/bin/env bash
# original script created by clusterF
# modified by ManyRoads
# remodified by driverag22

LOCALTIME=$(date '+ %a. %d %b.   %R')
VOL=$(/home/diego/.local/.macros/dwmBar/vol.sh)
MEM=$(free -h --kilo | awk '/^Mem:/ {print $3 "/" $2}')
# CPU=$(/home/diego/.local/.macros/dwmBar/cpu.sh)
CPU=$(/home/diego/.local/.macros/dwmBar/usageCPU.sh)
# WIFI=$(/home/diego/.local/.macros/dwmBar/wifi.sh)
WIFI=$(/home/diego/.local/.macros/dwmBar/simpleWifi.sh)
BATTERY=$(/home/diego/.local/.macros/dwmBar/battery.sh)
SPOTIFY=$(/home/diego/.local/.macros/dwmBar/spotify.sh)
# PACK=$(pacman -Q --upgrades | wc -l)


if [ -z "$SPOTIFY" ] 
then
    # printf "[  %s      %s ]   [  %s    %s    %s ]   [ %s ]" "$MEM" "$CPU" "$VOL" "$WIFI" "$BATTERY" "$LOCALTIME" 
    printf "  %s   %s    %s  %s %s    %s " "$MEM" "$CPU" "$VOL" "$WIFI" "$BATTERY" "$LOCALTIME" 
else 
    # printf "[  %s    %s ]   [  %s  %s ]   [ %s    %s ]   [ %s ]" "$MEM" "$CPU" "$SPOTIFY" "$VOL" "$WIFI" "$BATTERY" "$LOCALTIME" 
    printf "  %s   %s  %s %s  %s  %s  %s " "$MEM" "$CPU" "$SPOTIFY" "$VOL" "$WIFI" "$BATTERY" "$LOCALTIME" 
fi
