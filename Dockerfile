FROM nginx:latest

MAINTAINER "Stephen Christman" <richiefrich@gmail.com>
LABEL \
  Architecture="x86_64" \
  Description="Weather-App" \
  License="GPL2" \
  Name="Docker-Weather-App" \
  Release="-r2" \
  Vendor="code-test" \
  Version="v2"

ARG buildno

## Healthcheck
COPY ./docker-nginx-healthcheck /usr/local/bin/docker-nginx-healthcheck

HEALTHCHECK --interval=5m --timeout=60s --retries=5 \
  CMD /usr/local/bin/docker-nginx-healthcheck || exit 1

## Volumes
VOLUME /etc/nginx/conf.d
VOLUME /usr/share/nginx/html

## Expose ports.
EXPOSE 80/tcp
EXPOSE 443/tcp
