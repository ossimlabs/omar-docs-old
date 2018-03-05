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
| | | | | |
|-|-|-|-|-|
| omar-common | | [install-guide](omar-common/docs/install-guide/omar-common/) | | ...  |
| isa-ui | | | | ...  |
| omar-admin-server | v1.0.1 | [install-guide](omar-admin-server/docs/install-guide/omar-admin-server/) | | ...  |
| omar-avro-metadata | v1.2.0 | [install-guide](omar-avro-metadata/docs/install-guide/omar-avro-metadata/) | | ...  |
| omar-base | v1.1.0 | [install-guide](omar-base/docs/install-guide/omar-base/) | | ...  |
| omar-basemap | v1.0.0 | [install-guide](omar-basemap/docs/install-guide/omar-basemap/) | | ...  |
| omar-cesium-terrain-builder | v1.0.0 | [install-guide](omar-cesium-terrain-builder/docs/install-guide/omar-cesium-terrain-builder/) | | ...  |
| omar-cesium-terrain-server | v1.0.0 | [install-guide](omar-cesium-terrain-server/docs/install-guide/omar-cesium-terrain-server/) | | ...  |
| omar-config-server | v1.2.0 | [install-guide](omar-config-server/docs/install-guide/omar-config-server/) | | ...  |
| omar-disk-cleanup | v1.4.0 | [install-guide](omar-disk-cleanup/docs/install-guide/omar-disk-cleanup/) | | ...  |
| omar-download | v1.2.11 | [install-guide](omar-download/docs/install-guide/omar-download/) | | ...  |
| omar-eureka-server | v1.1.0 | [install-guide](omar-eureka-server/docs/install-guide/omar-eureka-server/) | | ...  |
| omar-geoscript | v1.2.4 | [install-guide](omar-geoscript/docs/install-guide/omar-geoscript/) | | ...  |
| omar-jpip | v1.2.0 | [install-guide](omar-jpip/docs/install-guide/omar-jpip/) | | ...  |
| omar-mapproxy | v1.0.1 | [install-guide](omar-mapproxy/docs/install-guide/omar-mapproxy/) | | ...  |
| omar-mensa | v1.3.0 | [install-guide](omar-mensa/docs/install-guide/omar-mensa/) | | ...  |
| omar-oms | v1.3.0 | [install-guide](omar-oms/docs/install-guide/omar-oms/) | | ...  |
| omar-ossim-base | v1.1.0 | [install-guide](omar-ossim-base/docs/install-guide/omar-ossim-base/) | | ...  |
| omar-sqs-stager | v1.1.0 | [install-guide](omar-sqs-stager/docs/install-guide/omar-sqs-stager/) | | ...  |
| omar-mapproxy | v1.0.1 | [install-guide](omar-mapproxy/docs/install-guide/omar-mapproxy/) | | ...  |
| omar-basemap | v1.0.0 | [install-guide](omar-basemap/docs/install-guide/omar-basemap/) | | ...  |
| omar-stager | v1.3.0 | [install-guide](omar-stager/docs/install-guide/omar-stager/) | | ...  |
| omar-superoverlay | v1.2.0 | [install-guide](omar-superoverlay/docs/install-guide/omar-superoverlay/) | | ...  |
| tlv | v1.6.0 | [install-guide](tlv/docs/install-guide/tlv/) | [user-guide](tlv/docs/user-guide/tlv/) | ...  |
| omar-turbine-server | v1.2.0 | [install-guide](omar-turbine-server/docs/install-guide/omar-turbine-server/) | | ...  |
| omar-twofishes | v1.1.0 | [install-guide](omar-twofishes/docs/install-guide/omar-twofishes/) | [user-guide](omar-twofishes/docs/user-guide/omar-twofishes/) | ...  |
| omar-ui | v1.4.12 | [install-guide](omar-ui/docs/install-guide/omar-ui/) | [user-guide](omar-ui/docs/user-guide/omar-ui/) | ...  |
| omar-wcs | v1.1.0 | [install-guide](omar-wcs/docs/install-guide/omar-wcs/) | | ...  |
| omar-web-proxy | v1.0.0 | [install-guide](omar-web-proxy/docs/install-guide/omar-web-proxy/) | | ...  |
| omar-wfs | v1.3.0 | [install-guide](omar-wfs/docs/install-guide/omar-wfs/) | | ...  |
| omar-wms | v1.4.0 | [install-guide](omar-wms/docs/install-guide/omar-wms/) | | ...  |
| omar-wmts | v1.1.1 | [install-guide](omar-wmts/docs/install-guide/omar-wmts/) | | ...  |
| omar-zipkin-server | v1.0.0 | [install-guide](omar-zipkin-server/docs/install-guide/omar-zipkin-server/) | | ...  |
| ossim-isa | v1.0.0 | | | ...  |
| rhel-minimal | v1.0.0 | [install-guide](rhel-minimal/docs/install-guide/rhel-minimal/) | | ...  |
