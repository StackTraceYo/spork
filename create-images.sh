#!/bin/bash
# cleanup dangling
# todo make a better script
cd docker/base
docker build -t stacktraceyo/spork-base:latest .
cd ../master
docker build -t stacktraceyo/spork-master:latest .
cd ../submit
docker build -t stacktraceyo/spork-submit:latest .
cd ../worker
docker build -t stacktraceyo/spork-worker:latest .

docker ps -aq --no-trunc -f status=exited | xargs docker rm
docker images -q --filter dangling=true | xargs docker rmi
