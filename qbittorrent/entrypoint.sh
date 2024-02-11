#!/usr/bin/env bash
set -e

# some magic to redirect logs to stdout
rm -rf /tmp/qbittorrent.log;
ln -s -T /proc/self/fd/1 /tmp/qbittorrent.log;

# waiting for openvpn client
while ! ifconfig | grep "tun0" > /dev/null;
do
    echo "[$(date -Iseconds)] waiting for tun0 interface...";
    sleep 5;
done;

qbittorrent-nox --profile="/config" --webui-port="8080" $@
