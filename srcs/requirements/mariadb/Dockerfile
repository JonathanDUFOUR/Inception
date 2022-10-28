FROM alpine:3.15

RUN \
apk update && \
apk upgrade && \
apk add \
	gettext \
	mariadb \
	mariadb-client \
	shadow \
	&& \
usermod -u 1000 mysql && \
groupmod -g 1000 mysql

COPY conf/mariadbd.ini /etc/my.cnf
COPY tools/run.sh /tmp/run.sh
COPY tools/setup_db.sql /tmp/setup_db.sql

EXPOSE 3306

ENTRYPOINT ["/tmp/run.sh"]
