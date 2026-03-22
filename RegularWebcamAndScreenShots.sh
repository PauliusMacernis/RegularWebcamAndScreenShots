#!/usr/bin/env bash
while true
do 
 gdbus call --session \
   --dest org.gnome.Shell.Screenshot \
   --object-path /org/gnome/Shell/Screenshot \
   --method org.gnome.Shell.Screenshot.Screenshot \
   false false "$HOME/Pictures/RegularScreenshots/$(date '+%Y-%m-%d-%H:%M:%S').png"
 fswebcam -r 1280x720 --jpeg 85 --no-shadow --no-underlay --no-overlay --timestamp "%Y-%m-%d %H:%M:%S %z" -D 1 "$HOME/Pictures/RegularWebcam/%Y-%m-%d--%H%M%S-%Z.jpg"
 sleep 300
done
