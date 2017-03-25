FROM tibbase:1.0.0

MAINTAINER Mike Schippers <info@mikeschippers.com>

ADD TIB_rv*_linux_x86.zip /tmp/install/

RUN unzip /tmp/install/TIB_rv*_linux_*.zip -d /tmp/install/tibrv/ && \
	sed -i 's/<entry key="environmentName">.*<\/entry>/<entry key="environmentName">DockerEnvironment<\/entry>/g' /tmp/install/tibrv/TIBCOUniversalInstaller-rv.silent && \
	sed -i 's/<entry key="feature_Development_rv">.*<\/entry>/<entry key="feature_Development_rv">false<\/entry>/g' /tmp/install/tibrv/TIBCOUniversalInstaller-rv.silent && \	
	sed -i 's/<entry key="feature_Runtime_Designer">.*<\/entry>/<entry key="feature_Runtime_Designer">false<\/entry>/g' /tmp/install/tibrv/TIBCOUniversalInstaller-rv.silent && \	
	/bin/bash /tmp/install/tibrv/TIBCOUniversalInstaller-lnx-x86.bin -silent -is:javahome /usr/lib/jvm/java-7-openjdk-amd64/jre/ && \
	rm -rf /tmp/install/tibrv/ /tmp/install/TIB_rv*_linux_*.zip