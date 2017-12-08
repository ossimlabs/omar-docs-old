#! /bin/bash

pushd docs

for repo in ${REPOS[@]} ; do

    app=`echo $repo | sed -n 's/.*[/]\(.*\).git$/\1/p'`

    # only take the first application.yml
    # sometimes the plugin directory will have one as well
    CONF_FILE=`find $SCRIPT_DIR/docs/$app -name "application.yml" | head -1`
    INSTALL_GUIDE=$SCRIPT_DIR/docs/$app/docs/install-guide/$app.md

    if [ "$CONF_FILE" != "" ] && [ -e $CONF_FILE ]  && [ -e $INSTALL_GUIDE ]; then
        echo "" >> $INSTALL_GUIDE
        echo "## Application YML Configuration" >> $INSTALL_GUIDE
        echo "\`\`\`" >> $INSTALL_GUIDE
        cat $CONF_FILE >> $INSTALL_GUIDE
        echo "\`\`\`" >> $INSTALL_GUIDE
    fi

done

popd
