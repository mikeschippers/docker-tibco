FROM tibbase:1.0.0

MAINTAINER Mike Schippers <info@mikeschippers.com>

ADD TIB_BW_6.*.zip /tmp/install/

RUN unzip /tmp/install/TIB_BW_6.*.zip -d /tmp/install/tibbw && \
	sed -i 's/<entry key="environmentName">.*<\/entry>/<entry key="environmentName">DockerizedEnvironment<\/entry>/g' /tmp/install/tibbw/TIBCOUniversalInstaller_BW_6.3.*.silent && \
	sed -i 's/<entry key="installationRoot">.*<\/entry>/<entry key="installationRoot">\/opt\/tibco<\/entry>/g' /tmp/install/tibbw/TIBCOUniversalInstaller_BW_6.3.*.silent && \
	sed -i 's/<entry key="LGPLAssemblyPath">.*<\/entry>/<entry key="LGPLAssemblyPath">\/opt\/tibco\/thirdpartysoftware<\/entry>/g' /tmp/install/tibbw/TIBCOUniversalInstaller_BW_6.3.*.silent && \
	sed -i 's/<entry key="selectedProfiles">.*<\/entry>/<entry key="selectedProfiles">Runtime<\/entry>/g' /tmp/install/tibbw/TIBCOUniversalInstaller_BW_6.3.*.silent && \
	/bin/bash /tmp/install/tibbw/TIBCOUniversalInstaller-lnx-x86-64.bin -silent && \
	rm -rf /tmp/install/ /tmp/install/tibbw/TIB_BW_6.*.zip 
	
EXPOSE 5050 5060 5432 7222 5555 8079 8886 9091 5678 8777 2222 7500