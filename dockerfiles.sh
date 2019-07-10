#! /bin/bash
. functions.sh

pushd docs

for repo in ${REPOS[@]} ; do
    app=`echo $repo | sed -n 's/.*[/]\(.*\).git$/\1/p'`

    DOCKERFILE=$app/docker/Dockerfile
    
    if [ ! -e $DOCKERFILE]; then
        DOCKERFILE=$app/Dockerfile
    fi

    if [ -e $DOCKERFILE ]; then
        GUIDE=$SCRIPT_DIR/docs/$app/docs/install-guide/$app.md
        if [ -e $GUIDE ]; then
            echo "" >> $GUIDE # make sure you start on a new line
            echo "## Dockerfile" >> $GUIDE
            echo "\`\`\`" >> $GUIDE
            cat $DOCKERFILE >> $GUIDE
            echo  "\`\`\`" >> $GUIDE
        fi
    fi
done

popd
