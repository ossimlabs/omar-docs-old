#! /bin/bash

pushd docs

for repo in ${REPOS[@]} ; do

    app=`echo $repo | sed -n 's/.*[/]\(.*\).git$/\1/p'`

    if [[ $app == "o2-pushbutton" ]]; then
        continue
    fi

    if [ -e $app/docsConfig.yml ]; then
        create_variables $app/docsConfig.yml
    fi

    # only take the first application.yml
    # sometimes the plugin directory will have one as well
    if [ -z "$app_applicationFile" ]; then
        CONF_FILE=$app_applicationFile
    else
        CONF_FILE=`find $SCRIPT_DIR/docs/$app -name "application.yml" | head -1`
    fi

    if [ -z "$app_installGuide" ]; then
        INSTALL_GUIDE=$app_installGuide
    else
        INSTALL_GUIDE=$SCRIPT_DIR/docs/$app/docs/install-guide/$app.md
    fi

    if [ "$CONF_FILE" != "" ] && [ -e $CONF_FILE ]  && [ -e $INSTALL_GUIDE ]; then
        echo "" >> $INSTALL_GUIDE
        echo "## Application YML Configuration" >> $INSTALL_GUIDE
        echo "\`\`\`" >> $INSTALL_GUIDE
        cat $CONF_FILE >> $INSTALL_GUIDE
        echo "\`\`\`" >> $INSTALL_GUIDE
    fi

    unset_vars

done

popd
