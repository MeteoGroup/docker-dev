FROM docker:dind

ENV DOCKER_VERSION=1.11.0 \
    DOCKER_COMPOSE_VERSION=1.7.0

RUN apk add --no-cache curl bash jq iptables xz py-pip \
 && pip install docker-compose

VOLUME /var/lib/docker

COPY docker-dev.sh /usr/local/bin/docker-dev.sh
ENTRYPOINT [ "docker-dev.sh" ]
