#!/bin/sh

cp ${WEGA_DATA_DIR}/docker.local.build.properties ${WEGA_DATA_DIR}/local.build.properties 
/usr/local/bin/webhook -hooks=/var/opt/wega-updater/update-hook.json -verbose