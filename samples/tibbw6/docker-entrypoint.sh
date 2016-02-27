#!/bin/bash

set -e

cd /opt/tibco/bw/6.3/bin

/opt/tibco/bw/6.3/bin/bwadmin upload -d defaultdomain /tibco.bw.sample.binding.rest.Basic.application_1.0.0.ear

/opt/tibco/bw/6.3/bin/bwadmin start -d defaultdomain -appspace defaultappspace

ln -sf /dev/stdout /opt/tibco/bw/6.3/domains/defaultdomain/appnodes/defaultappspace/defaultappnode/log/bwappnode.log

/opt/tibco/bw/6.3/bin/bwadmin deploy -as -d defaultdomain -appspace defaultappspace tibco.bw.sample.binding.rest.Basic.application_1.0.0.ear

exec "$@"
