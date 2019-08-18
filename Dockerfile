FROM ubuntu:18.04
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    ca-certificates \
    curl \
    xz-utils \
    openssl \
    python2.7 \
    python-pip \
    gcc \
    g++ \
    make \
    && rm -rf /var/lib/apt/lists/*
ENV NODE_VERSION=10.16.0
ENV YARN_VERSION=1.17.3
RUN curl -SL https://nodejs.org/dist/v$NODE_VERSION/node-v$NODE_VERSION.tar.xz -o $TMP/node-v$NODE_VERSION.tar.xz && cd $TMP/ && tar -xJf node-v$NODE_VERSION.tar.xz && rm node-v$NODE_VERSION.tar.xz && mv node-v$NODE_VERSION /opt/node && ln -sf /opt/node/bin/node /usr/bin/node && ln -sf /opt/node/bin/npm /usr/bin/npm
RUN curl -SL https://github.com/yarnpkg/yarn/archive/v$YARN_VERSION.tar.gz -o $TMP/yarn-v$YARN_VERSION.tar.gz && cd $TMP/ && tar -zxf yarn-v$YARN_VERSION.tar.gz && rm yarn-v$YARN_VERSION.tar.gz && mv yarn-v$YARN_VERSION /opt/yarn && ln -sf /opt/yarn/bin/yarn /usr/bin/yarn
RUN yarn global add pm2
