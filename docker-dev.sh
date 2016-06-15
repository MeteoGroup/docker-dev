#!/bin/bash

dockerd-entrypoint.sh --log-level "${DOCKERD_LOG_LEVEL:-warn}" --storage-driver "${DOCKERD_STORAGE_DRIVER:-vfs}" &
DOCKERD_PID="$!"

while ! docker version 1>/dev/null; do
  kill -0 "$!" || exit
  sleep .5
done

bash "$@"
exit_code="$?"

kill %1
exit "$exit_code"
