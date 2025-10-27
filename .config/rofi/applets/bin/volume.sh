#!/usr/bin/env bash

## Author  : Aditya Shakya (adi1090x)
## Github  : @adi1090x
#
## Applets : Volume

# Import Current Theme
source "$HOME"/.config/rofi/applets/shared/theme.bash
theme="$HOME/.config/rofi/applets/type-1/style-vol.rasi"

# Volume Info
mixer="`amixer info Master | grep 'Mixer name' | cut -d':' -f2 | tr -d \',' '`"
speaker="`amixer get Master | tail -n1 | awk -F ' ' '{print $5}' | tr -d '[]'`"
mic="`amixer get Capture | tail -n1 | awk -F ' ' '{print $5}' | tr -d '[]'`"

active=""
urgent=""

# Speaker Info
amixer get Master | grep '\[on\]' &>/dev/null
if [[ "$?" == 0 ]]; then
	urgent="-u 1"
	stext='Mute'
	sicon=''
else
	active="-a 1"
	stext='Unmute'
	sicon=''
fi

# Microphone Info
amixer get Capture | grep '\[on\]' &>/dev/null
if [[ "$?" == 0 ]]; then
    [ -n "$urgent" ] && urgent+=",3" || urgent="-u 3"
	mtext='Mute'
	micon=''
else
    [ -n "$active" ] && active+=",3" || active="-a 3"
	mtext='Unmute'
	micon=''
fi

# Theme Elements
prompt="S:$stext, M:$mtext"
mesg="Speaker: $speaker, Mic: $mic"

if [[ "$theme" == *'type-1'* ]]; then
	list_col='1'
	list_row='6'
	win_width='400px'
elif [[ "$theme" == *'type-3'* ]]; then
	list_col='1'
	list_row='6'
	win_width='120px'
elif [[ "$theme" == *'type-5'* ]]; then
	list_col='1'
	list_row='6'
	win_width='520px'
elif [[ ( "$theme" == *'type-2'* ) || ( "$theme" == *'type-4'* ) ]]; then
	list_col='6'
	list_row='1'
	win_width='670px'
fi

# Options
layout=`cat ${theme} | grep 'USE_ICON' | cut -d'=' -f2`
if [[ "$layout" == 'NO' ]]; then
	option_1=" Increase"
	option_2=" Decrease"
	option_3=" Settings"
	option_4=" Easy Effects"
	option_5="$sicon $stext"
	option_6="$micon $mtext"
else
	option_1=""
	option_2=""
	option_3=""
	option_4=""
	option_5="$sicon"
	option_6="$micon"
fi

# Rofi CMD
rofi_cmd() {
	rofi -theme-str "window {width: $win_width;}" \
		-theme-str "listview {columns: $list_col; lines: $list_row;}" \
		-theme-str 'textbox-prompt-colon {str: "";}' \
		-dmenu \
		-p "$prompt" \
		-mesg "$mesg" \
		${active} ${urgent} \
		-markup-rows \
		-theme ${theme}
}

# Pass variables to rofi dmenu
run_rofi() {
	echo -e "$option_1\n$option_2\n$option_3\n$option_4\n$option_5\n$option_6" | rofi_cmd
}

# Execute Command
run_cmd() {
	if [[ "$1" == '--opt1' ]]; then
		amixer -Mq set Master,0 5%+ unmute
	elif [[ "$1" == '--opt2' ]]; then
		amixer set Master toggle
	elif [[ "$1" == '--opt3' ]]; then
		pavucontrol
	elif [[ "$1" == '--opt4' ]]; then
    easyeffects
	elif [[ "$1" == '--opt7' ]]; then
		amixer set Capture toggle
	elif [[ "$1" == '--opt6' ]]; then
		amixer -Mq set Master,0 5%- unmute
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

