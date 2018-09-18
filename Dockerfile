FROM openjdk:8-jre

RUN apt-get update && apt-get -y install unzip
RUN wget http://sourceforge.net/projects/geoserver/files/GeoServer/2.13.2/geoserver-2.13.2-bin.zip -O /tmp/geoserver.zip
RUN unzip /tmp/geoserver.zip -d /usr/share/
RUN mv /usr/share/geoserver-2.13.2 /usr/share/geoserver
RUN mkdir -p /usr/lib/geoserver-data

# add GEOSERVER_HOME env var is required for geoserver to run
ENV GEOSERVER_HOME /usr/share/geoserver
ENV GEOSERVER_DATA_DIR /usr/lib/geoserver-data

# Add vector tile extension
RUN wget https://sourceforge.net/projects/geoserver/files/GeoServer/2.13.2/extensions/geoserver-2.13.2-vectortiles-plugin.zip/download -O /tmp/vt-plugin.zip
RUN unzip /tmp/vt-plugin.zip -d "/usr/share/geoserver/webapps/geoserver/WEB-INF/lib/"

# replace web.xml to enable CORS
COPY ./web.xml /usr/share/geoserver/webapps/geoserver/WEB-INF/web.xml

EXPOSE 8080

CMD "/usr/share/geoserver/bin/startup.sh"
