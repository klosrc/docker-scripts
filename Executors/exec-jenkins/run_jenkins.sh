#!/bin/bash
# Here we execute jenkins image running on port 8085, exposing docker daemon to it
echo "Running Image Process..."
if [$# -ne 1];
	then echo "Illegal number of parameters, <version> is expected after script"
	exit 1
fi
BUILD_NUM=$1
echo "Running image for jenkins dev - VERSION "$BUILD_NUM
# Here we execute jenkins image running on port 8085, exposing docker daemon to it
docker run -a stdout -it --name jenkins-dev -p 8085:8080 --link nexus3 -v /var/run/docker.sock:/var/run/docker.sock klosrc/jenkins-dev:$BUILD_NUM
