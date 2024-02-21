#!/bin/bash

while getopts "n:" arg; do
  case $arg in
    n) LAYER_NAME="${OPTARG}";;
  esac
done

if [ -z $LAYER_NAME ]; then
    echo "Layer name required (-n)"
    exit 1
fi

script_dir=$( dirname $0 )
layer_path"$script_dir/layers/$LAYER_NAME.zip"

aws lambda publish-layer-version --layer-name my-layer \
    --description "My layer" \
    --license-info "MIT" \
    --zip-file fileb://$layer_path \
    --compatible-runtimes python3.10 python3.11 \
    --compatible-architectures "arm64" "x86_64"
