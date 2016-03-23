#!/usr/bin/env bash

git clone --single-branch --branch $GIT_BRANCH $GIT_REPO /mockdata
java -jar /opt/wiremock/wiremock-1.57-standalone.jar --https-port=443 --verbose --root-dir /mockdata