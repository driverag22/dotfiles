#!/bin/sh


for battery in /sys/class/power_supply/BAT?*; do
	wifiStrength=$(nmcli -f ACTIVE,SIGNAL dev wifi list | awk '$1=="yes" {print $2}')

    if [ -z $wifiStrength ] 
    then
        icon="睊"
	    printf "$icon";
    else
        icon=" "
	    printf "%s%s%%" "$icon" " $wifiStrength";
    fi

done && printf "\\n"
