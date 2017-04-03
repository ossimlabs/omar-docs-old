# OMAR Documentation

This repository will checkout and build documentation from all other repositories.

## Usage
Use `./mkdocs.sh` (with the optional `clean`) argument to checkout all documentation and build the necessary `mkdocs.yml` file.

## env.sh
This file contains a list of all the apps that will be included in the documentation.

## checkout.sh
This file will cycle through all apps, checking out the docs folder from each repository. If the app folder already exists any updates to the repository will be pulled. 

## yml.sh
This file will cycle through all the apps, incorporating any of the following files into the overall documentation.
* docs/build-guide.md
* docs/install-guide.md
* docs/user-guide.md
