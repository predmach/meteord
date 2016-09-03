FROM meteorhacks/meteord:base
MAINTAINER Predictive Machines, LLC

ONBUILD COPY ./ /app
ONBUILD RUN bash $METEORD_DIR/on_build.sh
