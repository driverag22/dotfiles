#!/usr/bin/env bash

## Author  : Aditya Shakya (adi1090x)
## Github  : @adi1090x
#
## Applets : Battery

# Import Current Theme
source "$HOME"/.config/rofi/applets/shared/theme.bash
theme="$HOME/.config/rofi/applets/type-1/style-media.rasi"

# Battery Info
artist=$(playerctl metadata artist)
track=$(playerctl metadata title)
album=$(playerctl metadata album)
status=$(playerctl status)
player=$(playerctl metadata | awk 'FNR == 1 {print $1}')

if [[ "$album" == "" ]]; then 
    album="-"
fi

if [[ "$player" == "" ]]; then 
    player="-"
fi

# if [[ "$status" == "Playing" ]]; then 
#     status="$status -  "
# else 
#     status="$status - 契"
# fi

option_1="Artist: $artist"
option_2="Song: $track"
option_3="Album: $album"
option_4="Player: $player"
option_5=" : $status" 
win_width='600px'
# Rofi CMD
rofi_cmd() {
	rofi -theme-str "window {width: $win_width;}" \
		-dmenu \
        -mesg "Media menu" \
		-theme ${theme}
}

# Pass variables to rofi dmenu
run_rofi() {
	echo -e "$option_1\n$option_2\n$option_3\n$option_4\n$option_5" | rofi_cmd
}

# Execute Command
run_cmd() {
	polkit_cmd="pkexec env PATH=$PATH DISPLAY=$DISPLAY XAUTHORITY=$XAUTHORITY"
}
run_rofi
