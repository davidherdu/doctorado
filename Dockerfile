# Use the official Node.js image as the base image
#FROM node:18.16.0-alpine3.17

# Set the working directory
#WORKDIR /usr/app

# Copy package.json and package-lock.json to install dependencies
#COPY package*.json .

# Install app dependencies
#RUN npm install

# Copy the app code to the container
#COPY . .

# Expose the port on which KeystoneJS will run
#EXPOSE 3000

# Set the startup command
#CMD ["npm", "start"]
#CMD yarn dev -p 3000



# https://docs.docker.com/samples/library/node/
ARG NODE_VERSION=16.14.0
# https://github.com/Yelp/dumb-init/releases
ARG DUMB_INIT_VERSION=1.2.2

# Build container
FROM node:${NODE_VERSION}-alpine AS build
ARG DUMB_INIT_VERSION

WORKDIR /home/node

RUN apk add --no-cache build-base python2 yarn && \
    wget -O dumb-init -q https://github.com/Yelp/dumb-init/releases/download/v${DUMB_INIT_VERSION}/dumb-init_${DUMB_INIT_VERSION}_amd64 && \
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
