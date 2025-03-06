#!/bin/sh
while true; do
    DB=$(dropbox-cli status)
    echo "$DB" > '/tmp/dropbox.txt'
    sleep 20s
done &
