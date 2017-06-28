# O2 Web Services - Daytona Beach 2.0.0

These docs serve as a guide for installing and running an individual service. It is up to the organization's best practices on how to orchestrate and configure the applications at scale.

## Release Notes

### Features
In no particular order, here are the major new and updated features provided in this release.

**Cucumber Tests**

* Gherkin test have been added for Geoscript, WCS, and WMTS

**Documentation**

* The entire documentation bundle has been reworked to include install and user guides as necessary with version numbers. Sample Docker files are provided as well as configuration instructions.

**FADE/MIST**

* The web proxy service has been updated to provide CORS support for external services.

**GIT Mirror**

* A new app was created that has the ability to take any code repository and mirror it to another bitbucket. This can assist with code backups when one repository isn't available or integrating code with other platforms that may only work with one particular repository.

**ISA**

* A new ISA app has been made to serve as the UI component of 3DISA. It is linked from both O2 and TLV and displays multiple images simultaneously so users can examine and perform necessary function such as source selection, adding tie points, triangulation, etc.

**OMS Split**

* OMS is a critical component to the image handling within O2 and as a result, many apps depends on it. Thus, the OMS code has been broken out into it's own service which reduces build complexity and dependency issues.

**OSSIM MSP Service**

* A new ossim-msp-service app has been created to serve HTTP requests to MSP. Currently the service can provide sensor model information for images, perform source selection calculations as well as run triangulation jobs.  

**S3 Native Access**

* Normally, OSSIM needs image files to be on the same filesystem to perform image operations, however, it has been modified such that it can use images while they remain in an S3 bucket. This alleviates the need to transfer and store large files to the local filesystem. 
* This work is currently in a preliminary test stage, but has been included in this release as part of OSSIM core.

**Spring Cloud Data Flow (SCDF)**

* Many new applications have been created to support image ingest via Spring Cloud Data Flow
* The applications are tagged as omar-scdf-
* Each application exists as a small part of an image ingest chain that can be stitched together as needed for any given environment

**OpenShift User Least Privileges**

* All application docker images have been modified to run as user 1001 instead of root. This eliminates security and compatibility issues when running the containers on various platforms.

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
