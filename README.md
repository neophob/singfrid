# Singfrid

Singfrid is a node based smart home solution using existing technologies. Singfrids main goals are:
- reuse your old/obsolete single board computers
- make something fun and/or useful
- easy and fast setup process

Compared to existing solutions, which either rely on cloud computing or run on a central (local) controller, a Singfrid node can run whenever it is needed. It can be online or offline, it can run on old or on new hardware.

## Example use cases

- If someone opens your fridge, an angel sound is played on your kitchen Sonos
- If someone opens a window you hear birds singing in you living room Sonos
- If you enter the toilet, play "Jaws" soundtrack
- If the door opens at night and the Hue light in the kitchen is off, dim the kitchen light to 15%, wait 10 minutes and then power off
- Halloween fun for your whole family!
- Rickroll you office buddies

docker run -it --rm -p 1880:1880 -v node_red_data:/data --privileged --network host testing:node-red-build bash


## Core technologies

- Software: https://nodered.org is used as main "smart home" solution, mdns is used as discovery mechanism and Docker is used as defined runtime.
- Hardware: Any single board computer (SBC) that runs Node.js - how many unused SBC are lying around in your office?

# DIY

## custom node red docker image

- see https://github.com/node-red/node-red-docker/tree/master/docker-custom
- add needed packages build image, don't forget to set the correct tag!

## needed packages

- node-red-node-wol
- node-red-dashboard
- node-red-contrib-gpio
- node-red-contrib-huemagic
- node-red-contrib-sonos-plus
- node-red-contrib-alexa-smart-home
- node-red-contrib-homekit-bridged
