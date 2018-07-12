#! /bin/bash

pushd `dirname ${BASH_SOURCE[0]}` >/dev/null
export SCRIPT_DIR=`pwd -P`
popd >/dev/null

# get a list of all the apps that have documentation
source $SCRIPT_DIR/env.sh

source $SCRIPT_DIR/checkout.sh
source $SCRIPT_DIR/home-page.sh
source $SCRIPT_DIR/application-yml.sh
source $SCRIPT_DIR/dockerfiles.sh
source $SCRIPT_DIR/source-code.sh
source $SCRIPT_DIR/versioning.sh
source $SCRIPT_DIR/mkdocs-yml.sh

# remove any existing stylesheets
find . -name "*.css" -type f -delete

# remove any existing javascript files
find . ! -name "api.js" -name "*.js" -type f -delete

mkdocs build

sed -i -e 's/content="None"/content="Complete installation and user guides for the suite of O2 services."/g' $SCRIPT_DIR/site/index.html
