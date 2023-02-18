#!/bin/bash

while true; do
    cpu_usage=$(top -b -n1 | grep "Cpu(s)" | awk '{print $2 + $4}')
    # Use printf to format the output
    printf "%s%.2f%%%s\n" "$color" "$cpu_usage" "$reset" > /tmp/usageCPU.txt
    sleep 5s
done &
