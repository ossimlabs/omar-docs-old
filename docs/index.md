# O2 Web Services - Fort Myers 2.2.2

These docs serve as a guide for installing and running an individual service. It is up to the organization's best practices on how to orchestrate and configure the applications at scale.

## Release Notes


### Features

In no particular order, here are the major new and updated features provided in this release.


### Overall

* Cucumber configs are now divorced from their repos. 
* AWS OpsWorks in use in Modapps VPC
* OC2S NFS cache size increased to 90 days
* Automated cucumber testing added to classified deployment 
* BE Searching improvements for test-dev and test-prod
* O2.FortMyers 2.2.1 security responses and updates
* New, multi-master, dedicated EC2 per environment OpenShift platform to meet target architecture requirements
* New target-level infrastructure installed on C2S
* Additional jMeter tests for all externally facing services
* EFK logs no longer ephemeral, stored in EBS volume
* Database once again allows for unstage/stage/restage process
* Added script to back populate ENVI directory structure


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
