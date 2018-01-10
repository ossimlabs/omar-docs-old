# O2 Web Services - Fort Myers 2.2.1

These docs serve as a guide for installing and running an individual service. It is up to the organization's best practices on how to orchestrate and configure the applications at scale.

## Release Notes

## TO DO

Make a script to delete artifacts from S3

### Features

In no particular order, here are the major new and updated features provided in this release.

### Overall

* Automated cucumber testing added to classified deployment 
* Artifactory dependencies available for high-side builds
* New ingest dashboard that displays metrics and listings of all ingested imagery
* Automated cucumber tests for KML download service
* Additional jMeter tests for all externally facing services

### OSSIM-ISA

* ISA refactored and deployed to dev-test instance to support ATP
* RPCs sent to NASA NGT DEM extraction tool successfully create DEM
* Initial MSP photoblock to RPC conversion service completed

### OMAR-GEOSCRIPT

* New heatmap display of most requested imagery over last day, 3 days, 7 days


### OMAR-WFS

* Added cucumber tests for WFS post to the omar-oldmar proxy that FADE uses for queries 
* Changed boundingBox definition to standard "BBOX."
* Addition of WFS Kibana dashboard that displays WFS usage patterns and searches


### OMAR-UI

* Now supports Snake_Case & camelCase formatted Avro metadata
* Multi-deployment federation improvements added


### OMAR-STAGER

* Modified stager to allow for ingest of ENVI directory structure

## Guides
