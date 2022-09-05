# RegularWebcamAndScreenShots
Makes a webcam and screen shot every 5 minutes  

# WARNING
Make sure you keep the captured content in the extremly safe location because the captured content may reveal sensitive information. For example, screenshots may reveal passwords, source of a highly secure software you may work with, private meeting content, and so on; the taken webcam pictures may reveal your life schedule, sensitive life scenes, people who wants to stay private, and so on. Be caucious!

# Install for Ubuntu 22.04

Installs the script.

## Install Dependencies

`sudo apt-get install scrot` (for printscreen)  

`sudo apt-get install fswebcam` (for webcam shots)  

## Prepare directories for the content

`mkdir -p ~/Pictures/RegularScreenshots/` (for saving screenshots into)  

`mkdir -p ~/Pictures/RegularWebcam/` (for saving webcam shots into)

## Prepare directory for this script to be placed to

`mkdir -p ~/dev/RegularWebcamAndScreenShots/` (create a directory for the script doing screenshots)  

`cd ~/dev/RegularWebcamAndScreenShots/` (go into the directory)

`git clone https://github.com/PauliusMacernis/RegularWebcamAndScreenShots.git .` (clone the actual script code to the RegularWebcamAndScreenShots directory) 

`chmod +x ~/dev/RegularWebcamAndScreenShots/RegularWebcamAndScreenShots.sh` (make the script executable)  


# Test if all works

Run it:  
`~/dev/RegularWebcamAndScreenShots/RegularWebcamAndScreenShots.sh`  

Check directories for a one image created in the each directory every 5 minutes:  
`ls -al ~/Pictures/RegularScreenshots/ && ls -al ~/Pictures/RegularWebcam/`  


# Make it autostart (to load when computer boots up)  


`sudo cp ~/dev/RegularWebcamAndScreenShots/RegularWebcamAndScreenShots.sh /usr/bin/RegularWebcamAndScreenShots.sh` - copy the script from repository to /usr/bin dir  

`sudo chmod +x /usr/bin/RegularWebcamAndScreenShots.sh` - make sure the script is executable  

`mkdir -p ~/.config/systemd/user/` - create a dir for a unit  

`sudo cp ~/dev/RegularWebcamAndScreenShots/RegularWebcamAndScreenShots.service ~/.config/systemd/user/RegularWebcamAndScreenShots.service`  - copy the unit  

`sudo cp ~/dev/RegularWebcamAndScreenShots/RegularWebcamAndScreenShots.desktop  ~/.config/autostart/RegularWebcamAndScreenShots.desktop` - copy the file that will launch the unit on startup   

**Restart**  


## After the restart (test the autorun)

`sudo systemctl list-units | egrep -i screen`  - list all units, look for units about a screen

`systemctl --user status RegularWebcamAndScreenShots.service`  - to see the status of the process, it must be running  


<!-- 

`sudo cp ~/dev/RegularWebcamAndScreenShots/RegularWebcamAndScreenShots.service /etc/systemd/system/RegularWebcamAndScreenShots.service`  

`sudo chmod 640 /etc/systemd/system/RegularWebcamAndScreenShots.service`  

`sudo systemctl enable /etc/systemd/system/RegularWebcamAndScreenShots.service`  - to create symlink `/etc/systemd/system/multi-user.target.wants/RegularWebcamAndScreenShots.service` → `/etc/systemd/system/RegularWebcamAndScreenShots.service`  

`sudo systemctl list-units | egrep -i screen`  

`sudo systemctl status etc-systemd-system-RegularWebcamAndScreenShots.service`  

`sudo systemctl daemon-reload`  - tell systemd to reload the unit file definitions  

`sudo systemctl enable RegularWebcamAndScreenShots` - enable on startup  

`sudo systemctl start RegularWebcamAndScreenShots` - start it now  

`sudo systemctl status RegularWebcamAndScreenShots.service` - verify it's running now  
 -->

# In case you modify the script.. run this each time you do so

```
sudo cp ~/dev/RegularWebcamAndScreenShots/RegularWebcamAndScreenShots.sh /usr/bin/RegularWebcamAndScreenShots.sh \
&& sudo cp ~/dev/RegularWebcamAndScreenShots/RegularWebcamAndScreenShots.service ~/.config/systemd/user/RegularWebcamAndScreenShots.service \
&& sudo cp ~/dev/RegularWebcamAndScreenShots/RegularWebcamAndScreenShots.desktop  ~/.config/autostart/RegularWebcamAndScreenShots.desktop \
 \
&& sudo chmod +x /usr/bin/RegularWebcamAndScreenShots.sh \
 \
&& sudo systemctl daemon-reload \
&& systemctl --user daemon-reload \
&& systemctl --user restart RegularWebcamAndScreenShots.service \
&& systemctl --user status RegularWebcamAndScreenShots.service
```

# Resources:  

- autorun: https://www.howtogeek.com/687970/how-to-run-a-linux-program-at-startup-with-systemd/  
- similar project (autorun): https://github.com/PauliusMacernis/ResponsibleTime/tree/master/collect-activities  

