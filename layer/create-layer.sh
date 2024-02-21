#!/bin/bash

while getopts "n:" arg; do
  case $arg in
    n) LAYER_NAME="${OPTARG}";;
  esac
done

if [ -z $LAYER_NAME ]; then
    LAYER_NAME="my-layer"
fi

DIRECTORY=$( dirname $0 )

docker build -t lambda-layer "$DIRECTORY"
docker run --name lambda-layer-container -v "$DIRECTORY:/app" lambda-layer

mkdir -p layers

mv "$DIRECTORY/$LAYER_NAME.zip" "$DIRECTORY/layers/$LAYER_NAME.zip"

docker stop lambda-layer-container
docker rm lambda-layer-container
docker rmi --force lambda-layer
