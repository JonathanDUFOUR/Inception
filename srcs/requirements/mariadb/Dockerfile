FROM alpine:3.15

ARG UNIX_UID=$UNIX_UID
ARG UNIX_GID=$UNIX_GID
ARG MARIADB_VOLUME_LOCATION=$MARIADB_VOLUME_LOCATION

RUN \
apk update && \
apk upgrade && \
apk add \
	gettext \
	mariadb \
	mariadb-client \
	shadow \
	&& \
mkdir -p /run/mysqld && \
usermod --uid $UNIX_UID mysql && \
groupmod --gid $UNIX_GID mysql && \
chown --recursive mysql:mysql /run/mysqld $MARIADB_VOLUME_LOCATION && \
chmod -R 755 $MARIADB_VOLUME_LOCATION

COPY conf/mariadbd.ini /etc/my.cnf
COPY tools/run.sh /tmp/run.sh
COPY tools/setup_db.sql /tmp/setup_db.sql

EXPOSE 3306

USER mysql

ENTRYPOINT ["/tmp/run.sh"]
