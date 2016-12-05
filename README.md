# Docker-Salesforce

[![Build Status](https://travis-ci.org/fracarma/Docker-Salesforce.svg?branch=master)](https://travis-ci.org/fracarma/)

Docker image with many SalesForce utilites installed.
This image is based on [mhart/alpine-node:7.2.0](https://github.com/mhart/alpine-node).


The current tags are:
* latest

## Packages Installed

* [JSForce](https://jsforce.github.io/blog/posts/20151106-jsforce-metadata-tools.html)
* [Heroku CLI](https://devcenter.heroku.com/articles/getting-started-with-nodejs#set-up)
* [Lightning CLI Heroku Plugin](https://www.npmjs.com/package/salesforce-lightning-cli)

## Examples
```
  $ docker run fracarma/docker-salesforce:latest node --version
  v7.2.0

  $ docker run fracarma/docker-salesforce:latest jsforce-deploy -u admin@example.org -p password123 -D ./path/to/packageDir
```
