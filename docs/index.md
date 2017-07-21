# O2 Web Services - Daytona Beach 2.0.1

These docs serve as a guide for installing and running an individual service. It is up to the organization's best practices on how to orchestrate and configure the applications at scale.

## Release Notes

### Features
In no particular order, here are the major new and updated features provided in this release.

**AVRO Query**

* Image metadata will not only show values obtained from the file headers but there is also a tab to see exactly what information came with the image's AVRO file as well.

**EFK**

* Application developers can view the logs of the projects for which they have view access. The EFK stack aggregates logs from hosts and applications, whether coming from multiple containers or even deleted pods.

**PKI**

* There is now support for a PKI proxy, checking a user's browser certificate against a revocation list before allowing access to any of the downstream services.


### Bugs
The following bugs have been resolved...

* Failed thumbnails will show a red X instead of a blank failed HTML image
* Default sorting has been fixed
* CSV exports will now return empty values properly
* No more errors for JSON and KML WFS queries with a filter that returns no results


## Guides
