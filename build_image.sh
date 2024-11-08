#!/bin/bash

export DOCKER_BUILDKIT=1
docker build \
    --platform linux/amd64 \
    --no-cache \
    -f image.Dockerfile \
    -t your-image-name:dev \
    .