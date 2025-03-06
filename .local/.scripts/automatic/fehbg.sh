#!/bin/bash

num_screens=$(xrandr | grep -o -c ' connected') #count num. of connected screens

if [ $num_screens -eq 1 ]
then
    feh --no-fehbg --bg-fill '/home/diego/Pictures/wallpaper-master/quasimoto.jpg'
else
    /home/diego/.local/.scripts/automatic/screensNetherlands.sh
    feh --no-fehbg --bg-fill '/home/diego/Pictures/wallpaper-master/quasimoto.jpg' --bg-fill '/home/diego/Pictures/wallpaper-master/quasimoto.jpg'
fi
