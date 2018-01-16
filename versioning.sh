#! /bin/bash
. functions.sh

pushd docs

ARTIFACTORY_URL="http://artifactory.ossim.io/artifactory/omar-local/io/ossim/omar/apps"

for repo in ${REPOS[@]} ; do
    VERSION=""
    app=`echo $repo | sed -n 's/.*[/]\(.*\).git$/\1/p'`
    getRepoVersion VERSION $app

    for guide in ${GUIDES[@]} ; do
        GUIDE=$app/docs/$guide/$app.md

        # only modify the guide if it exists and the version number exists
        if [ -e $SCRIPT_DIR/docs/$GUIDE ] && [ "$VERSION" != "" ]; then
            sed -i "2iv$VERSION" $GUIDE
        fi
    done

done

popd
