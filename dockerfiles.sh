#! /bin/bash
. functions.sh

pushd docs

for repo in ${REPOS[@]} ; do
    app=`echo $repo | sed -n 's/.*[/]\(.*\).git$/\1/p'`

    if [ -e $app/docsConfig.yml ]; then
        create_variables $app/docsConfig.yml
    fi

    if [ -z $app_dockerGuide ]; then
        DOCKERFILE=$app_dockerGuide
    else
        DOCKERFILE=$app/docker/Dockerfile

    if [ ! -e $DOCKERFILE ]; then
        DOCKERFILE=$app/Dockerfile
    fi

    if [ -e $DOCKERFILE ]; then
        if [ -z "$app_installGuide" ]; then
            GUIDE=$app_installGuide
        else
            GUIDE=$SCRIPT_DIR/docs/$app/docs/install-guide/$app.md
        fi

        if [ -e $GUIDE ]; then
            echo "" >> $GUIDE # make sure you start on a new line
            echo "## Dockerfile" >> $GUIDE
            echo "\`\`\`" >> $GUIDE
            cat $DOCKERFILE >> $GUIDE
            echo  "\`\`\`" >> $GUIDE
        fi
    fi
    unset_vars
done

popd
