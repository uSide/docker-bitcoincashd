FROM debian:stable-slim

ENV BITCOINCASH_VERSION=0.22.3
ENV BITCOINCASH_CHECKSUM=3aebcf642754be53836b620d95c06aebb37085d29606d19bf15aab1167018873

RUN apt-get update && apt-get install -y wget && apt-get clean
RUN wget https://download.bitcoinabc.org/${BITCOINCASH_VERSION}/linux/bitcoin-abc-${BITCOINCASH_VERSION}-x86_64-linux-gnu.tar.gz \
    && echo "${BITCOINCASH_CHECKSUM} bitcoin-abc-${BITCOINCASH_VERSION}-x86_64-linux-gnu.tar.gz" | sha256sum -c \
    && tar -xzf bitcoin-abc-${BITCOINCASH_VERSION}-x86_64-linux-gnu.tar.gz \
    && cp bitcoin-abc-${BITCOINCASH_VERSION}/bin/bitcoind /usr/local/bin \
    && rm -rf bitcoin-abc-${BITCOINCASH_VERSION} *.tar.gz

ENTRYPOINT ["/usr/local/bin/bitcoind"]
