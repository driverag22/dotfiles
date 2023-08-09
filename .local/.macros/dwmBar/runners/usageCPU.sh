#!/bin/bash
while true; do
    # cpu_usage=$(top -b -n1 | grep "Cpu(s)" | awk '{print $2 + $4}')
    # printf "%s%.2f%%%s\n" "$color" "$cpu_usage" "$reset" > '/tmp/usageCPU.txt'
    cpu_usage=$(top -bn 2 -d 0.01 | grep "^%Cpu" | tail -n 1 | gawk '{print $2+$4+$6}')"%"
    printf "%s%.2f%%%s\n" "$color" "$cpu_usage" > '/tmp/usageCPU.txt'
    sleep 10s
done &
