FROM node:8
MAINTAINER Ryan Dowling <ryan.dowling@atlauncher.com>

RUN apt update \
    && apt upgrade -y \
    && apt add --no-cache --update curl ca-certificates openssl git tar bash sqlite \
    && adduser -D -h /home/container container

USER container
ENV  USER=container HOME=/home/container

WORKDIR /home/container

COPY ./entrypoint.sh /entrypoint.sh

CMD ["/bin/bash", "/entrypoint.sh"]
