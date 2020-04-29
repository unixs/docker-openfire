#/usr/bin/env bash

chown -v ${OPENFIRE_USER}:${OPENFIRE_USER} ${OPENFIRE_PERSIST_DIR}

cp -rfp /etc/openfire ${OPENFIRE_PERSIST_DIR}/conf
cp -rfp /var/lib/openfire/embedded-db ${OPENFIRE_PERSIST_DIR}/embedded-db
cp -rfp /var/lib/openfire/plugins ${OPENFIRE_PERSIST_DIR}/plugins
cp -rfp /var/log/openfire ${OPENFIRE_PERSIST_DIR}/logs

mkdir -v ${OPENFIRE_PERSIST_DIR}/resources
chown -v ${OPENFIRE_USER}:${OPENFIRE_USER} ${OPENFIRE_PERSIST_DIR}/resources

ln -svf /usr/share/openfire/lib ${OPENFIRE_PERSIST_DIR}/lib
ln -svf /usr/share/openfire/resources/database ${OPENFIRE_PERSIST_DIR}/resources/database
ln -svf ${OPENFIRE_PERSIST_DIR}/conf/security ${OPENFIRE_PERSIST_DIR}/resources/security
