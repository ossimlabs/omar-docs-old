# O2 Web Services - Gasparilla 2.3.1

These docs serve as a guide for installing and running an individual service. It is up to the organization's best practices on how to orchestrate and configure the applications at scale.

## Release Notes


### Features

In no particular order, here are the major new and updated features provided in this release.


### Overall
* BE tables updated to support accurate BE searches

### OMAR-CORE

* Modified omar-core taglib, and added new .css property to remove the text shadow.

### OMAR-OMS
* OMS now provides access to thumbnails via the raster entry ID.
* Thumbnail supports relocatable overviews and histograms.

### OMAR-RASTER
* Subsequent image entries are now no longer indexed unless marked "NODISPLY".
* Subsequent image entries are now no longer produce overviews or histograms unless marked "NODISPLY".

### OMAR-SQS-STAGER
* Added thumbnail generation to the stager YAML.
* Different image files with the same name are now supported.

### OMAR-UI

* Reduced the number of WFS queries required from the omar-ui.
* Added .css property to the styles.css in omar-ui.
* Color coded, auto-generated footprint legend to assist users in identifying sensor types.
* Selectable search results allow for export, save, and viewing of up to ten images.
* Updated UI calls to pass record ID to OMS thumbnail generation.
* Filter now allows a user to exclude unknown values.
* Active filters breadcrums are now displayed shown under the navigation bar.

### OSSIM
* Added new Codec registry for NITF.
* Added new codec J2K factory interface for NITF.

## Guides
