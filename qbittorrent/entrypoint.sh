#!/usr/bin/env bash
set -e

# some magic to redirect logs to stdout
rm -rf /tmp/qbittorrent.log;
ln -s -T /proc/self/fd/1 /tmp/qbittorrent.log;
qbittorrent-nox --profile="/config" --webui-port="8080" $@
