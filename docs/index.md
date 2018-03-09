# O2 Web Services - Gasparilla 2.3.0

These docs serve as a guide for installing and running an individual service. It is up to the organization's best practices on how to orchestrate and configure the applications at scale.

## Release Notes


### Features

In no particular order, here are the major new and updated features provided in this release.


### Overall

* Logging fields changed from "status" to "httpStatus"
* Logging time format to UTC universal timestamp format
* Automatic versioning of services within documentation

* Updated apps to Swagger 3.10.0

### OSSIM

* Fixed bugs in the base ossimImageHandler that was not supporting relocatable histograms and overviews properly
* Added support in the core c++ chipper class to add keywords for loading the external locations. We now prefix with each image. image0 image1...etc
* Added modifications to the chipping service to actually be able to pass in the overview and histogram locations
* Added a ossim-batch-test to chipper util to support relocatable histogram and overview chipping

### ISA-UI

* More than 10 images may be brought up in ISA

### OMAR-CONFIG-SERVER

* Added config server failover using configMaps generated with the omar-config-repo-dev and oamr-config-repo-rel pipelines.

### OMAR-TWOFISHES

* Added documentation for usage.

### OC2S-METRICS-DASHBOARD

* Kibana dashboards created to consolidate information from all OMAR deployment environments
* New ingest dashboard that displays metrics and listings of all ingested imagery

### OMAR-AVRO-METADATA

* omar-avro-metadata DynamoDB now configurable

### OMAR-FRONTEND-TEST

* Selenium tests now properly run against sites with PKI frontend

### OMAR-SQS-STAGER

* Created a new stager application in github called omar-sqs-stager
* Added logging for the new stager
* Added documentation for the new stager
* Added YAMl configuration to config-repo

### OMAR-UI

* UI now supports Snake_Case & camelCase formatted Avro metadata
* Multi-deployment federation improvements added to omar-ui

### OMAR-WMTS-APP

*  WMTS Swagger page improvements

### OSSIM-ISA-SERVICE

* ISA job are now done asynchronously
* RPCs sent to NASA NGT DEM extraction tool successfully create DEM
* Initial MSP photoblock to RPC conversion service completed

## Guides
