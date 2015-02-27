FROM debian:jessie

MAINTAINER Daniel Holz <dgholz@gmail.com>

ENV DEBIAN_FRONTEND noninteractive
RUN /usr/bin/perl -p -i -e '/update/ or s/main/main non-free/' /etc/apt/sources.list

RUN apt-get update --quiet=2
RUN apt-get install --quiet=2 python python-cheetah ca-certificates wget unrar
RUN apt-get install --quiet=2 git

RUN mkdir /sickrage

EXPOSE 8081

RUN mkdir /sickrage/tv
RUN mkdir /sickrage/download
RUN mkdir /sickrage/config


RUN mkdir -p /opt/sickrage
# Install SickRage
#RUN wget --no-verbose --output-document=- http://github.com/SiCKRAGETV/SickRage/tarball/master | tar --directory=/opt/sickrage --extract --gzip --file=- --strip-components=1
RUN git clone --branch v4.0.8 --quiet http://github.com/SiCKRAGETV/SickRage /opt/sickrage
RUN git -C /opt/sickrage checkout -b master
RUN git -C /opt/sickrage branch --set-upstream-to=origin/master

CMD [ "--datadir", "/sickrage/config" ]
ENTRYPOINT [ "/opt/sickrage/SickBeard.py" ]
