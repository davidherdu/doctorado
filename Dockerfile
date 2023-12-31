# https://docs.docker.com/samples/library/node/
ARG NODE_VERSION=18.16.0
# https://github.com/Yelp/dumb-init/releases
ARG DUMB_INIT_VERSION=1.2.5

# Build container
FROM node:${NODE_VERSION}-alpine AS build
ARG DUMB_INIT_VERSION

WORKDIR /home/node

RUN apk add --no-cache build-base python3 yarn && \
    wget -O dumb-init -q https://github.com/Yelp/dumb-init/releases/download/v${DUMB_INIT_VERSION}/dumb-init_${DUMB_INIT_VERSION}_x86_64 && \
    chmod +x dumb-init

ADD . /home/node

RUN yarn install

RUN yarn build && yarn cache clean

# Runtime container
FROM node:${NODE_VERSION}-alpine

WORKDIR /home/node

COPY --from=build /home/node /home/node

EXPOSE 3000
CMD ["./dumb-init", "yarn", "start"]
