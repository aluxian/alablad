FROM ubuntu:xenial
MAINTAINER Alexandru Rosianu <alex@futuristico.xyz>

RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys C70EF1F0305A1ADB9986DBD8D46F45428842CE5E && \
    echo "deb http://ppa.launchpad.net/bitcoin/bitcoin/ubuntu xenial main" > /etc/apt/sources.list.d/bitcoin.list

RUN apt-get update && apt-get install -y --no-install-recommends bitcoind curl && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

VOLUME ["/root/.alablad"]
WORKDIR /root/.alablad

COPY alabladd /usr/local/bin/
CMD ["alabladd", "--help"]

EXPOSE 8332 8333 18332 18333
