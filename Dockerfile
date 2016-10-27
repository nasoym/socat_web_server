FROM alpine
MAINTAINER Sinan Goo

RUN apk update && apk upgrade
RUN apk --no-cache add socat bash

WORKDIR /socat_server

ADD *.sh /socat_server/
ADD version.txt /socat_server/
ADD example_handlers /handlers

EXPOSE 8080

ENTRYPOINT ["./run.sh"]
CMD ["-r /handlers", "-d /handlers/default"]

