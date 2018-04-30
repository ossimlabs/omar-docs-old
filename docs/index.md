# O2 Web Services - Gasparilla 2.3.2

These docs serve as a guide for installing and running an individual service. It is up to the organization's best practices on how to orchestrate and configure the applications at scale.

## Release Notes

### Features

In no particular order, here are the major new and updated features provided in this release.


### Overall

* New visualization listing most viewed/most popular imagery in given timeframe.
* New visualization listing most viewed/most popular imagery in a given timeframe as a pie chart.

### OMAR-CMDLN
* New S3 crawler allows ingest of S3 contents.

### OMAR-UI
* Added the ability to select multiple images in the UI and create an Openlayers tile layer from the O2 WMS service.
* GeoRSS export is now available

### OSSIM
* Added new codec J2K factory interface for NITF
* Changed the ossimChipperUtil.cpp to add the null pixel flip in another section of code that was missed.
* Single tile images are now properly handled.
* Resampling engine was fixed to remove artifacts when zooming out.

## Guides
