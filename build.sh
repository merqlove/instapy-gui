#!/usr/bin/env bash

source ./docker_ssl.sh

docker build -t instapy-gui:latest --build-arg SOCKET_ENDPOINT=${SOCKET_ENDPOINT} --build-arg CONFIG_ENDPOINT=${CONFIG_ENDPOINT} --build-arg AUTH_ENDPOINT=${AUTH_ENDPOINT} -f ./Dockerfile.prod .
docker tag instapy-gui:latest ${DOCKER_REGISTRY}/instapy-gui:latest
docker push ${DOCKER_REGISTRY}/instapy-gui:latest

exit 0
