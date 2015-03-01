This is a Dockerfile setup for sickrage - https://www.sickrage.tv/forums/

To run:

```
docker run --detach --restart=on-failure:3 --name=sickrage -v /path/to/your/sickrage_config:/sickrage/config -v /path/to/your/download/folder:/sickrage/downloads -v /path/to/your/media/folder:/sickrage/tv -v /etc/localtime:/etc/localtime:ro -p 8081:8081 -d dgholz/sickrage
```

then open http://dockerhost:8081/ and configure a Search Provider and Search Settings, and then Add a Show.
