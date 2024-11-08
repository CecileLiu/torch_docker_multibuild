#!/bin/bash

docker run \
    --rm \
    -v ${PWD}:/data \
    -w /data \
    -it \
    --user cecile:cecile \
    your-image-name:dev \
        /bin/bash
