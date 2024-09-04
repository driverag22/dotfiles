#!/bin/bash

num_screens=$(xrandr | grep -o -c ' connected') #count num. of connected screens

if [ $num_screens -eq 1 ]
then
    # feh --no-fehbg --bg-fill '/home/diego/Pictures/wallpaper-master/SDAGvuq.png'
    feh --no-fehbg --bg-fill '/home/diego/Pictures/wallpaper-master/wallpaper.png'
else
    /home/diego/.local/.macros/automatic/screensNetherlands.sh
    feh --no-fehbg --bg-fill '/home/diego/Pictures/wallpaper-master/SDAGvuq.png' --bg-fill '/home/diego/Pictures/wallpaper-master/SDAGvuq.png'
fi
