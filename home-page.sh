#! /bin/bash

. functions.sh

pushd docs

echo "| | | | | |" >> index.md
echo "|-|-|-|-|-|" >> index.md

for repo in ${REPOS[@]} ; do

    app=`echo $repo | sed -n 's/.*[/]\(.*\).git$/\1/p'`

    getRepoVersion REPO_VERSION $app

    echo -n "| $app " >> index.md

    if [ "$REPO_VERSION" != "" ] ; then
        echo -n "| v${REPO_VERSION} " >> index.md
    else
       echo -n "| " >> index.md
    fi

    for guide in ${GUIDES[@]} ; do
        echo -n "| " >> index.md
        GUIDE=$app/docs/$guide/$app.md
        if [ -e $SCRIPT_DIR/docs/$GUIDE ]; then
            echo "Found $GUIDE..."
            echo -n "[$guide]($app/docs/$guide/$app/) " >> index.md
        fi
    done

    echo -n "| ... |" >> index.md


    # Search for a description in the app's README
    if [ -e $SCRIPT_DIR/docs/$app/README.md ]; then
        echo "Found $app's README..."
        echo -n "| " >> index.md

        APP_DESCRIPTION = `cat $SCRIPT_DIR/docs/$app/README.md | sed -n '/^## Description/,/[^\s]/ { /## Description/d;p }' | sed '/^\s*$/d'`

        if  [ "$APP_DESCRIPTION" = "" ]; then
            echo "Description not found." >> index.md
        else
            echo "$APP_DESCRIPTION" >> index.md
            echo " |" >> index.md
        fi
    else
        echo "| Description not available. |" >> index.md
    fi
done

popd
