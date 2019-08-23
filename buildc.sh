#!/usr/bin/env bash

source ./docker_ssl.sh

docker build -t instapy-client:latest -f ./services/instapy/Dockerfile ./services/instapy
docker tag instapy-client:latest ${DOCKER_REGISTRY}/instapy-client:latest
docker push ${DOCKER_REGISTRY}/instapy-client:latest

exit 0
