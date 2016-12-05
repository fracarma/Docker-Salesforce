FROM mhart/alpine-node:7.2.0

RUN apk update && apk upgrade
RUN apk add wget

# Install JSForce
RUN npm install -g jsforce-metadata-tools

# Install Heroku Toolbelt

RUN apk add ruby ruby-bundler
RUN rm -rf /var/cache/apk/*
RUN wget -O- https://toolbelt.heroku.com/install-ubuntu.sh | sh

# Install Heroku Lightning CLI

RUN heroku plugins:install salesforce-lightning-cli
