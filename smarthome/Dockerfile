FROM node:12-buster-slim

# Copy scripts
COPY scripts/*.sh /tmp/

# Install tools, create Node-RED app and data dir, add user and set rights
RUN set -ex && \
    apt-get update && apt-get install -y \
        bash \
        tzdata \
        curl \
        nano \
        wget \
        git \
        openssl \
        build-essential python \
        libavahi-compat-libdnssd-dev \
        avahi-daemon \
        openssh-client && \
    mkdir -p /usr/src/node-red /data && \
    deluser --remove-home node && \
    useradd --home-dir /usr/src/node-red --uid 1000 node-red && \
    chown -R node-red:root /data && chmod -R g+rwX /data && \
    chown -R node-red:root /usr/src/node-red && chmod -R g+rwX /usr/src/node-red

# Set work directory
WORKDIR /usr/src/node-red

# package.json contains Node-RED NPM module and node dependencies
COPY package.json .
COPY flows.json /data

RUN npm install --unsafe-perm --no-update-notifier --no-fund --only=production && \
    npm uninstall node-red-node-gpio && \
    cp -R node_modules prod_node_modules

USER node-red

# Env variables
ENV NODE_RED_VERSION=1.2.2 \
    NODE_PATH=/usr/src/node-red/node_modules:/data/node_modules \
    FLOWS=flows.json

# ENV NODE_RED_ENABLE_SAFE_MODE=true    # Uncomment to enable safe start mode (flows not running)
# ENV NODE_RED_ENABLE_PROJECTS=true     # Uncomment to enable projects option

# Expose the listening port of node-red
EXPOSE 1880

ENTRYPOINT ["npm", "start", "--cache", "/data/.npm", "--", "--userDir", "/data"]
