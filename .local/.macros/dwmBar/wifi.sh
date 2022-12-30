#!/bin/sh

interface=$(ip link | grep -o 'wl[^:]*')

# wifiRate=$(nmcli -f ACTIVE,RATE dev wifi list | awk '$1=="yes" {print $2 "Mbit/s"}')
wifiSignal=$(nmcli -f ACTIVE,SIGNAL dev wifi list | awk '$1=="yes" {print $2 "%"}')
# wifiBars=$(nmcli -f ACTIVE,BARS dev wifi list | awk '$1=="yes" {print $2}')
upStream=$(cat /sys/class/net/$interface/statistics/tx_bytes)
downStream=$(cat /sys/class/net/$interface/statistics/rx_bytes)

upStream=$(echo "$upStream / 1024 / 1024" | bc)
downStream=$(echo "$downStream / 1024 / 1024" | bc)

if [ -z $wifiSignal ] 
then
    icon="睊 "
    printf "$icon";
else
    icon=" "
    # printf "%s%s%s" "$icon" " $wifiBars" " $wifiRate";
    # printf "%s%s" " $wifiBars" " $wifiSignal";
    printf " %sMB  %sMB  %s%s" " $upStream" "$downStream" "$icon " " $wifiSignal";
    # printf "%s%s%s" "$icon" " $wifiSignal";
fi

