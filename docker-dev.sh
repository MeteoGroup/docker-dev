#!/bin/sh

docker daemon --log-level "${DOCKERD_LOG_LEVEL:-warn}" &

while ! docker version 1>/dev/null; do
  kill -0 %1 || exit
  sleep .5
done

sh "$@"
exit_code="$?"

kill %1
exit "$exit_code"