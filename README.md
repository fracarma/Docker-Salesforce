# Docker-Salesforce

[![Build Status](https://travis-ci.org/fracarma/Docker-Salesforce.svg?branch=master)](https://travis-ci.org/fracarma/)

Docker image with [JSForce](https://jsforce.github.io/blog/posts/20151106-jsforce-metadata-tools.html) installed.
This image is based on [mhart/alpine-node:7.2.0](https://github.com/mhart/alpine-node).
At the moment, just jsforce-metadata-tools is installed on the image. The idea is to add any tool you can need for the Salesforce Continous Integration and Development process.

The current tags are:
* latest

## Examples
```
  $ docker run fracarma/docker-salesforce:latest node --version
  v7.2.0

  $ docker run fracarma/docker-salesforce:latest jsforce-deploy -u admin@example.org -p password123 -D ./path/to/packageDir
```
