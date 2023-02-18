#!/bin/bash

# Set the color codes
# red=$'\e[1;31m'
# green=$'\e[1;32m'
# yellow=$'\e[1;33m'
# blue=$'\e[1;34m'
# magenta=$'\e[1;35m'
# cyan=$'\e[1;36m'
# reset=$'\e[0m'

# Set the threshold values
# low_threshold=30
# high_threshold=70

# Get the current CPU usage
cpu_usage=$(top -b -n1 | grep "Cpu(s)" | awk '{print $2 + $4}')

# Set the color based on the CPU usage
# if (( $(echo "$cpu_usage < $low_threshold" | bc -l) )); then
#   color=$green
# elif (( $(echo "$cpu_usage < $high_threshold" | bc -l) )); then
#   color=$yellow
# else
#   color=$red
# fi

# Use printf to format the output
printf "%s%.2f%%%s\n" "$color" "$cpu_usage" "$reset"
