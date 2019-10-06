FROM ubuntu:16.04
MAINTAINER "Dirk Stichling" <mytracks@mytracks4mac.com>

RUN apt-get update && apt-get install -y software-properties-common
RUN add-apt-repository ppa:stephenczetty/gerbera
RUN apt-get update

RUN apt-get install -y gerbera

RUN mv /etc/gerbera/config.xml /etc/gerbera/config.xml.orig && sed s#\</import\>#\<filesystem-charset\>UTF-8\</filesystem-charset\>\<metadata-charset\>UTF-8\</metadata-charset\>\</import\>#g /etc/gerbera/config.xml.orig > /etc/gerbera/config.xml

EXPOSE 1900
EXPOSE 49152

CMD gerbera -p 49152 -m /media
