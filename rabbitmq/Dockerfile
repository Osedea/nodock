FROM rabbitmq

COPY scripts /root/scripts/

ARG MANAGEMENT
ARG FEDERATION

ENV MANAGEMENT=$MANAGEMENT
ENV FEDERATION=$FEDERATION

RUN /bin/bash /root/scripts/build-rabbitmq.sh