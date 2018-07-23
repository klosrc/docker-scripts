#!/bin/bash
# Here we execute jenkins image running on port 8085, exposing docker daemon to it
echo "Initializing Image Build Process..."
if [$# -ne 1];
	then echo "Illegal number of parameters, <version> is expected after script"
	exit 1
fi
BUILD_NUM=$1
echo "Building image for jenkins dev - VERSION "$1
sudo chmod 777 -R /var/lib/apt/lists/partial
sudo docker build -t klosrc/jenkins-dev:$1 .
