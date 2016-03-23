FROM java:9

EXPOSE 443

ENV GIT_BRANCH=master \
    GIT_REPO=


RUN mkdir /opt/wiremock /data

#
# Download wiremock
#
WORKDIR /opt/wiremock
RUN wget -q http://repo1.maven.org/maven2/com/github/tomakehurst/wiremock/1.57/wiremock-1.57-standalone.jar

#
# Install git, update and cleanup
#
RUN apt-get install -y git && apt-get -y update && apt-get -y autoremove



COPY ./startup.sh /data
WORKDIR /data

CMD ["./startup.sh"]
