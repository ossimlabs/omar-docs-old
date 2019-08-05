#! /bin/bash
. functions.sh

for repo in ${REPOS[@]} ; do
    app=`echo $repo | sed -n 's/.*[/]\(.*\).git$/\1/p'`

    if [ -e $SCRIPT_DIR/docs/$app/docsConfig.yml ]; then
        create_variables $app/docsConfig.yml
    fi

    if [ -z "$app_installGuide" ]; then
        GUIDE=$SCRIPT_DIR/docs/$app/$app_installGuide
    else
        GUIDE=$SCRIPT_DIR/docs/$app/docs/install-guide/$app.md
    fi

    # only modify the guide if it exists
    if [ -e $GUIDE ]; then
        echo "" >> $GUIDE # make sure you start on a new line
        echo "## Source Code" >> $GUIDE
        URL="${repo/://}"
        URL="${URL/git@/https://}"
        echo "[$URL]($URL)" >> $GUIDE
    fi
    unset_vars
done
