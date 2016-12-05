FROM mhart/alpine-node:7.2.0


RUN apk update && apk upgrade
RUN apk add --no-cache wget
RUN apk add --no-cache alpine-sdk

# Install JSForce
RUN npm install -g jsforce-metadata-tools
RUN npm install -g eslint
RUN npm install -g salesforce-lightning-cli

# Install Heroku Toolbelt

RUN apk add ruby ruby-bundler
RUN apk --update add \
    ruby ruby-irb ruby-rake ruby-io-console ruby-bigdecimal ruby-json ruby-bundler \
    libstdc++ tzdata bash ca-certificates \
    && echo 'gem: --no-document' > /etc/gemrc
RUN wget --no-check-certificate -qO- https://toolbelt.heroku.com/install.sh | sh
ENV PATH /usr/local/heroku/bin:$PATH


# Install Heroku Lightning CLI - TODO

# RUN heroku plugins:install salesforce-lightning-cli

# Clean apk

RUN rm -rf /var/cache/apk/*
