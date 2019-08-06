#! /bin/bash

#pushd `dirname ${BASH_SOURCE[0]}` >/dev/null
#export SCRIPT_DIR=`pwd -P`
#popd >/dev/null

# get a list of all the apps that have documentation
#source $SCRIPT_DIR/env.sh
#source $SCRIPT_DIR/checkout.sh

mkdir deployment_configs

token=`oc whoami -t`
curl -H "Authorization: Bearer $token" -k -L -o deployment_configs/deploymentConfigs.json https://openshift.ossim.io:8443/oapi/v1/namespaces/omar-dev/deploymentconfigs

groovy json2yml.groovy

python3 create-files.py

# remove any existing stylesheets
find . -name "*.css" -type f -delete

# remove any existing javascript files
find . ! -name "table.js" -name "*.js" -type f -delete

mkdocs build

sed -i -e 's/content="None"/content="Complete installation and user guides for the suite of O2 services."/g' ./site/index.html
