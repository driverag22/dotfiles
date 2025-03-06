#!/bin/sh
DEVICE_ID=$(xinput list |  grep "Logitech G305" | grep keyboard | sed 's/.*id=\([0-9]*\).*/\1/')

if xinput -list-props $DEVICE_ID | grep "Device Enabled" | grep "1$" > /dev/null
then
        xinput set-int-prop $DEVICE_ID "Device Enabled" 8 0
fi
