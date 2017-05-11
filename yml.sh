#! /bin/bash

echo "site_name: O2 Web Services" > mkdocs.yml
echo "pages:" >> mkdocs.yml
echo "- Home: index.md" >> mkdocs.yml

for guide in ${GUIDES[@]} ; do
    FLAG=false

    for app in ${APPS[@]} ; do
        # if the app has the correct guide documentation, add it to the yml
        GUIDE=$app/docs/$guide/$app.md
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
