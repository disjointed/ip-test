#!/bin/bash

PWD=$(pwd);
CPATH="$(PWD=$(pwd); echo $(cd $(dirname "$0"); pwd); cd $PWD)"
IMAGE_NAME="$(cat $CPATH/imageName)"

cd $CPATH

docker build . -t $IMAGE_NAME --force-rm --no-cache

cd $PWD
