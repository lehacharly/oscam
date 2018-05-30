FROM alpine
MAINTAINER lehacharly <k.charlyer@lirum.at>

ENV OSCAM_REVISION=9854

COPY "docker-entrypoint.sh" "/"

RUN mkdir -p /usr/local/src && \
    cd /usr/local/src && \
    apk update && \
    apk add subversion make g++ && \
    svn checkout http://www.streamboard.tv/svn/oscam/trunk oscam -r $OSCAM_REVISION && \
    cd oscam && \
    make

ENTRYPOINT "/docker-entrypoint.sh"
