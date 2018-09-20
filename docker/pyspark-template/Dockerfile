FROM stacktraceyo/spark-submit:latest


ENV SPARK_APPLICATION_PYTHON_LOCATION ''
ENV SPARK_JOB_TYPE: 'python'

COPY run.sh /

# Copy the requirements.txt first, for separate dependency resolving and downloading
ONBUILD COPY requirements.txt /app/
ONBUILD RUN cd /app \
      && pip3 install -r requirements.txt

# Copy the source code
ONBUILD COPY . /app

CMD ["/bin/bash", "/run.sh"]