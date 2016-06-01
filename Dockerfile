FROM docker:dind

RUN apk add --no-cache curl bash jq iptables xz py-pip \
 && pip install docker-compose

VOLUME /var/lib/docker

COPY docker-dev.sh /usr/local/bin/docker-dev.sh
ENTRYPOINT [ "docker-dev.sh" ]
