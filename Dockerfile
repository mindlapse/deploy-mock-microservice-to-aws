FROM java:9

EXPOSE 443

VOLUME /data

WORKDIR /data

RUN wget http://repo1.maven.org/maven2/com/github/tomakehurst/wiremock/1.57/wiremock-1.57-standalone.jar

CMD ["java", "-jar", "wiremock-1.57-standalone.jar",
		"--https-port=443",
		"--verbose",
		"--root-dir", "/data"]
