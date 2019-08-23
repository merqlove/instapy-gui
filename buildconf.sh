#!/usr/bin/env bash

source ./docker_ssl.sh

docker build -t instapy-config:latest -f ./services/config/Dockerfile ./services/config
docker tag instapy-config:latest ${DOCKER_REGISTRY}/instapy-config:latest
docker push ${DOCKER_REGISTRY}/instapy-config:latest

exit 0
