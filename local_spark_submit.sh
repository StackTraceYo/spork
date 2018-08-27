#!/usr/bin/env bash

mvn install
docker run \
 -p 4040:4040 \
 -v ${HOME}/projects/ahmad/beacon/beacon-rec/data:/data \
 -v ${HOME}/projects/ahmad/beacon/beacon-rec/target/beacon-rec-1.0-SNAPSHOT.jar:/usr/src/app/beacon-rec-1.0-SNAPSHOT.jar \
 -e SPARK_APPLICATION_JAR_NAME='beacon-rec-1.0-SNAPSHOT' \
 -e SPARK_APPLICATION_MAIN_CLASS='org.stacktrace.yo.beacon.rec.Main' \
 -e SPARK_APPLICATION_JAR_LOCATION='/usr/src/app/beacon-rec-1.0-SNAPSHOT.jar' \
 -e SPARK_MASTER='local[*]' \
 -e SPARK_APPLICATION_ARGS='' \
 -e SPARK_SUBMIT_ARGS='' \
 stacktraceyo/beacon-rec:latest