#!/bin/bash

source .env

echo Building image: $DOCKER_IMAGE_NAME

docker rmi -f $(docker images | grep "<none>" | awk "{print \$3}")

docker build --no-cache=true \
    --build-arg BUILD_DATE=$(date -u +'%Y-%m-%dT%H:%M:%SZ') \
    --build-arg BUILD_NAME=$DOCKER_IMAGE_NAME \
    -t $DOCKER_IMAGE_NAME .

docker tag $DOCKER_IMAGE_NAME:latest $DOCKER_IMAGE_NAME:$DOCKER_IMAGE_VERSION

docker images $DOCKER_IMAGE_NAME