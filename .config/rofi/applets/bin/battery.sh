#!/usr/bin/env bash

## Author  : Aditya Shakya (adi1090x)
## Github  : @adi1090x
#
## Applets : Battery

# Import Current Theme
source "$HOME"/.config/rofi/applets/shared/theme.bash
theme="$type/$style"

# Battery Info
battery="`acpi -b | cut -d',' -f1 | cut -d':' -f1`"
status="`cat "/sys/class/power_supply/BAT0/status" 2>&1`"
percentage="`cat "/sys/class/power_supply/BAT0/capacity" 2>&1`"
time="`acpi -b | grep "Battery 0" | awk '{print $5 " " $6 " " $7}' `"
temp="`acpi -t | cut -d',' -f2`"
voltage="`upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep 'voltage' | awk {'print $2'}` V"
energy="`upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep 'energy:' | awk {'print $2'}`"
energytot="`upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep 'energy-full:' | awk {'print $2'}`"

if [[ -z "$time" ]]; then
	time=' Fully Charged'
fi

# Theme Elements
prompt="$status"


if [[ "$theme" == *'type-1'* ]]; then
	list_col='1'
	list_row='2'
	win_width='400px'
elif [[ "$theme" == *'type-3'* ]]; then
	list_col='1'
	list_row='4'
	win_width='120px'
elif [[ "$theme" == *'type-5'* ]]; then
	list_col='1'
	list_row='4'
	win_width='500px'
elif [[ ( "$theme" == *'type-2'* ) || ( "$theme" == *'type-4'* ) ]]; then
	list_col='4'
	list_row='1'
	win_width='550px'
fi

# Charging Status
active=""
urgent=""
if [[ $status = *"Charging"* ]]; then
    # active="-a 1"
    ICON_CHRG=""
elif [[ $status = *"Full"* ]]; then
    # active="-u 1"
    ICON_CHRG=""
else
    # urgent="-u 1"
    ICON_CHRG=""
fi

if [ $percentage -eq 100 ] 
then
    chargingIcon=""
    notChargingIcon=""
elif [ $percentage -gt 80 ]
then
    chargingIcon=""
    notChargingIcon=""
elif [ $percentage -gt 60 ]
then
    chargingIcon=""
    notChargingIcon=""
elif [ $percentage -gt 40 ]
then
    chargingIcon=""
    notChargingIcon=""
elif [ $percentage -gt 20 ]
then
    chargingIcon=""
    notChargingIcon=""
else
    chargingIcon=""
    notChargingIcon=""
fi
   
case "$status" in
	"Discharging") statIcon="$notChargingIcon";;
	"Charging") statIcon="$chargingIcon";;
	"Not charging") statIcon="";;
	"Unknown") statIcon="♻️ ";;
	*) statIcon="" ;;
esac

option_1="$statIcon $percentage%"
option_2=" $time"
option_3=" $temp"
option_4=" $voltage"
option_5="$energy / $energytot Wh"

# Rofi CMD
rofi_cmd() {
	rofi -theme-str "window {width: $win_width;}" \
		-theme-str "textbox-prompt-colon {str: \"$ICON_DISCHRG\";}" \
		-dmenu \
        -mesg "Battery Status" \
		-p "$prompt" \
		${active} ${urgent} \
		-markup-rows \
		-theme ${theme}
}

# Pass variables to rofi dmenu
run_rofi() {
	echo -e "$option_1 \n $option_2\n$option_3\n$option_4\n$option_5" | rofi_cmd
}

# Execute Command
run_cmd() {
	polkit_cmd="pkexec env PATH=$PATH DISPLAY=$DISPLAY XAUTHORITY=$XAUTHORITY"
	if [[ "$1" == '--opt1' ]]; then
		notify-send -u low " Remaining : ${percentage}%"
	elif [[ "$1" == '--opt2' ]]; then
		notify-send -u low "$ICON_CHRG Status : $status"
	elif [[ "$1" == '--opt3' ]]; then
		notify-send -u low "$ICON_CHRG Status : $status"
	elif [[ "$1" == '--opt4' ]]; then
		notify-send -u low "$ICON_CHRG Status : $status"
	elif [[ "$1" == '--opt5' ]]; then
		notify-send -u low "$ICON_CHRG Status : $status"
	fi
}

# Actions
chosen="$(run_rofi)"
case ${chosen} in
    $option_1)
		run_cmd --opt1
        ;;
    $option_2)
		run_cmd --opt2
        ;;
    $option_3)
		run_cmd --opt3
        ;;
    $option_4)
		run_cmd --opt4
        ;;
    $option_5)
		run_cmd --opt5
        ;;
esac


