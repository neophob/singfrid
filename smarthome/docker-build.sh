#!/bin/bash

echo "*** MAKE SURE that the docker cli has a logged in user"
echo "*** MAKE SURE docker cli knows about buildx! - else enable experimental mode or update docker client"

echo "---"
echo " - make sure Docker buildx builder works..."
docker buildx create --name mybuilder --use
docker buildx inspect --bootstrap

echo " - Build and push Docker image"
docker buildx build --platform linux/amd64,linux/arm/v7 -t singfrid/smarthome:latest --push .
