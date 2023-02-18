#!/usr/bin/env bash
# original script created by clusterF
# modified by ManyRoads
# remodified by driverag22

# LOCALTIME=$(date '+ %a. %d %b.   %R')
LOCALTIME=$(cat /home/diego/.local/.macros/dwmBar/readings/time.txt)
VOL=$(/home/diego/.local/.macros/dwmBar/runners/vol.sh)
MEM=$(free -h --kilo | awk '/^Mem:/ {print $3 "/" $2}')
# CPU=$(/home/diego/.local/.macros/dwmBar/cpu.sh)
CPU=$(/home/diego/.local/.macros/dwmBar/runners/usageCPU.sh)
# WIFI=$(/home/diego/.local/.macros/dwmBar/wifi.sh)
WIFI=$(/home/diego/.local/.macros/dwmBar/runners/simpleWifi.sh)
# BATTERY=$(/home/diego/.local/.macros/dwmBar/runners/battery.sh)
BATTERY=$(cat /home/diego/.local/.macros/dwmBar/readings/battery.txt)
SPOTIFY=$(/home/diego/.local/.macros/dwmBar/runners/spotify.sh)
# PACK=$(pacman -Q --upgrades | wc -l)


if [ -z "$SPOTIFY" ] 
then
    # printf "[  %s      %s ]   [  %s    %s    %s ]   [ %s ]" "$MEM" "$CPU" "$VOL" "$WIFI" "$BATTERY" "$LOCALTIME" 
    printf "  %s   %s    %s  %s %s    %s " "$MEM" "$CPU" "$VOL" "$WIFI" "$BATTERY" "$LOCALTIME" 
else 
    # printf "[  %s    %s ]   [  %s  %s ]   [ %s    %s ]   [ %s ]" "$MEM" "$CPU" "$SPOTIFY" "$VOL" "$WIFI" "$BATTERY" "$LOCALTIME" 
    printf "  %s   %s  %s %s  %s  %s  %s " "$MEM" "$CPU" "$SPOTIFY" "$VOL" "$WIFI" "$BATTERY" "$LOCALTIME" 
fi
