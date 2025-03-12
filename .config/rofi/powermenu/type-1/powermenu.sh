#!/usr/bin/env bash

## Author : Aditya Shakya (adi1090x)
## Github : @adi1090x
#
## Rofi   : Power Menu
#
## Available Styles
#
## style-1   style-2   style-3   style-4   style-5

# Current Theme
dir="$HOME/.config/rofi/powermenu/type-1"
theme='style-5'

# CMDs

uptime="  `uptime -p | sed -e 's/up //g'`"
# host='dwm'
host="  `df -Ph | grep "/dev/mapper/cryptroot" | awk {'print $3" / "$2'}`"

# Options
suspend=' Suspend'
shutdown=' Shutdown'
reboot=' Reboot'
term=' Term'
lock=' Lock'
logout=' Logout'
yes=' Yes'
no=' No'

# Rofi CMD
rofi_cmd() {
	rofi -dmenu \
		-mesg " $uptime  |  $host" \
		-theme ${dir}/${theme}.rasi
}

		# -p "$host" \
# Confirmation CMD
confirm_cmd() {
	rofi -theme-str 'window {location: center; anchor: center; fullscreen: false; width: 250px;}' \
		-theme-str 'mainbox {children: [ "message", "listview" ];}' \
		-theme-str 'listview {columns: 2; lines: 1;}' \
		-theme-str 'element-text {horizontal-align: 0.5;}' \
		-theme-str 'textbox {horizontal-align: 0.5;}' \
		-dmenu \
		-p 'Confirmation' \
		-mesg 'Are you Sure?' \
		-theme ${dir}/${theme}.rasi
}

# Ask for confirmation
confirm_exit() {
	echo -e "$yes\n$no" | confirm_cmd
}

# Pass variables to rofi dmenu
run_rofi() {
	echo -e "$suspend\n$shutdown\n$reboot\n$term" | rofi_cmd
}

# Execute Command
run_cmd() {
	selected="$(confirm_exit)"
	if [[ "$selected" == "$yes" ]]; then
		if [[ $1 == '--shutdown' ]]; then
			systemctl poweroff
		elif [[ $1 == '--reboot' ]]; then
			systemctl reboot
		elif [[ $1 == '--suspend' ]]; then
			mpc -q pause
			amixer set Master mute
			systemctl suspend
		elif [[ $1 == '--logout' ]]; then
            killall dwm
		fi
	else
		exit 0
	fi
}

# Actions
chosen="$(run_rofi)"
case ${chosen} in
    $suspend)
		run_cmd --suspend
        ;;
    $shutdown)
		run_cmd --shutdown
        ;;
    $reboot)
		run_cmd --reboot
        ;;
    $term)
		run_cmd --logout
        ;;
    $lock)
		if [[ -x '/usr/bin/betterlockscreen' ]]; then
			betterlockscreen -l
		elif [[ -x '/usr/bin/i3lock' ]]; then
			i3lock
		fi
        ;;
    $logout)
		run_cmd --logout
        ;;
esac
