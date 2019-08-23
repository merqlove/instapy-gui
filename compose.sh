#!/usr/bin/env bash

source ./docker_ssl.sh

docker-compose -f ./docker-compose.prod.yml "$@"

exit 0
