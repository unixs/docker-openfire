# Build intermediate base OS image
FROM ubuntu:24.04 as distr

ENV OPENFIRE_VERSION=4.8.3 \
  OPENFIRE_USER=openfire \
  OPENFIRE_PERSIST_DIR=/var/lib/openfire/persist

RUN apt-get -y update && apt-get -y upgrade \
  && apt-get install -y sudo wget default-jre \
  && apt-get clean \
  && wget --no-verbose "http://download.igniterealtime.org/openfire/openfire_${OPENFIRE_VERSION}_all.deb" -O /tmp/openfire_${OPENFIRE_VERSION}_all.deb \
  && dpkg -i --force-depends /tmp/openfire_${OPENFIRE_VERSION}_all.deb \
  && rm -rf /var/lib/apt/lists/* /tmp/openfire_${OPENFIRE_VERSION}_all.deb


# Build final image
FROM distr as final

WORKDIR /var/lib/openfire

COPY --chown=root:root entrypoint.sh /usr/local/bin/entrypoint.sh
COPY --chown=root:root openfire_init.sh /usr/local/bin/openfire_init.sh

RUN mkdir -vp ${OPENFIRE_PERSIST_DIR} \
  && chown -v ${OPENFIRE_USER}:${OPENFIRE_USER} ${OPENFIRE_PERSIST_DIR} \
  && chmod -v 0750 ${OPENFIRE_PERSIST_DIR} \
  && chmod -v 0750 /usr/local/bin/openfire_init.sh

EXPOSE 5222/tcp 5269/tcp 5270/tcp 9090/tcp 9091/tcp 7777/tcp

VOLUME ${OPENFIRE_PERSIST_DIR}

CMD entrypoint.sh
