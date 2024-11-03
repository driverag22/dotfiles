#!/bin/sh
TMP="$HOME/.local/.macros/dwmBar/tmp"
# interface=$(ip link | grep -o 'wl[^:]*')
# wifiRate=$(nmcli -f ACTIVE,RATE dev wifi list | awk '$1=="yes" {print $2 "Mbit/s"}')
# wifiBars=$(nmcli -f ACTIVE,BARS dev wifi list | awk '$1=="yes" {print $2}')
while true; do
    # Check if ethernet is connected
    ethConnected=$(nmcli -f DEVICE,STATE dev status | awk '$1 ~ /^e/ && $2 == "connected" {print $1}')
    
    if [ -n "$ethConnected" ]; then
        ethSSID=$(nmcli -f DEVICE,CONNECTION dev status | awk -v dev="$ethConnected" '$1 == dev {for(i=2; i<=NF; i++) printf $i " "; print ""}')
        printf "%s%s" "󰈀 " "$ethSSID" > "$TMP/wifi.txt"
    else
        wifiSignal=$(nmcli -f ACTIVE,SIGNAL dev wifi list | awk '$1=="yes" {print $2}')
        wifiSSID=$(nmcli -f ACTIVE,SSID dev wifi list | awk '$1=="yes" {print $2 " " $3}')
        if [ -z $wifiSignal ] 
        then
            icon=" "
            printf "$icon" > '/tmp/wifi.txt';
        else
            if [ $wifiSignal -gt 80 ]
            then 
                icon=" "
            elif [ $wifiSignal -gt 60 ]
            then
                icon=" "
            elif [ $wifiSignal -gt 40 ]
            then
                icon=" "
            elif [ $wifiSignal -gt 20 ]
            then 
                icon=" "
            else 
                icon=" "
            fi
            printf "%s%s %s" "$icon" "$wifiSSID" "$wifiSignal% " > "$TMP/wifi.txt";
        fi
    fi
    sleep 10s
done &
