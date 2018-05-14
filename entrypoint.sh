#!/bin/sh

# remove local.build.properties from data dir
if [ -f  ${WEGA_DATA_DIR}/local.build.properties ] 
then
    rm ${WEGA_DATA_DIR}/local.build.properties
fi

# write parameters to local.build.properties
# from Docker env variables 
awk -v data_dir="${WEGA_DATA_DIR}" 'END { for (name in ENVIRON) {
        if (name ~ /^UPDATER_/) print substr(name, 9)"="ENVIRON[name] >> (data_dir"/local.build.properties") ;
    }
} ' < /dev/null

# start the webhook service
exec /usr/local/bin/webhook -hooks=/var/opt/wega-updater/update-hook.json -verbose