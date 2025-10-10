#!/bin/sh
#source /usr/share/nvm/init-nvm.sh

export MESA_LOADER_DRIVER_OVERRIDE=iris
export XCURSOR_SIZE=24

#sets dwmBar running to display values
/home/diego/.local/.scripts/dwmBar/dwmbar.sh

#sets screens and background
/home/diego/.local/.scripts/automatic/fehbg.sh 

#make wireless mouse work correctly
/home/diego/.local/.scripts/automatic/mouse.sh 

#fix broken java displays on dwm (for netbeans)
# export _JAVA_AWT_WM_NONREPARENTING=1
# wmname "LG3D"

#turn off bluetooth and mute speakers
# bluetoothctl power off
amixer set Master mute

# trackpad fixes
xinput set-prop "Synaptics TM3625-010" "libinput Tapping Enabled" 1
xinput set-prop "Synaptics TM3625-010" "libinput Natural Scrolling Enabled" 1

# gurobi software environmet variables
# export GUROBI_HOME="/opt/gurobi1201/linux64"
# export PATH="${PATH}:${GUROBI_HOME}/bin"
# export LD_LIBRARY_PATH="${LD_LIBRARY_PATH}:${GUROBI_HOME}/lib"
# export GRB_LICENSE_FILE="/home/diego/gurobi.lic"

#set keyboard so specific letters (ñ,á,...) needed for spanish can be used
setxkbmap us -variant intl

#start compositor, warpd (keyboard-controller mouse), systray, screenshot tool and wm
picom &
warpd &
stalonetray &
keepassxc &
nm-applet &
flameshot &
dunst &
exec dwm
