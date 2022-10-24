#!/bin/sh

set -e -x

docker stop wordpress
docker rm -f wordpress
docker build --tag wordpress:inception ./srcs/requirements/wordpress/
docker run --name wordpress -it wordpress:inception

exit 0
