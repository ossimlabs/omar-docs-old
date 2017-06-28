#! /bin/bash

. functions.sh

pushd docs

for repo in ${REPOS[@]} ; do

    app=`echo $repo | sed -n 's/.*[/]\(.*\).git$/\1/p'`
    getRepoVersion VERSION $app

    echo -n "| $app " >> index.md
    if [! -z $VERSION ] ; then
        echo -n "| v${VERSION} " >> index.md
    else
        echo -n "| " >> index.md
    fi

    for guide in ${GUIDES[@]} ; do
        echo -n "| " >> index.md

        GUIDE=$app/docs/$guide/$app.md
        if [ -e $SCRIPT_DIR/docs/$GUIDE ]; then
            echo "Found $GUIDE"
            echo -n "[$guide]($app/docs/$guide/$app/) " >> index.md
        fi
    done

    echo " |" >> index.md
done

popd
