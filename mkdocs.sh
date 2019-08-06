#! /bin/bash

# Get deployment Configs for all apps from openshift
#mkdir deployment_configs

#token=`oc whoami -t`
#curl -H "Authorization: Bearer $token" -k -L -o deployment_configs/deploymentConfigs.json https://openshift.ossim.io:8443/oapi/v1/namespaces/omar-dev/deploymentconfigs

#groovy json2yml.groovy

# Create all files required for mkdocs
python3 create-files.py

# remove any existing stylesheets
find . -name "*.css" -type f -delete

# remove any existing javascript files
find . ! -name "table.js" -name "*.js" -type f -delete

mkdocs build

sed -i -e 's/content="None"/content="Complete installation and user guides for the suite of O2 services."/g' ./site/index.html
