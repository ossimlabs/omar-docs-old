# O2 Web Services - Hollywood 2.4.0

These docs serve as a guide for installing and running an individual service. It is up to the organization's best practices on how to orchestrate and configure the applications at scale.

## Release Notes

### Features

In no particular order, here are the major new and updated features provided in this release.


### Overall

* Lots of changes to the UI to accomodate multiple screen resolutions and add uniformity.

### OMAR-AVRO
* Fixed date parsing error

### OMAR-STAGER
* Error message "Premature end of file" is correctly handled
* SIC codes now ingested, stored, and searchable through OC2S

### OMAR-UI
* Modified Keyword, Range, and Temporal filters to auto-apply
* Added startDate and endDate clamping to custom temporal filters
* Fixed issue where the use of the backspace/delete key outside of the filter inputs would cause the browser to go 'back' to the previous page
* Thumbnails will appear with a transparent background
* Added new dropdown menu to the image space UI that allows users to select and render an image via an ImageWMS (Single) or TileWMS (Tiled)
* Filter text labels modified to support lower-resolution monitors

### OMAR-WEB-PROXY
* Added new logging formats

### OMAR-WMS
* Supports return of multiple images in a specified order to support mosaicing of individual images

### TLV
* Added KML as an export option in TLV



## Guides
