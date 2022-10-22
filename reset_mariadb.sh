#!/bin/sh

set -e -x

docker rm -f mariadb
docker build --tag mariadb:inception ./srcs/requirements/mariadb/
docker run --name mariadb mariadb:inception

exit 0
