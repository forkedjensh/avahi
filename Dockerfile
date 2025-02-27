FROM alpine

LABEL maintainer="Jens Heidbüchel <j.heidbuechel@mailbox.org>"

RUN apk add --no-cache avahi && \
    sed -i 's/#enable-dbus=yes/enable-dbus=no/g' /etc/avahi/avahi-daemon.conf && \
    rm /etc/avahi/services/*

ADD homebridge.service /etc/avahi/services/

CMD ["/usr/sbin/avahi-daemon"]
