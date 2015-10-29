#!/bin/bash
#Script taken from reddit/r/unixporn (a better i3 lock)
#takes one argument... path to lock logo image
scrot /tmp/screen.png
convert /tmp/screen.png -scale 10% -scale 1000% /tmp/screen.png
[[ -f $1 ]] && convert /tmp/screen.png $1 -gravity center -composite -matte /tmp/screen.png
i3lock -u -i /tmp/screen.png

#Turning off the screen on a delay
