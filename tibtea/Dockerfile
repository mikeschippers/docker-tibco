FROM tibbase:1.0.0

MAINTAINER Mike Schippers <info@mikeschippers.com>

ADD TIB_tea_2.2.*.zip /tmp/install/

RUN unzip /tmp/install/TIB_tea_2.2.*.zip -d /tmp/install/tea && \
	sed -i 's/<entry key="environmentName">.*<\/entry>/<entry key="environmentName">DockerizedEnvironment<\/entry>/g' /tmp/install/tea/TIBCOUniversalInstaller*.silent && \
	sed -i 's/<entry key="installationRoot">.*<\/entry>/<entry key="installationRoot">\/opt\/tibco<\/entry>/g' /tmp/install/tea/TIBCOUniversalInstaller*.silent && \
	sed -i 's/<entry key="configDirectoryRoot">.*<\/entry>/<entry key="configDirectoryRoot">\/opt\/tibco\/config<\/entry>/g' /tmp/install/tea/TIBCOUniversalInstaller*.silent && \
	sed -i 's/<entry key="java.home.directory">.*<\/entry>/<entry key="java.home.directory">\/usr\/lib\/jvm\/java-7-openjdk-amd64\/jre<\/entry>/g' /tmp/install/tea/TIBCOUniversalInstaller*.silent && \
	/bin/bash /tmp/install/tea/TIBCOUniversalInstaller-lnx-x86-64.bin -silent && \
	rm -rf /tmp/install /tmp/install/TIB_tea_2.2.*.zip

EXPOSE 8777

WORKDIR /opt/tibco/tea/2.2/bin

ENTRYPOINT ["/opt/tibco/tea/2.2/bin/tea"]


