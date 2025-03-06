#!/bin/sh
TMP="$HOME/.local/.scripts/dwmBar/tmp"
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
        PLAYER=$(playerctl metadata | awk 'FNR == 1 {print $1}')
        # POSITION=$(playerctl position | sed 's/..\{6\}$//')
        # DURATION=$(playerctl metadata mpris:length | sed 's/.\{6\}$//')
        # SHUFFLE=$(playerctl shuffle)
    
        if [ "$STATUS" = "Playing" ]; then
            STATUS=" "
        else
            STATUS=" "
        fi

        if [ "$PLAYER" == "spotify" ]; then 
            # printf "%s%s - %s" "$STATUS" "$TRACK" "$ARTIST" > '/tmp/spotify.txt'
            printf "%s%s" "$STATUS" "$TRACK" > "$TMP/spotify.txt"
        else 
            echo "" > "$TMP/spotify.txt"
        fi
    else 
        echo "" > "$TMP/spotify.txt"
    fi
    sleep 2s
done &
