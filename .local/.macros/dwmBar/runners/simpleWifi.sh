#!/bin/sh
# interface=$(ip link | grep -o 'wl[^:]*')
# wifiRate=$(nmcli -f ACTIVE,RATE dev wifi list | awk '$1=="yes" {print $2 "Mbit/s"}')
# wifiBars=$(nmcli -f ACTIVE,BARS dev wifi list | awk '$1=="yes" {print $2}')
while true; do
    wifiSignal=$(nmcli -f ACTIVE,SIGNAL dev wifi list | awk '$1=="yes" {print $2 "%"}')
    wifiSSID=$(nmcli -f ACTIVE,SSID dev wifi list | awk '$1=="yes" {print $2 " " $3}')
    if [ -z $wifiSignal ] 
    then
        icon="睊"
        printf "$icon" > '/tmp/wifi.txt';
    else
        icon=" "
        printf "%s%s %s" "$icon" "$wifiSSID" "$wifiSignal" > '/tmp/wifi.txt';
    fi
    sleep 10s
done &
