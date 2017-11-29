# OMAR Documentation

This repository will checkout and build documentation from all other repositories.

## Usage
Use `./mkdocs.sh` to checkout all documentation and build the necessary `mkdocs.yml`  and `index.md` files.

## application-yml.sh
This file will pull the grails-app/conf/application.yml file and paste it into the configuration section of the install-guide.

## dockerfiles.sh
This file will checkout all the Dockerfiles from S3 and inject them into the appropriate install-guide.

## env.sh
This file contains a list of all the apps and guides that will be included in the documentation.

## checkout.sh
This file will cycle through all apps, checking out the docs folder from each repository. If the app folder already exists any updates to the repository will be pulled.

## home-page.sh
This file will cycle through all the apps, building a "guides" table. If a particular guide is present for an app, a link will be provided, otherwise it will be left blank.

## versioning.sh
This file will look for a gradle.properties file in the repo. If there is a buildNumber=#.#.# notation in that file, it will be annotated at the top of the guide pages as a version number.

## mkdocs-yml.sh
This file will cycle through all the apps, incorporating any of the following files into the overall documentation `mkdocs.yml`.
* `docs/install-guide/<app>.md`
* `docs/user-guide/<app>.md`
