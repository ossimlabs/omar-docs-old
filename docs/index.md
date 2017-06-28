# O2 Web Services

These docs serve as a guide for installing and running an individual service. It is up to the organization's best practices on how to orchestrate and configure the applications at scale.

## Release Notes

### Features
In no particular order, here are the major new and updated features provided in this release...

**Cucumber Tests**

* Gherkin test have been added for Geoscript, WCS and WMTS

**Documentation**

* The entire documentation bundle has been reworked to include install and user guides as necessary with version numbers. Sample Docker files are provided as well as configuration instructions.

**ELK Logging**

* ???

**FADE/MIST**

* The web proxy service has been updated to provide CORS support for external services.

**GIT Mirror**

* A new app was created that has the ability to take any code repository and mirror it to another bitbucket. This can assist with code backups when one repository isn't available or integrating code with other platofrms that may only work with one particular repository.

**Hawkular Metrics**

* ???

**ISA**

* A new ISA app has been made to serve as the UI component of 3DISA. It is linked from both O2 and TLV and displays multiple images simultaneously so users can examine and perform necessary function such as source selection, adding tie points, tringulation, etc.

**OMS Split**

* OMS is a critical compoentn to the image handling within O2 and as a result, many apps depends on it. Thus, the OMS code has been borken out into it's own service reudcing the build complexity and dependency issues.

**OSSIM MSP Service**

* A new ossim-msp-service app has been created to serve HTTP requests to MSP. Currently the service can provide sensor model information for images, perform source selection calculations as well as run triangulation jobs.  

**PKI**

* ???

**S3 Direct Access**

* Normally, OSSIM needs image files to be on the same filesystem to perform image operations, however, it has been modified such that it can use images while they remain in an S3 bucket. This alleviates the need to transfer and store large files to the local filesystem. 

**SCDF**

* ???

**User 1001**

* All the apps have been modified to run as user 1001 instead of root. This eliminates security and compatability issues when running the containers on various platforms.

### Bugs
The following bugs have been resolved...

* The deployment now properly handles NITF 2.1 files with multiple image segments
* NTM plugin updated to resolve a bug with SAR data.
* ImageSpace now works for HSI data
* The omar-docs URL works without the /
* SSH issues have been fixed with EVSS
* OPIR NITF files now display properly
* SQS HTTPS connection issues have been resolved
* Issues causing the failure of ossimIrect, ossimDrect, and ossimGrect have been fixed

## Guides
| tlv | [install-guide](tlv/docs/install-guide/tlv/) | [user-guide](tlv/docs/user-guide/tlv/)  |
| tlv | [install-guide](tlv/docs/install-guide/tlv/) | [user-guide](tlv/docs/user-guide/tlv/)  |
| tlv | [install-guide](tlv/docs/install-guide/tlv/) | [user-guide](tlv/docs/user-guide/tlv/)  |
| tlv | [install-guide](tlv/docs/install-guide/tlv/) | [user-guide](tlv/docs/user-guide/tlv/)  |
| tlv | [install-guide](tlv/docs/install-guide/tlv/) | [user-guide](tlv/docs/user-guide/tlv/)  |
| tlv | [install-guide](tlv/docs/install-guide/tlv/) | [user-guide](tlv/docs/user-guide/tlv/)  |
| omar-common | [install-guide](omar-common/docs/install-guide/omar-common/) |  |
| isa | |  |
| omar-avro | [install-guide](omar-avro/docs/install-guide/omar-avro/) |  |
| omar-base | [install-guide](omar-base/docs/install-guide/omar-base/) |  |
| omar-config-server | [install-guide](omar-config-server/docs/install-guide/omar-config-server/) |  |
| omar-geoscript | [install-guide](omar-geoscript/docs/install-guide/omar-geoscript/) |  |
| omar-disk-cleanup | [install-guide](omar-disk-cleanup/docs/install-guide/omar-disk-cleanup/) |  |
| omar-download | [install-guide](omar-download/docs/install-guide/omar-download/) |  |
| omar-eureka-server | [install-guide](omar-eureka-server/docs/install-guide/omar-eureka-server/) |  |
| omar-jpip | [install-guide](omar-jpip/docs/install-guide/omar-jpip/) |  |
| omar-mensa | [install-guide](omar-mensa/docs/install-guide/omar-mensa/) |  |
| omar-opir | [install-guide](omar-opir/docs/install-guide/omar-opir/) |  |
| omar-ossim-base | [install-guide](omar-ossim-base/docs/install-guide/omar-ossim-base/) |  |
| omar-service-proxy | [install-guide](omar-service-proxy/docs/install-guide/omar-service-proxy/) |  |
| omar-sqs | [install-guide](omar-sqs/docs/install-guide/omar-sqs/) |  |
| omar-stager | [install-guide](omar-stager/docs/install-guide/omar-stager/) |  |
| omar-superoverlay | [install-guide](omar-superoverlay/docs/install-guide/omar-superoverlay/) |  |
| omar-turbine-server | [install-guide](omar-turbine-server/docs/install-guide/omar-turbine-server/) |  |
| omar-ui | [install-guide](omar-ui/docs/install-guide/omar-ui/) | [user-guide](omar-ui/docs/user-guide/omar-ui/)  |
| omar-wcs | [install-guide](omar-wcs/docs/install-guide/omar-wcs/) |  |
| omar-wfs | [install-guide](omar-wfs/docs/install-guide/omar-wfs/) |  |
| omar-wms | [install-guide](omar-wms/docs/install-guide/omar-wms/) |  |
| omar-wmts | [install-guide](omar-wmts/docs/install-guide/omar-wmts/) |  |
| omar-zuul-server | [install-guide](omar-zuul-server/docs/install-guide/omar-zuul-server/) |  |
| tlv | [install-guide](tlv/docs/install-guide/tlv/) | [user-guide](tlv/docs/user-guide/tlv/)  |
| omar-common | [install-guide](omar-common/docs/install-guide/omar-common/) |  |
| isa | |  |
| omar-avro | [install-guide](omar-avro/docs/install-guide/omar-avro/) |  |
| omar-base | [install-guide](omar-base/docs/install-guide/omar-base/) |  |
| omar-config-server | [install-guide](omar-config-server/docs/install-guide/omar-config-server/) |  |
| omar-geoscript | [install-guide](omar-geoscript/docs/install-guide/omar-geoscript/) |  |
| omar-disk-cleanup | [install-guide](omar-disk-cleanup/docs/install-guide/omar-disk-cleanup/) |  |
| omar-download | [install-guide](omar-download/docs/install-guide/omar-download/) |  |
| omar-eureka-server | [install-guide](omar-eureka-server/docs/install-guide/omar-eureka-server/) |  |
| omar-jpip | [install-guide](omar-jpip/docs/install-guide/omar-jpip/) |  |
| omar-mensa | [install-guide](omar-mensa/docs/install-guide/omar-mensa/) |  |
| omar-opir | [install-guide](omar-opir/docs/install-guide/omar-opir/) |  |
| omar-ossim-base | [install-guide](omar-ossim-base/docs/install-guide/omar-ossim-base/) |  |
| omar-service-proxy | [install-guide](omar-service-proxy/docs/install-guide/omar-service-proxy/) |  |
| omar-sqs | [install-guide](omar-sqs/docs/install-guide/omar-sqs/) |  |
| omar-stager | [install-guide](omar-stager/docs/install-guide/omar-stager/) |  |
| omar-superoverlay | [install-guide](omar-superoverlay/docs/install-guide/omar-superoverlay/) |  |
| omar-turbine-server | [install-guide](omar-turbine-server/docs/install-guide/omar-turbine-server/) |  |
| omar-ui | [install-guide](omar-ui/docs/install-guide/omar-ui/) | [user-guide](omar-ui/docs/user-guide/omar-ui/)  |
| omar-wcs | [install-guide](omar-wcs/docs/install-guide/omar-wcs/) |  |
| omar-wfs | [install-guide](omar-wfs/docs/install-guide/omar-wfs/) |  |
| omar-wms | [install-guide](omar-wms/docs/install-guide/omar-wms/) |  |
| omar-wmts | [install-guide](omar-wmts/docs/install-guide/omar-wmts/) |  |
| omar-zuul-server | [install-guide](omar-zuul-server/docs/install-guide/omar-zuul-server/) |  |
| tlv | [install-guide](tlv/docs/install-guide/tlv/) | [user-guide](tlv/docs/user-guide/tlv/)  |
| omar-common | [install-guide](omar-common/docs/install-guide/omar-common/) |  |
| isa | |  |
| omar-avro | [install-guide](omar-avro/docs/install-guide/omar-avro/) |  |
| omar-base | [install-guide](omar-base/docs/install-guide/omar-base/) |  |
| omar-config-server | [install-guide](omar-config-server/docs/install-guide/omar-config-server/) |  |
| omar-geoscript | [install-guide](omar-geoscript/docs/install-guide/omar-geoscript/) |  |
| omar-disk-cleanup | [install-guide](omar-disk-cleanup/docs/install-guide/omar-disk-cleanup/) |  |
| omar-download | [install-guide](omar-download/docs/install-guide/omar-download/) |  |
| omar-eureka-server | [install-guide](omar-eureka-server/docs/install-guide/omar-eureka-server/) |  |
| omar-jpip | [install-guide](omar-jpip/docs/install-guide/omar-jpip/) |  |
| omar-mensa | [install-guide](omar-mensa/docs/install-guide/omar-mensa/) |  |
| omar-opir | [install-guide](omar-opir/docs/install-guide/omar-opir/) |  |
| omar-ossim-base | [install-guide](omar-ossim-base/docs/install-guide/omar-ossim-base/) |  |
| omar-service-proxy | [install-guide](omar-service-proxy/docs/install-guide/omar-service-proxy/) |  |
| omar-sqs | [install-guide](omar-sqs/docs/install-guide/omar-sqs/) |  |
| omar-stager | [install-guide](omar-stager/docs/install-guide/omar-stager/) |  |
| omar-superoverlay | [install-guide](omar-superoverlay/docs/install-guide/omar-superoverlay/) |  |
| omar-turbine-server | [install-guide](omar-turbine-server/docs/install-guide/omar-turbine-server/) |  |
| omar-ui | [install-guide](omar-ui/docs/install-guide/omar-ui/) | [user-guide](omar-ui/docs/user-guide/omar-ui/)  |
| omar-wcs | [install-guide](omar-wcs/docs/install-guide/omar-wcs/) |  |
| omar-wfs | [install-guide](omar-wfs/docs/install-guide/omar-wfs/) |  |
| omar-wms | [install-guide](omar-wms/docs/install-guide/omar-wms/) |  |
| omar-wmts | [install-guide](omar-wmts/docs/install-guide/omar-wmts/) |  |
| omar-zuul-server | [install-guide](omar-zuul-server/docs/install-guide/omar-zuul-server/) |  |
| tlv | [install-guide](tlv/docs/install-guide/tlv/) | [user-guide](tlv/docs/user-guide/tlv/)  |
| omar-common | [install-guide](omar-common/docs/install-guide/omar-common/) |  |
| isa | |  |
| omar-avro | [install-guide](omar-avro/docs/install-guide/omar-avro/) |  |
| omar-base | [install-guide](omar-base/docs/install-guide/omar-base/) |  |
| omar-config-server | [install-guide](omar-config-server/docs/install-guide/omar-config-server/) |  |
| omar-geoscript | [install-guide](omar-geoscript/docs/install-guide/omar-geoscript/) |  |
| omar-disk-cleanup | [install-guide](omar-disk-cleanup/docs/install-guide/omar-disk-cleanup/) |  |
| omar-download | [install-guide](omar-download/docs/install-guide/omar-download/) |  |
| omar-eureka-server | [install-guide](omar-eureka-server/docs/install-guide/omar-eureka-server/) |  |
| omar-jpip | [install-guide](omar-jpip/docs/install-guide/omar-jpip/) |  |
| omar-mensa | [install-guide](omar-mensa/docs/install-guide/omar-mensa/) |  |
| omar-opir | [install-guide](omar-opir/docs/install-guide/omar-opir/) |  |
| omar-ossim-base | [install-guide](omar-ossim-base/docs/install-guide/omar-ossim-base/) |  |
| omar-service-proxy | [install-guide](omar-service-proxy/docs/install-guide/omar-service-proxy/) |  |
| omar-sqs | [install-guide](omar-sqs/docs/install-guide/omar-sqs/) |  |
| omar-stager | [install-guide](omar-stager/docs/install-guide/omar-stager/) |  |
| omar-superoverlay | [install-guide](omar-superoverlay/docs/install-guide/omar-superoverlay/) |  |
| omar-turbine-server | [install-guide](omar-turbine-server/docs/install-guide/omar-turbine-server/) |  |
| omar-ui | [install-guide](omar-ui/docs/install-guide/omar-ui/) | [user-guide](omar-ui/docs/user-guide/omar-ui/)  |
| omar-wcs | [install-guide](omar-wcs/docs/install-guide/omar-wcs/) |  |
| omar-wfs | [install-guide](omar-wfs/docs/install-guide/omar-wfs/) |  |
| omar-wms | [install-guide](omar-wms/docs/install-guide/omar-wms/) |  |
| omar-wmts | [install-guide](omar-wmts/docs/install-guide/omar-wmts/) |  |
| omar-zuul-server | [install-guide](omar-zuul-server/docs/install-guide/omar-zuul-server/) |  |
| tlv | [install-guide](tlv/docs/install-guide/tlv/) | [user-guide](tlv/docs/user-guide/tlv/)  |
