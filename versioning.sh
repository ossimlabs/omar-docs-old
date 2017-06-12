#! /bin/bash

pushd docs

ARTIFACTORY_URL="http://artifacts.radiantbluecloud.com/artifactory/omar-local/io/ossim/omar/apps"

for repo in ${REPOS[@]} ; do

    app=`echo $repo | sed -n 's/.*[/]\(.*\).git$/\1/p'`

    # determine if a RELEASE or SNAPSHOT should be used
    if [ "$OSSIM_GIT_BRANCH" == "master" ]; then
        RELEASE="1.0.0-RELEASE"
    else
        RELEASE="1.0.0-SNAPSHOT"
    fi

    # the apps with server don't need the "app" extension
    if [[ $app == *"server"* ]]; then
        URL="$ARTIFACTORY_URL/$app/$RELEASE/maven-metadata.xml"
    else
        URL="$ARTIFACTORY_URL/$app-app/$RELEASE/maven-metadata.xml"
    fi
    echo "Checking for Version in: $URL"

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
