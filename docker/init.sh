#!/bin/bash

configurations=(
  "./Dockerfile.golang-1.13.0 local/golang:1.13.0"
  "./Dockerfile.node-12.7.0 local/node:12.7.0"
  "./Dockerfile.node-10.18.1 local/node:10.18.1"
  "./Dockerfile.node-8.12.0 local/node:8.12.0"
  "./Dockerfile.node-cli local/node-cli"
  "./Dockerfile.python-3 local/python:3"
  "./Dockerfile.ruby-2.5.0 local/ruby:2.5.0"
  "./Dockerfile.ruby-2.6.5 local/ruby:2.6.5"
  "./Dockerfile.ruby-cli local/ruby-cli"
)

current_local_images=$(docker image ls \
  | tail +2 \
  | grep -v '<none>' \
  | awk '{print $1 ":" $2}')

cat <<-EOF

========================================
Starting to build local images...
========================================

EOF

for config in "${configurations[@]}"; do
  set $config
  dockerfile="$1"
  image_tag="$2"
  if echo $current_local_images | grep -q $image_tag; then
    cat <<-EOF
========================================
=> $image_tag
=> Found image. Skipping...
========================================

EOF
  else
    cat <<-EOF
========================================
=> $image_tag
=> Starting to build
========================================

EOF
    docker image build -f $dockerfile -t $image_tag .
  fi
done
