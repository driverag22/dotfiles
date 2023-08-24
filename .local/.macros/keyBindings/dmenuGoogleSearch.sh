#!/bin/bash

if [ -f $HOME/.dmenurc ]; then
  . $HOME/.dmenurc
else
  DMENU='dmenu -i'
fi

GS=`cat ~/.gshist | $DMENU $*`

if grep -q "$GS" "$HOME/.gshist" ; then
    echo already exists in history
else
    echo $GS >> ~/.gshist
fi

if [ ! -z "$GS" ]; then
    firefox -new-window http://www.google.co.uk/search?q="$GS"
fi
