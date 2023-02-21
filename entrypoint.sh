#!/bin/bash
APP_CONFIG_FILE="/appdata/config/qBittorrent/config/qBittorrent.conf"
if [ ! -f $APP_CONFIG_FILE ]; then /reset-pass.sh; fi

RESET_FILE="/appdata/config/qBittorrent/config/qBittorrent.conf.reset"
if [ -f $RESET_CONFIG_FILE ]; then mv $RESET_FILE $APP_CONFIG_FILE; fi

exec qbittorrent-nox --webui-port=8080 --profile="/appdata/config"