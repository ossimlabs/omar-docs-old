#! /bin/bash

# Create all files required for mkdocs
python3 create-files.py

# remove any existing stylesheets
#find . -name "*.css" -type f -delete

# remove any existing javascript files
#find . ! -name "table.js" -name "*.js" -type f -delete

#mkdocs build

#sed -i -e 's/content="None"/content="Complete installation and user guides for the suite of O2 services."/g' ./site/index.html
