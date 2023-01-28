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
status="`acpi -b | cut -d',' -f1 | cut -d':' -f2 | tr -d ' '`"
percentage="`acpi -b | cut -d',' -f2 | tr -d ' ',\%`"
time="`acpi -b | awk '{print $5}' `"
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

# Discharging
if [[ $percentage -ge 5 ]] && [[ $percentage -le 19 ]]; then
    ICON_DISCHRG=""
elif [[ $percentage -ge 20 ]] && [[ $percentage -le 39 ]]; then
    ICON_DISCHRG=""
elif [[ $percentage -ge 40 ]] && [[ $percentage -le 59 ]]; then
    ICON_DISCHRG=""
elif [[ $percentage -ge 60 ]] && [[ $percentage -le 79 ]]; then
    ICON_DISCHRG=""
elif [[ $percentage -ge 80 ]] && [[ $percentage -le 100 ]]; then
    ICON_DISCHRG=""
fi

# Options
layout=`cat ${theme} | grep 'USE_ICON' | cut -d'=' -f2`
if [[ "$layout" == 'NO' ]]; then
	option_1="$ICON_CHRG $ICON_DISCHRG ${percentage}%"
	option_2=" $time"
    option_3=" $temp"
    option_4=" $voltage"
    option_5="$energy / $energytot Wh"
else
	option_1="$ICON_DISCHRG"
	option_2="$ICON_CHRG"
	option_3=""
	# option_4=""
fi

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
	echo -e "$option_1\n$option_2\n$option_3\n$option_4\n$option_5" | rofi_cmd
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


