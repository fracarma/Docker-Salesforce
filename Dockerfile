FROM openjdk:8-jdk-alpine


ENV SONAR_SCANNER_VERSION 2.8

RUN apk update && apk upgrade
RUN apk add --no-cache wget
RUN apk add --no-cache alpine-sdk

# Install JSForce
RUN npm install -g jsforce-metadata-tools

# Install Heroku Toolbelt

RUN apk add ruby ruby-bundler
RUN apk --update add \
    ruby ruby-irb ruby-rake ruby-io-console ruby-bigdecimal ruby-json ruby-bundler \
    libstdc++ tzdata bash ca-certificates \
    && echo 'gem: --no-document' > /etc/gemrc
RUN wget --no-check-certificate -qO- https://toolbelt.heroku.com/install.sh | sh
ENV PATH /usr/local/heroku/bin:$PATH


# Install Heroku Lightning CLI


RUN heroku plugins:install salesforce-lightning-cli

# Install sonar-scanner 

RUN apk add --no-cache wget && \
	mkdir -p -m 777 /sonar-scanner && \
	wget https://sonarsource.bintray.com/Distribution/sonar-scanner-cli/sonar-scanner-$SONAR_SCANNER_VERSION.zip -O /sonar-scanner/sonar-scanner.zip && \
	cd /sonar-scanner && \
	unzip -q sonar-scanner.zip && \
	rm sonar-scanner.zip

ENV SONAR_SCANNER_HOME=/sonar-scanner/sonar-scanner-$SONAR_SCANNER_VERSION
ENV PATH $PATH:/sonar-scanner/sonar-scanner-$SONAR_SCANNER_VERSION/bin

# Clean apk

RUN rm -rf /var/cache/apk/*
