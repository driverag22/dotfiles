#!/bin/sh

# Prints all batteries, their percentage remaining and an emoji corresponding
# to charge status (🔌 for plugged up, 🔋 for discharging on battery, etc.).

# case $BLOCK_BUTTON in
# 	3) notify-send "🔋 Battery module" "🔋: discharging
# : not charging
# ♻: stagnant charge
# : charging
# : charged
# ❗: battery very low!
# - Scroll to change adjust xbacklight." ;;
# 	4) xbacklight -inc 10 ;;
# 	5) xbacklight -dec 10 ;;
# 	6) "$TERMINAL" -e "$EDITOR" "$0" ;;
# esac

# Loop through all attached batteries and format the info
for battery in /sys/class/power_supply/BAT?*; do
	# If non-first battery, print a space separator.
	[ -n "${capacity+x}" ] && printf " "
	# Sets up the status and capacity
	# case "$(cat "$battery/status" 2>&1)" in
	# 	"Full") status="" ;;
	# 	"Discharging") status="" ;;
	# 	"Charging") status="" ;;
	# 	"Not charging") status="" ;;
	# 	"Unknown") status="♻️" ;;
	# 	*) exit 1 ;;
	# esac
	capacity="$(cat "$battery/capacity" 2>&1)"
    if [ $capacity -eq 100 ] 
    then
        chargingIcon=" "
        notChargingIcon=""
    elif [ $capacity -gt 80 ]
    then
        chargingIcon=" "
        notChargingIcon=""
    elif [ $capacity -gt 60 ]
    then
        chargingIcon=" "
        notChargingIcon=""
    elif [ $capacity -gt 40 ]
    then
        chargingIcon=" "
        notChargingIcon=""
    elif [ $capacity -gt 20 ]
    then
        chargingIcon=" "
        notChargingIcon=""
    else
        chargingIcon=" "
        notChargingIcon=""
    fi
	   
	case "$(cat "$battery/status" 2>&1)" in
		"Discharging") status=$notChargingIcon ;;
		"Charging") status=$chargingIcon ;;
		"Not charging") status= "" ;;
		"Unknown") status="♻️" ;;
		*) exit 1 ;;
	esac

	# Will make a warn variable if discharging and low
    [ "$capacity" -le 25 ] && warn="❗"
	# [ "$status"="" ] && [ "$capacity" -le 25 ] && warn="❗"
	# Prints the info
	printf "%s %s%d%%" "$status" "$warn" " $capacity"; unset warn
done && printf "\\n"
