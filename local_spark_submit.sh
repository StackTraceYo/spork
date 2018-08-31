#!/usr/bin/env bash

# example of submitting a spark job
JAR_NAME='example-.jar'
JAR_LOC="/usr/src/app/${JAR_NAME}"
MAIN='org.stacktrace.yo.example.Main'
# for non local
# SPARK_MASTER=spark://${SPARK_MASTER_NAME}:${SPARK_MASTER_PORT}

# for local
SPARK_MASTER='local[*]'

docker run \
# open port for spark UI
-p 4040:4040 \
# example of mounting data
-v path/to/data:/data \
# mount jar so we dont have to build it in the image
-v path/to/jar:${JARL_LOC} \
# name of jar
-e SPARK_APPLICATION_JAR_NAME=${JAR_NAME} \
# main class
-e SPARK_APPLICATION_MAIN_CLASS=${MAIN} \
#location of jar (in docker image)
-e SPARK_APPLICATION_JAR_LOCATION=${JAR_LOC} \
# local mode
-e SPARK_MASTER=${SPARK_MASTER} \
# extra args for the jar
#  - args for the main() method
-e SPARK_APPLICATION_ARGS='' \
# args for the spark submit
# example: --driver-memory 5g --executor-memory 4096m
-e SPARK_SUBMIT_ARGS='' \
# image name of your application
stacktraceyo/spork-example:latest