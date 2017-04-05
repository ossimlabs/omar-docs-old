#! /bin/bash

pushd `dirname $0` >/dev/null
export SCRIPT_DIR=`pwd -P`
popd >/dev/null

# get a list of all the apps that have documentation
source $SCRIPT_DIR/env.sh

source $SCRIPT_DIR/checkout.sh
source $SCRIPT_DIR/yml.sh


mkdocs build

tar cvfz docs.tgz site

ls -Rl
