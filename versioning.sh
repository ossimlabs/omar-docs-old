#! /bin/bash

pushd docs

ARTIFACTORY_URL="http://artifacts.radiantbluecloud.com/artifactory/omar-local/io/ossim/omar/apps"

for app in ${APPS[@]} ; do

    if [[ $app == *"server"* ]]; then
        URL="$ARTIFACTORY_URL/$app/1.0.0-SNAPSHOT/maven-metadata.xml"
    else
        URL="$ARTIFACTORY_URL/$app-app/1.0.0-SNAPSHOT/maven-metadata.xml"
    fi

    VERSION=$( groovy -e "
        try {
            def text = new URL('$URL').getText();

            def xml = new XmlSlurper().parseText( text );

            def buildNumber = xml.versioning.snapshot.buildNumber;
            def timeStamp = xml.versioning.snapshot.timestamp;
            println 'Version: ' + timeStamp.toString() + '-' + buildNumber.toString()
        }
        catch ( Exception e ) { println '' }
    ")

    for guide in ${GUIDES[@]} ; do
        GUIDE=$app/docs/$guide/$app.md

        # only modify the guide if it exists and the version number exists
        if [ -e $SCRIPT_DIR/docs/$GUIDE ] && [ "$VERSION" != "" ]; then
            sed -i "2i$VERSION" $GUIDE
        fi
    done

done

popd
