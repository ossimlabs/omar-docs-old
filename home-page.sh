#! /bin/bash

pushd docs

#echo "| App |   |   |" >> index.md
#echo "| --- | - | - |" >> index.md

for repo in ${REPOS[@]} ; do

    app=`echo $repo | sed -n 's/.*[/]\(.*\).git$/\1/p'`

    echo -n "| $app " >> index.md

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
