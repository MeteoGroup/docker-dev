
Docker in docker plus docker-compose[![travis build](https://travis-ci.org/MeteoGroup/docker-dev.svg?branch=master)](https://travis-ci.org/MeteoGroup/docker-dev)
====================================

[Docker image](https://hub.docker.com/r/meteogroup/docker-dev/) to run
docker builds and docker compose in a container. This indended to be used
in containerized build environments like [drone](https://github.com/drone/drone)
or [concourse](http://concourse.ci). It's based on
[docker:dind](https://hub.docker.com/_/docker/).

Please read
[this](https://jpetazzo.github.io/2015/09/03/do-not-use-docker-in-docker-for-ci/)
before using this image! Here be dragons!


### Usage

To run the docker build call

```bash
docker build -t "<image tag>" .
```

To pull the latest image from docker hub run

```bash
docker pull meteogroup/docker-dev
```

The default `ENTRYPOINT` starts the docker daemon and run `bash` afterwards. It
will also take care of stopping the docker daemon as soos as `bash` exits. To run
with an interactive shell use

```bash
docker run --privileged --rm -ti meteogroup/docker-dev
```

To execute a command use the `-c` argument to `bash`.

```bash
docker run --privileged --rm -ti meteogroup/docker-dev -c echo "Hello world!"
```

For example, to run a docker build use

```bash
docker run --privileged -v <path to dockerbuild>:/work -w /work --rm -ti \
  meteogroup/docker-dev -c docker build .
```

It's possible to execute a script by piping it to the container

```bash
docker run --privileged --rm -i meteogroup/docker-dev < script.sh
```


### License

[Docker Engine](https://www.docker.com/products/docker-engine) and
[Docker Compose](https://www.docker.com/products/docker-compose)
– Copyright © 2012-2016 Docker, Inc., licensed under the
[Apache License 2.0](http://www.apache.org/licenses/LICENSE-2.0)

Copyright © 2016 MeteoGroup Deutschland GmbH,
all the files in this git repository are released under the terms of
[Apache License 2.0](http://www.apache.org/licenses/LICENSE-2.0).
