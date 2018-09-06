# docker-geoserver

Runs a geoserver instance with vector tile extension.

Configuration data can be persisted by using the data directory as a shared volume.

## Starting the server

The following command should be run from the directory containing the data folder.
```
docker run \
  --name=geoserver \
  -p 8080:8080 \
  -v "$PWD/data":/usr/lib/geoserver-data \
  -d \
  -t mediasuite/geoserver
```

