#! /bin/bash
. functions.sh

ls -alhR
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
                echo -n "## Dockerfile" >> $GUIDE
                echo -n "```" >> $GUIDE
                cat $dockerfile >> $GUIDE
                echo -n "```" >> $GUIDE
            fi
        fi
    done
done

popd
