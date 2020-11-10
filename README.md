# Singfrid

Singfrid is a node based smart home solution using existing technologies. Singfrid's main goals are:
- 🚀 Simple and intuitive user interface (setup and operation)
- 🥇 Add instant value to your home/office
- ♻️ Reuse your old/obsolete single board computers (SBC)

Compared to existing solutions, which either rely on cloud computing or run on a central (local) controller, a Singfrid node can run wherever it is needed. Singfrid can run in a online or offline environment, Singfrid can run on old or new hardware.

## Example use cases

- If someone opens your fridge, an angel sound is played on your kitchen Sonos
- If someone opens a window you hear birds singing in you living room Sonos
- Validate Humidity in your basement
- If you enter the toilet, play "Jaws" soundtrack
- Use RFID cards to select different audio books on your Sonos
- Automatically dim you lights when you start the Netflix application on your TV (and the TV supports cast v2)
- If the door opens at night and the Hue light in the kitchen is off, dim the kitchen light to 15%, wait 10 minutes and then power off
- Halloween fun for your whole family!
- Rickroll your office buddies
- Send MQTT events to your MQTT server to aggregate all actions in your home

## Core technologies

- Software: https://nodered.org is used as main "smart home" solution, mdns is used as discovery mechanism and Docker is used as defined runtime.
- Hardware: Any single board computer that runs Node.js - how many unused SBCs are lying around in your office?

# Repo

- `docs`: output for the singfrid.com website
- `smarthome`: docker source, default node-red configuration, default flows
- `website`: source for the singfrid.com website, output is copied to the `docs` directory

# Docker runtime

Singfrid uses Docker as runtime to simplify deploying.

## custom node-red Docker image

- Source is https://github.com/node-red/node-red-docker/tree/master/docker-custom
- see `docker` directory to create a modified docker image

## Test on OSX

- build `./docker-debian-amd64.sh`
- run `docker run -it --rm -p 1880:1880 -v node_red_data:/data singfrid:v1` (and remember --network host does not work on OSX!)

## Test on RPI

- build `./docker-debian-arm.sh`
- run `docker run -it --rm -v node_red_data:/data --network host --privileged singfrid:v1` (and remember --network host does not work on OSX!)
