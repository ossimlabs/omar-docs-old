#! /bin/bash

echo "site_name: OMAR Web Services" > mkdocs.yml
echo "pages:" >> mkdocs.yml
echo "- Home: index.md" >> mkdocs.yml

for app in ${APPS[@]} ; do

    # if the app has any documentation at all, add it to the yml
    if [ -d "$SCRIPT_DIR/docs/$app/docs" ]; then
  		    echo "- $app:" >> mkdocs.yml

            # if the app has a build guide, add it to the yml
            BUILD_GUIDE=$SCRIPT_DIR/$app/docs/build-guide.md
            if [ -e docs/$BUILD_GUIDE ]; then
                echo "  - Build Guide: $BUILD_GUIDE" >> mkdocs.yml
            fi

            # if the app has an install guide, add it to the yml
            INSTALL_GUIDE=$SCRIPT_DIR/$app/docs/install-guide.md
            if [ -e docs/$INSTALL_GUIDE ]; then
                echo "  - Install Guide: $INSTALL_GUIDE" >> mkdocs.yml
            fi

            # if the app has a user guide, add it to the yml
            USER_GUIDE=$SCRIPT_DIR/$app/docs/user-guide.md
            if [ -e docs/$USER_GUIDE ]; then
                echo "  - User Guide: $USER_GUIDE" >> mkdocs.yml
            fi
	fi
done
