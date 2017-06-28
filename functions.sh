#!/bin/bash

##
# Example use: getRepoVersion os major_version minor_version os_arch
#
function getRepoVersion {
    REPO=$2

    for x in `find $REPO -name gradle.properties`; do
        eval $1=`grep buildVersion $x | awk -F "=" '{print $2}'`
    done
}
