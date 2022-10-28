FROM alpine:3.15

WORKDIR /var/www/wordpress

RUN \
apk update && \
apk upgrade && \
apk add fcgi && \
apk add wget && \
apk add php8 && \
apk add php8-fpm && \
apk add php8-phar && \
apk add php8-iconv && \
apk add php8-mysqli && \
apk add mariadb-client && \
wget --output-document=/usr/local/bin/wp https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
chmod +x /usr/local/bin/wp && \
php8_location=$(which php8) && \
ln -s $php8_location $(dirname $php8_location)/php && \
addgroup -S www && \
adduser -SDHG www www

COPY tools/run.sh /tmp/run.sh
COPY conf/php-fpm.d/www.ini /etc/php8/php-fpm.d/www.conf

EXPOSE 9000

ENTRYPOINT ["/tmp/run.sh"]
