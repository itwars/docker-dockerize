#!/bin/bash

docker run --rm -v `pwd`/libs:/mylibs -it itwars/rpi-nginx
