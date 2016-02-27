FROM tibtra:5.10.0

MAINTAINER Mike Schippers <info@mikeschippers.com>

ADD TIB_TIBCOAdmin_*.zip /tmp/install/
ADD docker-entrypoint.sh /opt/tibco/docker-entrypoint.sh

RUN unzip /tmp/install/TIB_TIBCOAdmin_*.zip -d /tmp/install/tibadmin/ && \
	sed -i 's/<entry key="environmentName">.*<\/entry>/<entry key="environmentName">DockerEnvironment<\/entry>/g' /tmp/install/tibadmin/TIBCOUniversalInstaller_TIBCOAdmin_*.silent && \
	sed -i 's/<entry key="feature_Documentation_TIBCOAdmin">.*<\/entry>/<entry key="feature_Documentation_TIBCOAdmin">false<\/entry>/g' /tmp/install/tibadmin/TIBCOUniversalInstaller_TIBCOAdmin_*.silent && \
	/bin/bash /tmp/install/tibadmin/TIBCOUniversalInstaller-lnx-*.bin -silent -is:javahome /usr/lib/jvm/java-7-openjdk-amd64/jre/ && \
	rm -rf /tmp/install/tibadmin /tmp/install/TIB_TIBCOAdmin_*.zip && \
	
EXPOSE 8080

ENTRYPOINT ["/opt/tibco/docker-entrypoint.sh"]