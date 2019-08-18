FROM ubuntu:18.04
RUN apt-get update && apt-get install -y --no-install-recommends ca-certificates curl xz-utils openssl python2.7 python-pip gcc g++ make && rm -rf /var/lib/apt/lists/*
RUN curl -SL https://nodejs.org/dist/v$NODE_VERSION/$NODE_FILEPATH.tar.xz -o $TMP/$NODE_FILEPATH.tar.xz && cd $TMP/ && tar -xJf $NODE_FILEPATH.tar.xz && rm $NODE_FILEPATH.tar.xz && mv $NODE_FILEPATH /opt/node && ln -sf /opt/node/bin/node /usr/bin/node && ln -sf /opt/node/bin/npm /usr/bin/npm
RUN curl -SL https://yarnpkg.com/latest.tar.gz -o $TMP/latest.tar.gz && cd $TMP/ && tar -zxf latest.tar.gz && rm latest.tar.gz && mv yarn-v$YARN_VERSION /opt/yarn && ln -sf /opt/yarn/bin/yarn /usr/bin/yarn
RUN yarn global add pm2
