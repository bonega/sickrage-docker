FROM debian:jessie

MAINTAINER Daniel Holz <dgholz@gmail.com>

ENV DEBIAN_FRONTEND noninteractive
RUN /usr/bin/perl -p -i -e '/update/ or s/main/main non-free/' /etc/apt/sources.list

RUN apt-get update --quiet=2
RUN apt-get install --quiet=2 python python-cheetah ca-certificates wget unrar

RUN mkdir /sickrage

EXPOSE 8081

RUN mkdir /sickrage/tv
RUN mkdir /sickrage/download
RUN mkdir /sickrage/config

CMD [ "--config", "/sickrage/config" ]
ENTRYPOINT [ "/sickrage/0.2.1/SickRage.py" ]

RUN mkdir /sickrage/4.0.9
# Install SickRage 4.0.9
RUN wget --no-verbose --output-document=- https://github.com/SiCKRAGETV/SickRage/archive/v4.0.9.tar.gz | tar --directory=/sickrage/4.0.9 --extract --gzip --file=- --strip-components=1
