# O2 Web Services - Egmont Key 2.1.0

These docs serve as a guide for installing and running an individual service. It is up to the organization's best practices on how to orchestrate and configure the applications at scale.

## Release Notes

### Features

In no particular order, here are the major new and updated features provided in this release.

**OMAR UI**

* Added select/dropdown box above the image card list in the UI
* The new dropdown can be used to change the OMAR backing services to a federated O2
* The search map updates the footprint layer to match the currently selected OMAR
* The search list cards update, and contain imagery from the currently selected OMAR 
* The Imagespace map will load the image from the currently selected OMAR
* Ancillary services such as KML SuperOverlay, Download, Mensa also use the currently selected OMAR
* All TLV requests from the O2 UI will post to the TLV app installed with the currently selected OMAR
* The Share link will provide the user with a link to the associated OMAR that has been selected
* The Imagespace UI now displays the server, the image id, and the acquisition date from the selected OMAR. The HTML layout and colors were modfiied for better presentation of the data
* Moved all of the WFS calls that were sprinkled throughout the various javascript modules into one homogeneous service (wfs.service.js)
* Added a new 'About' dropdown menu
* Displays the following information O2, release name, release number, UI build version
* Admin can control the visibility of the menu via the application.yml
* Added spinner icon to Search map page
* Added spinner icon to the image Space page
* Spinners on map pages will be visible and spin while tiles are being loaded into the map view
* Added configurable message of the day banner to the home page
* The banner can be disabled via application.yml param

**OMAR Mensa**
* Removed GeoScript from omar-mensa
* omar-mensa now has a direct JTS dependency

**OMAR Config Server**
* OMAR config server now has two profiles: native and remote. The config server can serve files located in the service's local file system at ${HOME}/configs/ (/home/omar/configs/)

**OMAR Web Proxy**
* removed the CERT definitions out of GIT
* Edited the docker configuration to remove the CERTS and to make sure we have directories for the different configurations.
* Added config map definitions on the omar-dev so that the reverse proxy and CERT's and CRL can be defined on startup for that container.
* Added README for the new configuration layout.
* Added omar-web-proxy to the omar-docs generation
* Created a new repository under ossimlabs after removing the CERTS.
* Added support for CRL config maps to /etc/ssl/crl location with a .crl extension. On boot if the directory is present it will put the hashes to the directory /etc/httpd/crl

**OSSIM ISA**
* OSSIM ISA Service endpoints documented in swagger
* UI will query OSSIM-ISA for ATP algorithms and parameters.
* isa-ui and ossim-isa-service have been upgraded to Grails 3.3.0

**OMAR Geoscript**
* Docs use application.yml directly for configuration

**Native S3 Access**
* Added BlockIstream and BlockIstreamBuffer for block buffer stream implementation
* Added Support for creating blockistreams in the StreamFactory
* Removed the deprecated code from StreamFactory and fixed all code in OSSIM that calls the deprecated StreamFactory
* Added a get list to the Keywordlist that will sort and get a list of prefix based on our array formatted key prefix.
* Added Doxygen style comments through the code

## The following new repositories have been added to the OMAR service baseline

* omar-twofishes
* omar-mapproxy

## The following new repositories have been removed from the OMAR service baseline

* omar-pki-proxy

## Guides
