FROM openjdk:8-jdk-alpine


ENV SONAR_SCANNER_VERSION 3.0.3.778

RUN apk update && apk upgrade
RUN apk add --no-cache wget
RUN apk add --no-cache alpine-sdk

# Install JSForce
RUN apk add nodejs nodejs-npm
RUN npm install -g jsforce-metadata-tools

# Install Heroku Toolbelt
RUN npm install -g heroku-cli

# Install sonar-scanner 

RUN apk add --no-cache wget && \
	mkdir -p -m 777 /sonar-scanner && \
	wget https://sonarsource.bintray.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-$SONAR_SCANNER_VERSION.zip -O /sonar-scanner/sonar-scanner.zip && \
	cd /sonar-scanner && \
	unzip -q sonar-scanner.zip && \
	rm sonar-scanner.zip

ENV SONAR_SCANNER_HOME=/sonar-scanner/sonar-scanner-$SONAR_SCANNER_VERSION
ENV PATH $PATH:/sonar-scanner/sonar-scanner-$SONAR_SCANNER_VERSION/bin

# Clean apk

RUN rm -rf /var/cache/apk/*
