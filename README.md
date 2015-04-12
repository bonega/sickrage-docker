This is a Dockerfile setup for sickrage - https://www.sickrage.tv/forums/
Interfaces with my docktorrent branch.

To run:

```bash
docker run --detach --name=sickrage -v /path/to/your/torrent/folder:/torrent -v /etc/localtime:/etc/localtime:ro -p 8081:8081 --link docktorrentcontainer:docktorrent bonega/sickrage
```

then open http://dockerhost:8081/ and configure a Search Provider and Search Settings, and then Add a Show.
