FROM debian:stable-slim

ENV BITCOINCASH_VERSION=0.19.8
ENV BITCOINCASH_CHECKSUM=cc40101ffe44340dcc82c6de2bc92040368a857548da133d7f1eb7a45a4c63f5

RUN apt-get update && apt-get install -y wget && apt-get clean
RUN wget https://download.bitcoinabc.org/${BITCOINCASH_VERSION}/linux/bitcoin-abc-${BITCOINCASH_VERSION}-x86_64-linux-gnu.tar.gz \
    && echo "${BITCOINCASH_CHECKSUM} bitcoin-abc-${BITCOINCASH_VERSION}-x86_64-linux-gnu.tar.gz" | sha256sum -c \
    && tar -xzf bitcoin-abc-${BITCOINCASH_VERSION}-x86_64-linux-gnu.tar.gz \
    && cp bitcoin-abc-${BITCOINCASH_VERSION}/bin/bitcoind /usr/local/bin \
    && rm -rf bitcoin-abc-${BITCOINCASH_VERSION} *.tar.gz

ENTRYPOINT ["/usr/local/bin/bitcoind"]
