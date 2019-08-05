#! /bin/bash

echo "site_name: O2 Web Services" > mkdocs.yml
echo "extra_javascript:" >> mkdocs.yml
echo "- table.js" >> mkdocs.yml
echo "pages:" >> mkdocs.yml
echo "- Home: index.md" >> mkdocs.yml

for guide in ${GUIDES[@]} ; do
    FLAG=false

    for repo in ${REPOS[@]} ; do

        app=`echo $repo | sed -n 's/.*[/]\(.*\).git$/\1/p'`

        if [ -e $app/docsConfig.yml ]; then
            create_variables $app/docsConfig.yml
        fi

        if [ $guide == "install-guide" && -z "$app_installGuide" ]; then
            GUIDE=$app_installGuide
        elif [ $guide == "user-guide" && -z "$app_userGuide" ]; then
            GUIDE=$app_userGuide
        else
            GUIDE=$app/docs/$guide/$app.md
        fi

        # if the app has the correct guide documentation, add it to the yml
        if [ -e $SCRIPT_DIR/docs/$GUIDE ]; then

            # only place a yml guide subsection if it hasn't already been written
            if [ "$FLAG" = false ]; then
                echo "- $guide:" >> mkdocs.yml
                FLAG=true
            fi

            echo "  - $app: $GUIDE" >> mkdocs.yml
        fi
    done
done
