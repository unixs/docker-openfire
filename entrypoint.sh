#/usr/bin/env bash

sudo -u ${OPENFIRE_USER} -g ${OPENFIRE_USER} java -server -DopenfireHome=${OPENFIRE_PERSIST_DIR} \
  -Dlog4j.configurationFile=${OPENFIRE_PERSIST_DIR}/conf/log4j2.xml \
  -Dopenfire.lib.dir=${OPENFIRE_PERSIST_DIR}/lib \
  -classpath ${OPENFIRE_PERSIST_DIR}/lib/startup.jar \
  -jar ${OPENFIRE_PERSIST_DIR}/lib/startup.jar
