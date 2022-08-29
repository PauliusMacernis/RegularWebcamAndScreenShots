#!/usr/bin/env bash
while true
do 
 scrot --silent '%Y-%m-%d-%H:%M:%S.png' -e 'mv $f ~/Pictures/RegularScreenshots/' 
 fswebcam -r 1280x720 --jpeg 85 --no-shadow --no-underlay --no-overlay --timestamp "%Y-%m-%d %H:%M:%S %z" -D 1 "$HOME/Pictures/RegularWebcam/%Y-%m-%d--%H%M%S-%Z.jpg"
 sleep 300
done
