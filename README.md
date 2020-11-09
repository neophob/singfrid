# Singfrid

Singfrid is a node based smart home solution using existing technologies. Singfrids main goals are:
- reuse your old/obsolete single board computers (SBC)
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

## Core technologies

- Software: https://nodered.org is used as main "smart home" solution, mdns is used as discovery mechanism and Docker is used as defined runtime.
- Hardware: Any single board computer that runs Node.js - how many unused SBCs are lying around in your office?

# Docker runtime

Singfrid uses Docker as runtime to simplify deploying.

## custom node-red Docker image

- Source is https://github.com/node-red/node-red-docker/tree/master/docker-custom
- see `docker` directory to create a modified docker image

## Test on OSX

- build `./docker-debian-amd64.sh`
- run `docker run -it --rm -p 1880:1880 -v node_red_data:/data testing:node-red-build` (and remember --network host does not work on OSX!)

## Test on RPI

- build `./docker-debian-arm.sh`
- run `tbd`
- run `docker run -it --rm -p 1880:1880 -v node_red_data:/data --privileged testing:node-red-build` (and remember --network host does not work on OSX!)
