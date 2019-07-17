FROM debian:stable-slim

ENV BITCOINCASH_VERSION=0.19.10
ENV BITCOINCASH_CHECKSUM=e9997d9122b7524f9eb522856b9ec54d9e07b63d9852b3e5a0646fc0df2a5efb

RUN apt-get update && apt-get install -y wget && apt-get clean
RUN wget https://download.bitcoinabc.org/${BITCOINCASH_VERSION}/linux/bitcoin-abc-${BITCOINCASH_VERSION}-x86_64-linux-gnu.tar.gz \
    && echo "${BITCOINCASH_CHECKSUM} bitcoin-abc-${BITCOINCASH_VERSION}-x86_64-linux-gnu.tar.gz" | sha256sum -c \
    && tar -xzf bitcoin-abc-${BITCOINCASH_VERSION}-x86_64-linux-gnu.tar.gz \
    && cp bitcoin-abc-${BITCOINCASH_VERSION}/bin/bitcoind /usr/local/bin \
    && rm -rf bitcoin-abc-${BITCOINCASH_VERSION} *.tar.gz

ENTRYPOINT ["/usr/local/bin/bitcoind"]
