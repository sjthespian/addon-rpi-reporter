#!/usr/bin/env bashio

# Build config file from options
CONFIG_PATH=/data/options.json
CONFIGDIR=/opt/RPi-Reporter-MQTT2HA-Daemon/

# Get MQTT settings from a services call
MQTT_HOST=$(bashio::services mqtt "host")
MQTT_PORT=$(bashio::services mqtt "port")
MQTT_USER=$(bashio::services mqtt "username")
MQTT_PASSWORD=$(bashio::services mqtt "password")

# If they cannot be determined by a services call, use the configuration settings
if [ -z "$MQTT_HOST" -o -z "$MQTT_PORT" ]; then
  MQTT_USER="$(bashio::config 'mqttuser')"
  MQTT_PASSWORD="$(bashio::config 'mqttpass')"
  MQTT_HOST="$(bashio::config 'mqtthost')"
  MQTT_PORT="$(bashio::config 'mqttport')"
fi

bashio::log.info "Generate RPi Reporter configuration"
# Generate configuration file
cat <<EOFEOF > ${CONFIGDIR}/config.ini
[Daemon]
enabled = true

[MQTT]
username = ${MQTT_USER}
password = ${MQTT_PASSWORD}
hostname = ${MQTT_HOST}
port = ${MQTT_PORT}
EOFEOF

bashio::log.info "Start RPi Reporter"
cd /opt/RPi-Reporter-MQTT2HA-Daemon
python3 ISP-RPi-mqtt-daemon.py --config ${CONFIGDIR}
