#!/bin/bash

while true; do
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
    
        #status=$chargingIcon
    
    	# Will make a warn variable if discharging and low
        # [ "$capacity" -le 25 ] && warn="❗"
        [ "$capacity" -le 10 ] && warn=""
    	# [ "$status"="" ] && [ "$capacity" -le 25 ] && warn="❗"
    	# Prints the info
    	# printf "%s %s%d%%" "$warn" "$status " " $capacity"; unset warn
        BatResult=$(printf "%s %s%d%%" "$warn" "$status " " $capacity")
        echo "$BatResult" > '/home/diego/.local/.macros/dwmBar/readings/battery.txt'
        unset warn
    # done && printf "\\n"
    done &
    sleep 45s 
done &
