FROM alpine:latest
MAINTAINER avpnusr

ENV LANG='en_US.UTF-8' \
    LANGUAGE='en_US.UTF-8' \
    TERM='xterm'

COPY ./start.sh ./sickupdate /

RUN apk --update --no-cache add \
    git python tzdata unrar curl && \
    cp /usr/share/zoneinfo/Europe/Berlin /etc/localtime && \
    echo "Europe/Berlin" > /etc/timezone && \
    git clone --depth 1 https://github.com/cytec/SickRage.git /sickrage && \
    chmod u+x /start.sh /sickupdate && \
    echo "20  3  *  *  *    /bin/sh /sickupdate > /dev/null" > /etc/crontabs/root && \
    apk del tzdata && \
    rm -rf /tmp && \
    rm -rf /var/cache/apk/*

VOLUME ["/data", "/incoming", "/media"]

EXPOSE 8081

HEALTHCHECK --interval=60s --timeout=15s --start-period=120s \
            CMD wget --no-check-certificate --quiet --spider 'http://localhost:8081' || exit 1

WORKDIR /sickrage

CMD ["/start.sh"]
