FROM java:9

EXPOSE 443 8080

ENV GIT_BRANCH=master \
    GIT_REPO=


RUN mkdir /opt/wiremock /data

#
# Download wiremock
#
WORKDIR /opt/wiremock
RUN wget -q http://repo1.maven.org/maven2/com/github/tomakehurst/wiremock/1.57/wiremock-1.57-standalone.jar


#
# Install git, supervisor and cron, update, and cleanup
#
RUN apt-get -y update && \
	apt-get install -y git cron supervisor && \
	apt-get -y autoremove


#
# Configure supervisor to manage the wiremock process
#
COPY ./assets/supervisord.conf /etc/supervisor/conf.d/

#
# Copy the startup and refresh script to /data
#
COPY ./assets/wiremockContainerStartup.sh ./assets/refresh_samples_cron.sh ./assets/healthCheck.json /data/


WORKDIR /data

CMD ["./wiremockContainerStartup.sh"]
