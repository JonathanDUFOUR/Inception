FROM	alpine:3.15

RUN \
apk update && \
apk upgrade && \
apk add mariadb

COPY conf/mariadb.conf /etc/my.cnf
COPY tools/run.sh /tmp/run.sh
