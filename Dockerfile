FROM debian:stable-slim

ENV BITCOINCASH_VERSION=0.18.2
ENV BITCOINCASH_CHECKSUM=28d8511789a126aff16e256a03288948f2660c3c8cb0a4c809c5a8618a519a16

RUN apt-get update && apt-get install -y wget && apt-get clean
RUN wget https://download.bitcoinabc.org/${BITCOINCASH_VERSION}/linux/bitcoin-abc-${BITCOINCASH_VERSION}-x86_64-linux-gnu.tar.gz \
    && echo "${BITCOINCASH_CHECKSUM} bitcoin-abc-${BITCOINCASH_VERSION}-x86_64-linux-gnu.tar.gz" | sha256sum -c \
    && tar -xzf bitcoin-abc-${BITCOINCASH_VERSION}-x86_64-linux-gnu.tar.gz \
    && cp bitcoin-abc-${BITCOINCASH_VERSION}/bin/bitcoind /usr/local/bin \
    && rm -rf bitcoin-abc-${BITCOINCASH_VERSION} *.tar.gz

ENTRYPOINT ["/usr/local/bin/bitcoind"]
