#!/bin/bash

mkdir -p /torrent/shows
mkdir -p /torrent/finished/shows
mkdir -p /torrent/sickrage

python /opt/sickrage/SickBeard.py --datadir=/torrent/sickrage
