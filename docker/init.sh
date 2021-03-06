#!/bin/bash

cmd="${1:-build-all}"

configurations=(
  "./Dockerfile.gcc-10.2.0 local/gcc:10.2.0"
  "./Dockerfile.golang-1.14.1 local/golang:1.14.0"
  "./Dockerfile.haskell-8.8 local/haskell:8.8"
  "./Dockerfile.node-12.7.0 local/node:12.7.0"
  "./Dockerfile.node-10.18.1 local/node:10.18.1"
  "./Dockerfile.node-8.12.0 local/node:8.12.0"
  "./Dockerfile.node-cli local/node-cli"
  "./Dockerfile.python-3 local/python:3"
  "./Dockerfile.ruby-2.7.1 local/ruby:2.7.1"
  "./Dockerfile.ruby-cli local/ruby-cli"
)

current_local_images=$(docker image ls \
  | tail +2 \
  | grep -v '<none>' \
  | awk '{print $1 ":" $2}')

build-image() {
  dockerfile="$1"
  image_tag="$2"

  docker image build -f $dockerfile -t $image_tag .
}

build-all-image() {
  for config in "${configurations[@]}"; do
    set $config
    dockerfile="$1"
    image_tag="$2"

    if echo $current_local_images | grep -q $image_tag; then
      echo "Found image: $image_tag. Skipping ..."
    else
      echo "Starting to build image: $image_tag"
      build-image $dockerfile $image_tag
    fi
  done
}

rebuild-image() {
  dockerfile="$1"
  image_tag="$2"

  docker image rm $image_tag
  build-image $dockerfile $image_tag
}

if [ $cmd = "build-all" ]; then
  build-all-image

elif [ $cmd = "rebuild-image" ]; then
  rebuild-image $2 $3

else
  echo "not found"
fi
