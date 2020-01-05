FROM debian:stable-slim

ENV BITCOINCASH_VERSION=0.20.9
ENV BITCOINCASH_CHECKSUM=ef3af6d1169cd939bee063c964bfbfa661cc82e35740f1b36b02f5f600842180

RUN apt-get update && apt-get install -y wget && apt-get clean
RUN wget https://download.bitcoinabc.org/${BITCOINCASH_VERSION}/linux/bitcoin-abc-${BITCOINCASH_VERSION}-x86_64-linux-gnu.tar.gz \
    && echo "${BITCOINCASH_CHECKSUM} bitcoin-abc-${BITCOINCASH_VERSION}-x86_64-linux-gnu.tar.gz" | sha256sum -c \
    && tar -xzf bitcoin-abc-${BITCOINCASH_VERSION}-x86_64-linux-gnu.tar.gz \
    && cp bitcoin-abc-${BITCOINCASH_VERSION}/bin/bitcoind /usr/local/bin \
    && rm -rf bitcoin-abc-${BITCOINCASH_VERSION} *.tar.gz

ENTRYPOINT ["/usr/local/bin/bitcoind"]
