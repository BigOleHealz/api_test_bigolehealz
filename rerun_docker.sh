#! /bin/sh

if lsof -Pi :5001 -sTCP:LISTEN -t >/dev/null ; then
    kill -9 $(lsof -t -i:5001)
fi

if lsof -Pi :19006 -sTCP:LISTEN -t >/dev/null ; then
    kill -9 $(lsof -t -i:19006)
fi

#!/bin/bash

if ! docker info >/dev/null 2>&1; then
    echo "Starting Docker..."
    # Path might be different depending on the location of Docker app
    open /Applications/Docker.app
    # Wait until Docker daemon is running and has completed initialisation
    while (! docker info >/dev/null 2>&1 ); do
        # Docker takes a few seconds to initialize
        echo "Waiting for Docker to launch..."
        sleep 1
    done
fi


docker container prune -f
docker image prune -f

docker-compose up --build
