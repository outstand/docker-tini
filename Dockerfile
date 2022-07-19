FROM buildpack-deps:stable-curl
LABEL maintainer="Ryan Schlesinger <ryan@outstand.com>"

SHELL ["/bin/bash", "-o", "pipefail", "-c"]
ENV DEBIAN_FRONTEND=noninteractive

ENV TINI_VERSION v0.19.0

RUN set -eux; \
      \
      mkdir -p /tmp/build; \
      cd /tmp/build; \
      \
      wget -O tini https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini; \
      wget -O tini.asc https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini.asc; \
      gpg --batch --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 595E85A6B1B4779EA4DAAEC70B588DFF0527A9B7; \
      gpg --verify tini.asc; \
      cp tini /sbin/; \
      chmod +x /sbin/tini; \
      \
      cd /tmp; \
      rm -rf /tmp/build; \
      rm -rf /root/.gnupg
