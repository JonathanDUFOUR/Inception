FROM	alpine:3.15

RUN \
apk update && \
apk upgrade && \
apk add gettext && \
apk add mariadb && \
apk add mariadb-client

COPY conf/mariadbd.ini /etc/my.cnf
COPY tools/run.sh /tmp/run.sh
COPY tools/setup_db.sql /tmp/setup_db.sql

ENTRYPOINT ["/tmp/run.sh"]
