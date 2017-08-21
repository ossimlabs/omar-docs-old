#! /bin/bash

pushd docs

for repo in ${REPOS[@]} ; do

    app=`echo $repo | sed -n 's/.*[/]\(.*\).git$/\1/p'`

    CONF_FILE=$app/apps/$app-app/grails-app/conf/application.yml
    INSTALL_GUIDE=$app/docs/install-guide/$app.md

    if [ -e $SCRIPT_DIR/docs/$CONF_FILE ] && [ -e $SCRIPT_DIR/docs/$INSTALL_GUIDE ]; then

        echo "\`\`\`" >> $INSTALL_GUIDE
        cat $CONF_FILE >> $INSTALL_GUIDE
        echo "\`\`\`" >> $INSTALL_GUIDE
    fi

done

popd
