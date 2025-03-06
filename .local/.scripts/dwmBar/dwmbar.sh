#!/usr/bin/env bash
# original script created by clusterF
# modified by ManyRoads
# remodified by driverag22

# Here we initialize the runners for the cleanValues
# /home/diego/.local/.scripts/dwmBar/runClean.sh
/home/diego/.local/.scripts/dwmBar/runNew.sh

while true; do
        ## Choices:
        # values.sh -- everything
        # simpleValues.sh 
        # cleanValues.sh
        # miniValues.sh
        # minimalistValues.sh
        # newValues.sh
        
        # Note that, depending on the choice made above, you 
        # need to initialize the actual runners. 
        # Files runClean.sh and runFull.sh are exampels which 
        # initialize the runners for cleanValues.sh and for values.sh. 
        # You can add the path to the initializer in your .xinit or .xprofile
        # to make it work.

        # values=$(/home/diego/.local/.scripts/dwmBar/values/cleanValues.sh)
        values=$(/home/diego/.local/.scripts/dwmBar/values/newValues.sh)

        xsetroot -name "$values"
        sleep 0.5s ## refresh rate for general bar
done &
