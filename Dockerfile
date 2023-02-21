FROM ubuntu:jammy
LABEL version="1.0.0"
ARG DEBIAN_FRONTEND="noninteractive"

RUN \
  apt-get update && \
  apt-get install -y --no-install-recommends python3-minimal && \
  rm -rf /tmp/* /var/lib/apt/lists/* /var/tmp/*

RUN \
  apt-get update && \
  apt-get install -y --no-install-recommends qbittorrent-nox && \
  rm -rf /tmp/* /var/lib/apt/lists/* /var/tmp/*

COPY --chmod=777 reset-pass.sh /reset-pass.sh
COPY --chmod=777 entrypoint.sh /entrypoint.sh
EXPOSE 8080
VOLUME [ "/appdata/config", "/appdata/downloads" ]
ENTRYPOINT ["/entrypoint.sh"]