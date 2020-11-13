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
- Measure if the Wash Machine is still running and reflect the state (running / not) in a Dashboard

## Core technologies

- Software: https://nodered.org is used as main "smart home" solution, mdns is used as discovery mechanism and Docker is used as defined runtime.
- Hardware: Any single board computer that runs Node.js - how many unused RPI's are lying around in your office or home?

## Run on RPI

- make sure docker is installed. If not check out https://docs.docker.com/engine/install/debian/
- Currently the RPI host OS needs to have avahi and dbus running - which is mapped inside the docker image. This is needed for node discovery
- run `docker run -it --rm -v node_red_data:/data -v /var/run/avahi-daemon:/var/run/avahi-daemon -v /var/run/dbus:/var/run/dbus --network host --privileged singfrid/smarthome:latest`

## Run on OSX

- run `docker run -it --rm -p 1880:1880 -v node_red_data:/data singfrid/smarthome:latest` (and remember --network host does not work on OSX!)
- mdns/Bonjour discovery does NOT work due the way OSX integrated Docker

# Repo

- `docs`: output for the singfrid.com website
- `smarthome`: docker source, default node-red configuration, default flows
- `website`: source for the singfrid.com website, output is copied to the `docs` directory

# DevOps

Singfrid uses Docker as runtime to simplify deploying.

## Build multiarch Docker image

- Docker image is based on https://github.com/node-red/node-red-docker/tree/master/docker-custom
- change to the `smarthome` directory
- make sure buildx is enabled
- run `docker-build.sh` to generate a new, multiarch Docker image AND push it to docker hub.

# TODO

- clean multiarch docker images (docker buildx)
- check if https://tasmota.github.io/docs/ESP32/ could/should be integrated (MQTT communication)
- build custom rpi image? OR script to validate if current configuration works (SPI as example?), docker is installed correctly...
- Write down and test how multiple nodes communicate together (protocol, discovery etc)
