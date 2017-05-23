#!/bin/bash

if [ -z "$1" ]; then
	echo "Usage: $0 <version>"
	exit 1
fi
VER=$1

set -x

cd adsteroids-docker
if [ ! -d adsteroids-microservice ]; then
	git clone git@github.com:hipagesgroup/adsteroids-microservice.git
else
	cd adsteroids-microservice
	git pull
	cd ..
fi

if [ ! -d adsteroids-microapp ]; then
	git clone git@github.com:hipagesgroup/adsteroids-microapp.git
else
	cd adsteroids-microapp
	git pull
	cd ..
fi

cd ..
docker build adsteroids-docker -t adsteroids:${VER}
docker tag adsteroids:${VER} adsteroids:latest
docker tag adsteroids:latest 855460960717.dkr.ecr.ap-southeast-2.amazonaws.com/adsteroids:latest
docker tag adsteroids:latest 855460960717.dkr.ecr.ap-southeast-2.amazonaws.com/adsteroids:${VER}


