#!/bin/sh
# A dwm_bar function that shows the current artist, track, duration, and status from Spotify using playerctl
# Joe Standring <git@joestandring.com>
# Edited by: Diego Rivera <git@driverag22.com>
# GNU GPLv3
# Dependencies: spotify/spotifyd, playerctl
while true; do
    TRACK=$(playerctl metadata title)
    if [ ! -z "$TRACK" ]; then
        ARTIST=$(playerctl metadata artist)
        TRACK=$(playerctl metadata title)
        STATUS=$(playerctl status)
        # POSITION=$(playerctl position | sed 's/..\{6\}$//')
        # DURATION=$(playerctl metadata mpris:length | sed 's/.\{6\}$//')
        # SHUFFLE=$(playerctl shuffle)
    
        if [ "$STATUS" = "Playing" ]; then
            STATUS=" "
        else
            STATUS=" "
        fi
    
        if [ "$STATUS" == "No players found " ]; then
            echo "bad" > '/tmp/spotify.txt'
        else
            printf "%s%s - %s" "$STATUS " "$TRACK" "$ARTIST" > '/tmp/spotify.txt'
        fi
    else 
        echo "" > '/tmp/spotify.txt'
    fi
    sleep 7s
done &
