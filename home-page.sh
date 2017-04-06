#! /bin/bash

pushd docs

echo "| App | Guides |   |   |" >> index.md
echo "| --- | ------ | - | - |" >> index.md

for app in ${APPS[@]} ; do
    echo -n "| $app " >> index.md

    for guide in ${GUIDES[@]} ; do
        echo -n "| " >> index.md

        GUIDE=$app/docs/$guide/$app.md
        if [ -e $SCRIPT_DIR/docs/$GUIDE ]; then
            echo -n "[$guide]($app/docs/$guide/$app) " >> index.md
        fi
    done

    echo " |" >> index.md
done

popd
