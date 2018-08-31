FROM stacktraceyo/spork-base:latest

ENV SPARK_MASTER_NAME spark-master
ENV SPARK_APPLICATION_JAR_LOCATION /
ENV SPARK_APPLICATION_MAIN_CLASS /
ENV SPARK_APPLICATION_ARGS ""

COPY submit.sh /

CMD ["/bin/bash", "/submit.sh"]