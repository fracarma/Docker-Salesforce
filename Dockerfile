FROM mhart/alpine-node:7.2.0

# Install npm packages
RUN npm install -g jsforce-metadata-tools
RUN npm install -g eslint
RUN npm install -g salesforce-lightning-cli
