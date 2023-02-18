#!/bin/sh

interface=$(ip link | grep -o 'wl[^:]*')

# wifiRate=$(nmcli -f ACTIVE,RATE dev wifi list | awk '$1=="yes" {print $2 "Mbit/s"}')
wifiSignal=$(nmcli -f ACTIVE,SIGNAL dev wifi list | awk '$1=="yes" {print $2 "%"}')
wifiBars=$(nmcli -f ACTIVE,BARS dev wifi list | awk '$1=="yes" {print $2}')


if [ -z $wifiSignal ] 
then
    icon="睊 "
    printf "$icon";
else
    icon=" "
    printf "%s%s" "$icon" "$wifiSignal";
    # printf "%s" " $wifiBars";
fi
