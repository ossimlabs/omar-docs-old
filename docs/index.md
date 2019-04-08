# O2 Web Services - KeyWest 2.7.2

These docs serve as a guide for installing and running an individual service. It is up to the organization's best practices on how to orchestrate and configure the applications at scale.

## Release Notes

* User interface REST APIs are now part of the app's swagger page and can be found below in the documentation.

## omar-stager
* Raster entries that are greater than 0 will now use the 0th entry for some of their metadata such as security classification, mission ID, etc.

## omar-ui
* Users can now enter custom search filters for multi-select options like country code, mission ID, sensor ID and product ID.

## omar-wms
* The WMS API now accepts an "image/vnd.jpeg-png" format parameter that auto-detects if the requested chip contains geometry that is on the edge of the image. If so, it will return a png ( for transparency ), otherwise it will return jpeg. This allows for a mixed data type in the user interface, combining the speed and compressed size of JPEG with the transparency of PNG only where needed.

## tlv
* Users can now mensurate in both ortho and image space views.


## Guides
