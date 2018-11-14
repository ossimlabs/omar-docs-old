# O2 Web Services - Juno 2.6.0

These docs serve as a guide for installing and running an individual service. It is up to the organization's best practices on how to orchestrate and configure the applications at scale.

## Release Notes

* Modified JAVA runtime environment for Docker to allow for specifying optimized parameters for the JVM. Example garbage collection, memory utilization, etc.

* There is now a gradle plugin, stored at https://github.com/ossimlabs/gradleDefaults. This plugin defines tasks for generating docker images, as well as pulling the base image and pushing the built image. Additionally, the plugin defines the set of base dependencies for grails apps. Since this is a plugin, it can be imported into any project’s build.gradle.

* There is also a template for a grails app repo at https://github.com/ossimlabs/icarus, which also contains a build.gradle that uses this new plugin. Currently the plugin has to be installed to mavenLocal

## omar-ui

* Added the ability to export the WMS GetCapabilities for a single image via a new button on the image card
* Added some classification styling as well as valid sensor model styling
* Re-arranged some things and added the security classification field to the mix

## omar-avro-metadata

* Added code in omar-avro-metadata, omar-ui, and omar-sqs-stager, to use filename instead of image id for adding/retrieving avro metadata for an image. Filename will always be unique, whereas that is not the case with image id.

## Guides
