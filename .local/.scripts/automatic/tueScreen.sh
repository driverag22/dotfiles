#!/bin/sh

# if [[ $(xrandr -q | grep 'HDMI-1-0 connected') ]]; then
#     xrandr --output eDP-1 --primary --mode 1920x1080 --rotate normal --output HDMI-1-0 --mode 2560x1440 --rotate normal --right-of eDP-1
# fi
# xrandr --output HDMI-1-0 --primary --mode 2560x1440 --pos 0x0 --rotate normal --output eDP-1 --mode 1920x1080 --pos 2560x62 --rotate normal 
xrandr --output HDMI-1-0 --primary --mode 1920x1080 --pos 0x0 --rotate normal --output eDP-1 --mode 1920x1080 --pos 2560x62 --rotate normal 
# xrandr --output HDMI-1-0 --mode 1920x1080 --pos 0x0 --rotate normal --same-as eDP-1 --mode 1920x1080 --pos 2560x62 --rotate normal 
