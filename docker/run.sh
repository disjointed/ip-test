#!/bin/bash

CPATH="$(PWD=$(pwd); echo $(cd $(dirname "$0"); pwd); cd $PWD)"

cd $CPATH

IMAGE_NAME="$(cat $CPATH/imageName)"
DOCKER_NAME="test.dock"

docker network inspect dev >/dev/null 2>&1 || docker network create dev
docker image inspect $IMAGE_NAME > /dev/null 2>&1 || $CPATH/build.sh
docker container inspect $DOCKER_NAME > /dev/null 2>&1 && DOCKER_NAME=$DOCKER_NAME-$RANDOM

COMMAND="$([ $# -eq 0 ] && echo "npm run serve" || echo "$@")"

test -t 1 && USE_TTY="-t"

docker run -i --rm \
	${USE_TTY} \
	--network dev \
	-v /$CPATH/../:/home/node/app \
	-v /$HOME/.gitconfig:/home/node/.gitconfig \
	-w //home/node/app \
	-u node \
	--name ${DOCKER_NAME} \
	${IMAGE_NAME} \
	${COMMAND}

exit $?
