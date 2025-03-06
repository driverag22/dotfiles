#!/bin/bash

    # Loop through all attached batteries and format the info
    for battery in /sys/class/power_supply/BAT?*; do
    	# If non-first battery, print a space separator.
    	# [ -n "${capacity+x}" ] && printf " "
    	[ -n "${capacity+x}" ]
    	capacity="$(cat "$battery/capacity" 2>&1)"
        if [ $capacity -eq 100 ] 
        then
            chargingIcon=""
            notChargingIcon=""
        elif [ $capacity -gt 80 ]
        then
            chargingIcon=""
            notChargingIcon=""
        elif [ $capacity -gt 60 ]
        then
            chargingIcon=""
            notChargingIcon=""
        elif [ $capacity -gt 40 ]
        then
            chargingIcon=""
            notChargingIcon=""
        elif [ $capacity -gt 20 ]
        then
            chargingIcon=""
            notChargingIcon=""
        else
            chargingIcon=""
            notChargingIcon=""
        fi
    	   
    	case "$(cat "$battery/status" 2>&1)" in
    		"Discharging") status="$notChargingIcon";;
    		"Charging") status="$chargingIcon";;
    		"Not charging") status="";;
    		"Unknown") status="♻️ ";;
    		*) status="" ;;
    	esac
    
        [ "$capacity" -le 10 ] && warn=""
    	printf "%s %s%d%%" "$warn" "$status " " $capacity" > '/home/diego/.local/.scripts/dwmBar/tmp/battery.txt'
        unset warn
    done &
