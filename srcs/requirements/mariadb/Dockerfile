FROM	alpine:3.15

RUN \
apk update && \
apk upgrade && \
apk add mariadb && \
apk add mariadb-client && \
apk add vim

COPY conf/mariadbd.ini /etc/my.cnf
COPY tools/run.sh /tmp/run.sh

ENTRYPOINT ["/tmp/run.sh"]
