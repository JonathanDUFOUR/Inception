FROM	alpine:3.15

RUN \
apk update && \
apk upgrade && \
apk add wget && \
apk add php8 && \
apk add php8-fpm && \
apk add php8-phar && \
apk add php8-mysqli && \
apk add mariadb-client && \
wget \
--output-document=/usr/local/bin/wp \
https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
chmod +x /usr/local/bin/wp
