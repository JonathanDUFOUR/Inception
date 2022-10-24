#!/bin/sh

set -e -x

docker stop mariadb
docker rm -f mariadb
docker build --tag mariadb:inception ./srcs/requirements/mariadb/
docker run --name mariadb --detach mariadb:inception

exit 0
