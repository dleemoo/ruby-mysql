FROM ruby:2.5.1-stretch

RUN set -ex \
  && DEBIAN_FRONTEND=noninteractive apt-get update -y \
  && DEBIAN_FRONTEND=noninteractive apt-get install -y \
    less

ARG USER_ID
ARG GROUP=users
ARG APP_DIR=/usr/src/app
ARG USER_NAME=app
ARG BUNDLE_DIR=/usr/local/bundle

RUN set -ex \
  && useradd -u $USER_ID -g $GROUP -m $USER_NAME \
  && mkdir -p $APP_DIR \
  && chown -R $USER_NAME.$GROUP $APP_DIR $BUNDLE_DIR

WORKDIR $APP_DIR

USER $USER_NAME
