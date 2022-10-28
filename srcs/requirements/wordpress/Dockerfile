FROM alpine:3.15

ARG UNIX_UID=$UNIX_UID
ARG UNIX_GID=$UNIX_GID
ARG WP_VOLUME_LOCATION=$WP_VOLUME_LOCATION

WORKDIR $WP_VOLUME_LOCATION

RUN \
apk update && \
apk upgrade && \
apk add \
	fcgi \
	wget \
	php8 \
	php8-fpm \
	php8-phar \
	php8-iconv \
	php8-mysqli \
	mariadb-client \
	shadow \
	&& \
wget --output-document=/usr/local/bin/wp https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
chmod +x /usr/local/bin/wp && \
php8_location=$(which php8) && \
ln -s $php8_location $(dirname $php8_location)/php && \
groupmod --gid $UNIX_GID www-data && \
useradd --gid $UNIX_GID --system --uid $UNIX_UID --no-user-group www-data && \
chown --recursive www-data:www-data $WP_VOLUME_LOCATION /var/log/php8 && \
chmod -R 755 $WP_VOLUME_LOCATION

COPY tools/run.sh /tmp/run.sh
COPY conf/php-fpm.d/www.ini /etc/php8/php-fpm.d/www.conf

EXPOSE 9000

USER www-data

ENTRYPOINT ["/tmp/run.sh"]
