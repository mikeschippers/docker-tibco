FROM tibbase:1.0.0

MAINTAINER Mike Schippers <info@mikeschippers.com>

ADD TIB_ems*_linux_x86.zip /tmp/install/

RUN unzip /tmp/install/TIB_ems*.zip -d /tmp/install/tibems/ && \
sed -i 's/<entry key="environmentName">.*<\/entry>/<entry key="environmentName">DockerizedEnvironment<\/entry>/g' /tmp/install/tibems/TIBCOUniversalInstaller-ems.silent && \
sed -i 's/<entry key="configDirectoryRoot">.*<\/entry>/<entry key="configDirectoryRoot">\/opt<\/entry>/g' /tmp/install/tibems/TIBCOUniversalInstaller-ems.silent && \
sed -i 's/<entry key="feature_Development Kit_ems">.*<\/entry>/<entry key="feature_Development Kit_ems">false<\/entry>/g' /tmp/install/tibems/TIBCOUniversalInstaller-ems.silent && \
sed -i 's/<entry key="feature_EMS Client Baseline_ems">.*<\/entry>/<entry key="feature_EMS Client Baseline_ems">false<\/entry>/g' /tmp/install/tibems/TIBCOUniversalInstaller-ems.silent && \
sed -i 's/<entry key="feature_EMS Source_ems">.*<\/entry>/<entry key="feature_EMS Source_ems">false<\/entry>/g' /tmp/install/tibems/TIBCOUniversalInstaller-ems.silent && \
/bin/bash /tmp/install/tibems/TIBCOUniversalInstaller-lnx-x86.bin -silent -is:javahome /usr/lib/jvm/java-7-openjdk-amd64/jre/ && \
rm -rf /tmp/install/tibems /tmp/install/TIB_ems*.zip

EXPOSE 7222

ENTRYPOINT ["/opt/tibco/ems/8.3/bin/tibemsd", "-config", "/opt/tibco/cfgmgmt/ems/data/tibemsd.conf"]