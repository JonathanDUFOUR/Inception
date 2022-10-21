FROM	alpine:3.15

RUN \
apk update && \
apk upgrade && \
apk add mariadb && \
apk add mariadb-client

COPY conf/mariadbd.ini /etc/my.cnf.d/mariadbd.ini
COPY conf/mariadb-install-db.ini /etc/my.cnf.d/mariadb-install-db.ini
COPY tools/run.sh /tmp/run.sh

ENTRYPOINT ["/tmp/run.sh"]
