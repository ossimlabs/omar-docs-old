#! /bin/bash
. functions.sh

mkdir Dockerfiles
pushd Dockerfiles
aws s3 cp s3://o2-delivery/dev/docker . --exclude "*" --include "*-Dockerfile" --recursive

for repo in ${REPOS[@]} ; do
    app=`echo $repo | sed -n 's/.*[/]\(.*\).git$/\1/p'`

    for dockerfile in `ls`; do
        if [[ $dockerfile == *"$app"* ]]; then

            GUIDE=$SCRIPT_DIR/docs/$app/docs/install-guide/$app.md
            # only modify the guide if it exists and a dockerfile exists
            if [ -e $GUIDE ]; then
                echo "" >> $GUIDE # make sure you start on a new line
                echo "## Dockerfile" >> $GUIDE
                echo "\`\`\`" >> $GUIDE
                cat $dockerfile >> $GUIDE
                echo  "\`\`\`" >> $GUIDE
            fi

            rm $dockerfile
        fi
    done
done

popd
