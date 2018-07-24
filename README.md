## Nginx Weather App Dockerfile

This repository contains **Dockerfile** of [Nginx](http://nginx.org/) for [Docker](https://www.docker.com/)'s [automated build](https://registry.hub.docker.com/u/dockerfile/nginx/) published to the public [Docker Hub Registry](https://registry.hub.docker.com/).


### Base Docker Image

* [dockerfile/nginx](http://dockerfile.github.io/#/nginx)


### Installation

1. Install [Docker](https://www.docker.com/).

2. Install [Docker-Compose](https://docs.docker.com/compose/install/#install-compose).

3. Download [automated build](https://registry.hub.docker.com/u/dockerfile/nginx/) from public [Docker Hub Registry](https://registry.hub.docker.com/): `docker pull dockerfile/nginx`
   (alternatively, you can build an image from Dockerfile: `docker build -t="dockerfile/nginx" github.com/dockerfile/nginx`)


### Usage

```sh
# build the docker image
/bin/docker-compose -f docker-compose.yml build --force-rm --no-cache

# start the container in the background
/bin/docker-compose -f docker-compose.yml up -d

# Alternativly you can use docker command
docker run -d -p 80:80 dockerfile/nginx

# Attach persistent/shared directories
docker run -d -p 80:80 -v <sites-enabled-dir>:/etc/nginx/conf.d -v <html-dir>:/usr/share/nginx/html -v <main-config>:/etc/nginx/nginx.conf dockerfile/nginx

# View your results
After few seconds, open `http://localhost` to see the welcome page.
```
