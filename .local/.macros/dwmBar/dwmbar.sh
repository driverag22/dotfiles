#!/usr/bin/env bash
# original script created by clusterF
# modified by ManyRoads
# remodified by driverag22

while true; do
        ## Choices:
        # values.sh -- everything
        # simpleValues.sh 
        # cleanValues.sh
        # miniValues.sh
        # minimalistValues.sh
        
        values=$(/home/diego/.local/.macros/dwmBar/values/cleanValues.sh)

        xsetroot -name "$values"
        sleep 1s ## refresh rate
done &
