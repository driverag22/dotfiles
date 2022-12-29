#!/usr/bin/env bash
# original script created by clusterF
# modified by ManyRoads
# remodified by driverag22

while true; do
        # values=$(/home/diego/.local/.macros/dwmBar/values.sh)
        values=$(/home/diego/.local/.macros/dwmBar/simpleValues.sh)
        # values=$(/home/diego/.local/.macros/dwmBar/minimalistValues.sh)
        xsetroot -name "$values"
        sleep 0.5s
done &
