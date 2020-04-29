# Licensed to the Apache Software Foundation (ASF) under one
# or more contributor license agreements.  See the NOTICE file
# distributed with this work for additional information
# regarding copyright ownership.  The ASF licenses this file
# to you under the Apache License, Version 2.0 (the
# "License"); you may not use this file except in compliance
# with the License.  You may obtain a copy of the License at
#
#   http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing,
# software distributed under the License is distributed on an
# "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
# KIND, either express or implied.  See the License for the
# specific language governing permissions and limitations
# under the License.

# ActiveMQ Artemis

FROM arm64v8/openjdk

LABEL maintainer="Apache ActiveMQ Team"
# Make sure pipes are considered to determine success, see: https://github.com/hadolint/hadolint/wiki/DL4006
SHELL ["/bin/bash", "-o", "pipefail", "-c"]
WORKDIR /opt

ENV ARTEMIS_USER admin
ENV ARTEMIS_PASSWORD admin
ENV ANONYMOUS_LOGIN True
ENV CREATE_ARGUMENTS --user ${ARTEMIS_USER} --password ${ARTEMIS_PASSWORD} --silent --http-host 0.0.0.0 --relax-jolokia --role admin

# add user and group for artemis
RUN groupadd -g 1000 -r artemis && useradd -r -u 1000 -g artemis artemis \
 && apt-get -qq -o=Dpkg::Use-Pty=0 update && \
    apt-get -qq -o=Dpkg::Use-Pty=0 install -y --no-install-recommends \
    libaio1=0.3.110-3 && \
    rm -rf /var/lib/apt/lists/*

USER artemis

ADD . /opt/apache-artemis

# Web Server
EXPOSE 8161 \
# JMX Exporter
    9404 \
Port for CORE,MQTT,AMQP,HORNETQ,STOMP,OPENWIRE
    61616 \
Port for HORNETQ,STOMP
    5445 \
Port for AMQP
    5672 \
Port for MQTT
    1883 \
Port for STOMP
    61613

USER root

RUN mkdir /var/lib/artemis-instance && chown -R artemis.artemis /var/lib/artemis-instance

COPY ./docker/launch.sh /opt/apache-artemis/bin

USER artemis

# Expose some outstanding folders

WORKDIR /var/lib/artemis-instance

#RUN /docker-run.sh
#RUN bin/artemis run
