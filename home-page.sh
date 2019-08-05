#! /bin/bash

. functions.sh

pushd docs

echo "| | | | | |" >> index.md
echo "|-|-|-|-|-|" >> index.md

for repo in ${REPOS[@]} ; do

    app=`echo $repo | sed -n 's/.*[/]\(.*\).git$/\1/p'`

    getRepoVersion REPO_VERSION $app

    echo -n "| **$app** " >> index.md

    if [ "$REPO_VERSION" != "" ] ; then
	echo "Version found: $REPO_VERSION"
        echo -n "| v${REPO_VERSION} " >> index.md
    else
	echo "Version not found."
        echo -n "| " >> index.md
    fi

    if [ -e $SCRIPT_DIR/docs/$app/docsConfig.yml ]; then
        create_variables $app/docsConfig.yml
    fi

    for guide in ${GUIDES[@]} ; do
        echo -n "| " >> index.md

        if [ $guide == "install-guide" ] && [ -z "$app_installGuide" ]; then
            GUIDE=$app_installGuide
        elif [ $guide == "user-guide" ] && [ -z "$app_userGuide" ]; then
            GUIDE=$app_userGuide
        else
            GUIDE=$app/docs/$guide/$app.md
        fi

        if [ -e $SCRIPT_DIR/docs/$GUIDE ]; then
            LINK=`echo "$GUIDE" | cut -f 1 -d '.'`
            echo "Found $GUIDE..."
            echo -n "[$guide]($LINK) " >> index.md
        fi
    done

    echo "|  |" >> index.md


    # Search for a description in the app's README
    if [ -e $SCRIPT_DIR/docs/$app/README.md ]; then

        APP_DESCRIPTION=`cat $SCRIPT_DIR/docs/$app/README.md | sed -n '/^## Description/,/[^\s]/ { /## Description/d;p }' | sed '/^\s*$/d'`

        if  [ "$APP_DESCRIPTION" = "" ]; then
            echo "Description not found in README."
            echo "| Description not found. |" >> index.md
        else
            echo "| $APP_DESCRIPTION |" >> index.md
        fi
    else
        echo "Description not available because no README is found."
        echo "| Description not available. |" >> index.md
    fi

    unset_vars
done

popd
