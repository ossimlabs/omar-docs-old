#!/bin/bash

##
# Example use: getRepoVersion os major_version minor_version os_arch
#
function getRepoVersion {
    REPO=$2

    GRADLE_PROPERTIES=$REPO/gradle.properties
    if [ -e $GRADLE_PROPERTIES ]; then
        eval $1=`grep buildVersion $x | awk -F "=" '{print $2}'`
    fi
}
