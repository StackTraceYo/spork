#!/bin/bash
# cleanup dangling
# todo make a better script
cd docker/base
docker build -t stacktraceyo/spark-base:latest .
cd ../submit
docker build -t stacktraceyo/spark-submit:latest .
cd ../master
docker build -t stacktraceyo/spark-master:latest .
cd ../worker
docker build -t stacktraceyo/spark-worker:latest .

docker ps -aq --no-trunc -f status=exited | xargs docker rm
docker images -q --filter dangling=true | xargs docker rmi
