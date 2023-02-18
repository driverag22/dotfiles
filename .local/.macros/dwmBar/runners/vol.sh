#!/bin/sh
VOL=$(awk -F"[][]" '/Left:/ { print $2 }' <(amixer sget Master))
STATE=$(awk -F"[][]" '/Left:/ { print $4 }' <(amixer sget Master))

if [ "$STATE" = "off" ] 
then
    icon=" "
    printf "$icon";
else
    icon=""
    printf "%s%s" "$icon " "$VOL";
fi
# printf "%s%s" "$icon" " $VOL";

