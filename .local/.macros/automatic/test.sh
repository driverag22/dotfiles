#!/bin/bash
num_screens=$(xrandr | grep -o -c ' connected') #count num. of connected screens

if [ $num_screens -gt 1 ]
then
    echo "yes"
else
    echo "no"
fi

echo $num_screens
