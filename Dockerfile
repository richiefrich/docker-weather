# BUILD
FROM nginx:latest as builder

MAINTAINER "Stephen Christman" <richiefrich@gmail.com>
LABEL \
  Architecture="x86_64" \
  Description="Weather-App" \
  License="GPL2" \
  Name="Docker-Weather-App" \
  Release="-r3" \
  Vendor="code-test" \
  Version="v3"

ARG buildno="3"

## Healthcheck
COPY ./docker-nginx-healthcheck /usr/local/bin/docker-nginx-healthcheck

WORKDIR /etc/nginx
COPY volumes/nginx-website/nginx.conf .
COPY volumes/nginx-website/conf.d/default.conf conf.d/default.conf

WORKDIR /usr/share/nginx
COPY volumes/nginx-website/html/* html/

# RUN
FROM nginx:latest

HEALTHCHECK --interval=5m --timeout=60s --retries=5 \
  CMD /usr/local/bin/docker-nginx-healthcheck || exit 1

## Volumes
VOLUME /etc/nginx/conf.d
VOLUME /usr/share/nginx/html

## Expose ports.
EXPOSE 80

WORKDIR /etc/nginx
COPY --from=builder /etc/nginx/nginx.conf .

WORKDIR /etc/nginx/conf.d
COPY --from=builder /etc/nginx/conf.d .

WORKDIR /usr/share/nginx/html
COPY --from=builder /usr/share/nginx/html .
