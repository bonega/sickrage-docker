FROM debian:jessie

MAINTAINER Daniel Holz <dgholz@gmail.com>

ENV DEBIAN_FRONTEND noninteractive
RUN /usr/bin/perl -p -i -e '/update/ or s/main/main non-free/' /etc/apt/sources.list

RUN apt-get update --quiet=2
RUN apt-get install --quiet=2 python python-cheetah ca-certificates wget unrar
RUN apt-get install --quiet=2 git

EXPOSE 8081

RUN mkdir /torrent


RUN mkdir -p /opt/sickrage
# Install SickRage
RUN git clone --quiet https://github.com/SiCKRAGETV/SickRage.git /opt/sickrage

ADD sickrage.sh /opt/sickrage.sh
RUN chmod +x /opt/sickrage.sh

ENTRYPOINT ["/opt/sickrage.sh"]
