FROM tibtra:5.10.0

MAINTAINER Mike Schippers <info@mikeschippers.com>

ADD TIB_BW_*.zip /tmp/install/

RUN unzip /tmp/install/TIB_BW_*.zip -d /tmp/install/tibbw/ && \
	sed -i 's/<entry key="environmentName">.*<\/entry>/<entry key="environmentName">DockerEnvironment<\/entry>/g' /tmp/install/tibbw/TIBCOUniversalInstaller-BW_*.silent && \
	sed -i 's/<entry key="feature_AMBW Designtime_BW">.*<\/entry>/<entry key="feature_AMBW Designtime_BW">false<\/entry>/g' /tmp/install/tibbw/TIBCOUniversalInstaller-BW_*.silent && \
	sed -i 's/<entry key="feature_Documentation_BW">.*<\/entry>/<entry key="feature_Documentation_BW">false<\/entry>/g' /tmp/install/tibbw/TIBCOUniversalInstaller-BW_*.silent && \
	/bin/bash /tmp/install/tibbw/TIBCOUniversalInstaller-lnx-*.bin -silent -is:javahome /usr/lib/jvm/java-7-openjdk-amd64/jre/ && \
	rm -rf /tmp/install/tibbw/ /tmp/install/TIB_BW_*.zip

WORKDIR /opt/tibco/bw/5.13/bin	