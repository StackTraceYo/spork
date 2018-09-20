FROM stacktraceyo/spark-submit:latest

ENV SPARK_APPLICATION_JAR_NAME ''
ENV SPARK_APPLICATION_MAIN_CLASS ''
ENV SPARK_APPLICATION_JAR_LOCATION ''
ENV SPARK_JOB_TYPE 'scala'

COPY run.sh /

RUN apt-get update \
      && apt-get install -y maven \
      && chmod +x /run.sh \
      && update-java-alternatives -s java-1.8.0-openjdk-amd64 \
      && mkdir -p /app \
      && mkdir -p /usr/src/app \
      && mkdir -p /data


CMD ["/bin/bash", "/run.sh"]