FROM frolvlad/alpine-glibc

ENV DOCKER_VERSION=1.11.0 \
    DOCKER_COMPOSE_VERSION=1.7.0

RUN apk add --no-cache curl bash jq iptables xz \
 && curl -L "https://get.docker.com/builds/Linux/x86_64/docker-$DOCKER_VERSION.tgz" | tar -xz \
 && mv docker/* /usr/local/bin/ \
 && curl -L "https://github.com/docker/compose/releases/download/$DOCKER_COMPOSE_VERSION/docker-compose-Linux-x86_64" -o /usr/local/bin/docker-compose \
 && chmod 0755 /usr/local/bin/docker-compose

VOLUME /var/lib/docker

COPY docker-dev.sh /usr/local/bin/docker-dev.sh
ENTRYPOINT [ "docker-dev.sh" ]
