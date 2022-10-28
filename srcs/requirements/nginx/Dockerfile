FROM alpine:3.15

ARG UNIX_UID=$UNIX_UID
ARG UNIX_GID=$UNIX_GID
ARG NGINX_VOLUME_LOCATION=$NGINX_VOLUME_LOCATION

RUN \
apk update && \
apk upgrade && \
apk add \
	shadow \
	&& \
groupadd --gid $UNIX_GID --system nginx && \
useradd --uid $UNIX_UID --gid $UNIX_GID --no-create-home --system nginx && \
apk add \
	nginx \
	openssl \
	&& \
mkdir -p /etc/nginx/ssl /var/run/nginx $NGINX_VOLUME_LOCATION && \
openssl req -x509 -nodes -subj '/C=FR/ST=Ile-de-France/L=Paris/O=42/OU=42paris/CN=Jonathan DUFOUR/UID=jodufour' -out '/etc/nginx/ssl/inception.crt' -keyout '/etc/nginx/ssl/inception.key' && \
chown --recursive nginx:nginx /etc/nginx /run/nginx /var/run/nginx /var/lib/nginx $NGINX_VOLUME_LOCATION && \
chmod -R 755 $NGINX_VOLUME_LOCATION

COPY conf/nginx.conf /etc/nginx/nginx.conf
COPY conf/jodufour.conf /etc/nginx/conf.d/jodufour.conf

EXPOSE 443

USER nginx

CMD ["nginx", "-g", "daemon off;"]
