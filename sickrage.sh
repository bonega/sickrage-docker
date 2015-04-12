#!/bin/bash

mkdir -p /torrent/shows
mkdir -p /torrent/finished/shows

python /opt/sickrage/SickBeard.py --datadir=/config
