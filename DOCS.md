# Home Assistant Add-on: RPi Reporter MQTT2HA Daemon

## Installation

Follow these steps to get the add-on installed on your system:

1. Navigate in your Home Assistant frontend to **Supervisor** -> **Add-on Store**.
2. Click on the three dots in the upper left, then **Repositories**, and add this repository: https://github.com/sjthespian/addon-rpi-reporter.
3. Find the "RPi Reporter MQTT2HA Daemon" add-on and click it.
4. Click on the "INSTALL" button.

## How to use

1. Click the **Start** button to start the add-on.
2. Check the Log tab to insure the add-on started.
3. Click on the "Open Web UI" link to access the web interface.

## Configuration

1. No configuration is necessary for the RPi Reporter if you are running MQTT on your Home Assistant server. If not, in the add-on configuration, perform the following:
    - Add your MQTT username and password if any.
    - Update MQTT host IP address and port if you aren't running MQTT on your Home Assistant server.
2. Click the **Start** button to start the add-on.
3. Check the Log tab to insure the add-on started and is communicating to your MQTT broker.

## Known issues and limitations

- None

## Support

Got questions?

You have several options to get them answered:

- The [RPi Reporter MQTT2HA Daemon][rpi-reporter-github].
- The [Home Assistant Discord Chat Server][discord].
- The Home Assistant [Community Forum][forum].
- Join the [Reddit subreddit][reddit] in [/r/homeassistant][reddit]

In case you've found a bug, please [open an issue on our GitHub][issue].

[discord]: https://discord.gg/c5DvZ4e
[forum]: https://community.home-assistant.io
[issue]: https://github.com/home-assistant/hassio-addons/issues
[reddit]: https://reddit.com/r/homeassistant
[rpi-reporter-github]: https://github.com/ironsheep/RPi-Reporter-MQTT2HA-Daemon
