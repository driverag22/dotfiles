#!/usr/bin/env bash
# original script created by clusterF
# modified by ManyRoads
# remodified by driverag22


while true; do

        date '+  %a. %d %b. ]   [   %R' > /tmp/CurTime.tmp

        sleep 60s
done &

while true; do

        LOCALTIME=$(< /tmp/CurTime.tmp)
        DB=$(dropbox-cli status)
		# VOL=$(pamixer --get-volume-human)
        MEM=$(free -h --kilo | awk '/^Mem:/ {print $3}')
        CPU=$(top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1}' )
        TEMP=$(sensors|grep 'Core 0'|awk '{print $3}' )
        DISK=$(df -Ph | grep "/dev/mapper/cryptroot" | awk {'print $5'})
		WIFI=$(/home/diego/.local/.macros/dwmBar/wifi.sh)
        BATTERY=$(/home/diego/.local/.macros/dwmBar/battery.sh)
        # xsetroot -name "  $MEM |  $CPU% |  $TEMP |   $DISK    $VOL   $WIFI%   $DB  $LOCALTIME    "
        # xsetroot -name "   $DISK |   $DB   $MEM    $CPU%   $TEMP || $BATTERY || $WIFI || $LOCALTIME |  "
        # xsetroot -name "  $DISK ⏽   $DB ⏽⏽  $MEM ⏽   $CPU% ⏽  $TEMP ⏽⏽ $BATTERY ⏽⏽ $WIFI ⏽⏽ $LOCALTIME ⏽⏽"
        xsetroot -name "[  $DISK ]   [   $DB ]   [  $MEM ]   [   $CPU% ]   [  $TEMP ]   [ $BATTERY ]   [ $WIFI ]   [ $LOCALTIME ]"
        # xsetroot -name "  $DB      $MEM       $CPU%      $TEMP     $BATTERY     $WIFI     $LOCALTIME  "
        sleep 5s
done &
