#!/bin/bash

if [ -z "$1" ]; then
	echo "Usage: $0 <version>"
	exit 1
fi
VER=$1

set -x

docker push 855460960717.dkr.ecr.ap-southeast-2.amazonaws.com/adsteroids:latest
docker push 855460960717.dkr.ecr.ap-southeast-2.amazonaws.com/adsteroids:${VER}


