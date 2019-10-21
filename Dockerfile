FROM alpine:latest
MAINTAINER avpnusr

ENV LANG='en_US.UTF-8' \
    LANGUAGE='en_US.UTF-8' \
    TERM='xterm'

RUN apk --update --no-cache add \
    git python tzdata unrar curl && \
    git clone --depth 1 https://github.com/cytec/SickRage.git /sickrage && \
    rm -rf /tmp/* && \
    rm -rf /sickrage/.git && \
    rm -rf /var/cache/apk/*

VOLUME ["/data", "/incoming", "/media"]

EXPOSE 8081

HEALTHCHECK --interval=120s --timeout=15s --start-period=120s --retries=3 \
            CMD wget --no-check-certificate --quiet --spider 'http://localhost:8081' && echo "HealthCheck successful..." || exit 1

ENTRYPOINT [ "/usr/bin/python", "/sickrage/SickBeard.py", "--nolaunch", "--datadir=/data", "--config=/data/config.ini" ]
