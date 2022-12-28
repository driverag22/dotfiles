#!/usr/bin/env bash
# original script created by clusterF
# modified by ManyRoads
# remodified by driverag22

while true; do
        values=$(/home/diego/.local/.macros/dwmBar/values.sh)
        # values=$(/home/diego/.local/.macros/dwmBar/simpleValues.sh)
        xsetroot -name "$values"
        sleep 2s
done &
