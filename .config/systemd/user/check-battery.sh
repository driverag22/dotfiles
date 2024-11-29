#!/bin/bash
# printf 'battery check script started' | systemd-cat -t check-battery
BATTINFO=`acpi -b`
if [[ `echo $BATTINFO | grep Discharging` && `echo $BATTINFO | awk '{print int($4)}'` < 20 ]] ; then
        # printf 'condition is true' | systemd-cat -t check-battery
        BATTINFO_CLEAN=$(echo "$BATTINFO" | awk -F', ' '{print $2 ", " $3}')
        DISPLAY=:0 /usr/bin/notify-send -u critical "Battery low!" "$BATTINFO_CLEAN"
fi
