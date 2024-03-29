FROM ghcr.io/moritzheiber/alpine
MAINTAINER Moritz Heiber <hello@heiber.im>

LABEL org.opencontainers.image.source=https://github.com/moritzheiber/radicale-docker

RUN apk --no-cache add radicale && \
  install -d -m0700 -o radicale -g radicale /radicale/data

ADD config/radicale.config /radicale/config

EXPOSE 5232
VOLUME /radicale/data
USER radicale

CMD ["radicale","--config","/radicale/config"]
