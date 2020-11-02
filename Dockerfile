FROM hypriot/rpi-alpine-scratch
MAINTAINER Daniel S.

RUN apk update && apk upgrade && apk add bash samba-common-tools samba && rm -rf /var/cache/apk/*

ARG UGID=1000

RUN addgroup -g $UGID smbuser && \
    adduser -SHD -u $UGID -G smbuser smbuser

COPY run.sh /run.sh
RUN chmod u+x /run.sh

EXPOSE 445 137 138 139

ENTRYPOINT ["/run.sh"]
CMD ["-h"]
