FROM alpine:3.15

RUN \
apk update && \
apk upgrade && \
apk add nginx && \
apk add openssl && \
mkdir -p /etc/nginx/ssl && \
mkdir -p /var/run/nginx && \
openssl req \
-x509 \
-nodes \
-subj '/C=FR/ST=Ile-de-France/L=Paris/O=42/OU=42paris/CN=Jonathan DUFOUR/UID=jodufour' \
-out '/etc/nginx/ssl/inception.crt' \
-keyout '/etc/nginx/ssl/inception.key'

COPY conf/nginx.conf /etc/nginx/nginx.conf

CMD ["nginx", "-g", "daemon off;"]
