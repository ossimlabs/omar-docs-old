# O2 Web Services - Egmont Key 2.1.1

These docs serve as a guide for installing and running an individual service. It is up to the organization's best practices on how to orchestrate and configure the applications at scale.

## Release Notes

## The following updates/upgrades have been implemented

* Grails updated to 3.3.1 for all OMAR apps
* Grade updated to 3.5 for all OMAR apps
* Spring Cloud Services updated to Dalston.SP4
* GeoScript updated to 1.9.0
* Upgraded Swagger 1.5.x (OpenAPI 2.0)

### Features

In no particular order, here are the major new and updated features provided in this release.

**OMAR UI**

* DEV, STAGE, and PROD UI's are now viewable
* UI's are no longer throwing an insecure certificate warning
* Added configurable Metrics dropdown menu to the UI
* Added username from PKI to the UI
* Secure System message is shown when the user first logs into an O2 interface
* The UI ImageSpace getTile was refactored to be more efficient when providing tiles. This achieved the same affect as calling OMS directly

**OSSIM**

* Added State base object
* Added ImageHandlerState object
* Added TIFFHandlerState object for TIFF states
* Added Registry for allocating a State object from a saved state
* Added support to ossimTiffTileSource to populate a state
* Added state support in the base ossimImageHandler
* Added State.h and .cpp
* Added ImageHandlerState.h and .cpp
* Added ImageHandlerStateRegistry.h .cpp
* Added ImageHandlerStateFactory.h .cpp
* Added TiffHandlerState.h .cpp
* Added StateFactoryBase.h template for factory lists using shared pointer
* Modified ossim core library, ossim-plugins, ossim-gui, ossim-video, ossim-planet, ossim-planet-gui and ossim-oms for all OpenThreads mutex locations and changed to std::mutex
* Added doxygen style comments to some of the headers
* Removed occurrence of OpenThreads within ossim, ossim-oms, ossim-gut, ossim-plugins and ossim-video
* Added pause and resume support to the Thread base
* Removed occurrence of OpenThreads the build system of ossim modules that no longer require it

## The following new OMAR service has been created

* omar-turbine-server
* omar-zipkin-server

## Bug Fixes

* Fixed bug with running concurrent applications in the same dev tree

## Guides
