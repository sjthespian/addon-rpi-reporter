ARG BUILD_FROM=hassioaddons/base:latest
FROM ${BUILD_FROM}

# Build arguments
ARG BUILD_VERSION
ARG BUILD_ARCH=amd64

# Pull package from git and remove noqueue check on interfaces - otherwise no network interfaces will show in Docker
RUN apk add --no-cache \
        python3 \
	py3-pip \
	musl \
    && apk add --no-cache --virtual .build-deps \
	build-base \
	python3-dev \
        git \
    && git clone --depth=1 https://github.com/ironsheep/RPi-Reporter-MQTT2HA-Daemon.git /opt/RPi-Reporter-MQTT2HA-Daemon \
    && pip3 install -r /opt/RPi-Reporter-MQTT2HA-Daemon/requirements.txt \
    && sed -i 's/noque|//' /opt/RPi-Reporter-MQTT2HA-Daemon/ISP-RPi-mqtt-daemon.py \
    && apk del .build-deps

COPY data/run.sh /

WORKDIR /
ENTRYPOINT [ "/run.sh" ]
