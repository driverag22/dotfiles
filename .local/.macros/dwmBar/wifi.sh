#!/bin/sh


    wifiRate=$(nmcli -f ACTIVE,RATE dev wifi list | awk '$1=="yes" {print $2 "Mbit/s"}')

	wifiBars=$(nmcli -f ACTIVE,BARS dev wifi list | awk '$1=="yes" {print $2}')

    if [ -z $wifiBars ] 
    then
        icon="睊 "
	    printf "$icon";
    else
        # icon=" "
	    # printf "%s%s%s" "$icon" " $wifiBars" " $wifiRate";
	    printf "%s%s" " $wifiBars" " $wifiRate";
    fi

