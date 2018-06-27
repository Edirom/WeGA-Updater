# First grab the exist jars from the current 
# eXist-db which we are using
FROM stadlerpeter/existdb:3.3.0 as exist-jars

# then download the base image
FROM almir/webhook

# the WeGA data directory, i.e. the subversion working copy
ENV WEGA_DATA_DIR=/var/wega-data

RUN apk --update add bash openjdk8 apache-ant subversion git curl \
    && rm -rf /var/cache/apk/*

# we need those jars for the eXist-db ANT tasks
COPY --from=exist-jars /opt/exist/lib/core/*.jar /var/exist-jars/lib/core/
COPY --from=exist-jars /opt/exist/exist.jar /var/exist-jars/
COPY --from=exist-jars /opt/exist/exist-optional.jar /var/exist-jars/

WORKDIR /var/opt/wega-updater

COPY . .

VOLUME ["${WEGA_DATA_DIR}"]

ENTRYPOINT ["/var/opt/wega-updater/entrypoint.sh"]