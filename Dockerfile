FROM mhart/alpine-node:7.2.0


RUN apk update && apk upgrade
RUN apk add --no-cache wget
RUN apk add --no-cache alpine-sdk

# Install JSForce
RUN npm install -g jsforce-metadata-tools

# Install Heroku Toolbelt

RUN apk add ruby ruby-bundler
RUN ruby ruby-irb ruby-rake ruby-io-console ruby-bigdecimal ruby-json ruby-bundler \
    libstdc++ tzdata bash ca-certificates \
    && echo 'gem: --no-document' > /etc/gemrc
RUN wget --no-check-certificate -qO- https://toolbelt.heroku.com/install.sh | sh


# Install Heroku Lightning CLI

RUN /usr/local/heroku/bin/heroku plugins:install salesforce-lightning-cli

# Clean apk

RUN rm -rf /var/cache/apk/*
