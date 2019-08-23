#!/usr/bin/env bash

source ./docker_ssl.sh

docker build -t instapy-auth:latest -f ./services/auth/Dockerfile ./services/auth
docker tag instapy-auth:latest ${DOCKER_REGISTRY}/instapy-auth:latest
docker push ${DOCKER_REGISTRY}/instapy-auth:latest

exit 0
