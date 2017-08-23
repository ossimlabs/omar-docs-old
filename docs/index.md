# O2 Web Services - Daytona Beach 2.0.2

These docs serve as a guide for installing and running an individual service. It is up to the organization's best practices on how to orchestrate and configure the applications at scale.

## Release Notes

### Features
In no particular order, here are the major new and updated features provided in this release.

**TLV**
* The TLV API support searchLibraries=<lib1,lib2> as a way to automatically select multiple search libraries.
* The search dialog will present a checkbox for each library that is available to search in.
* WFS queries will now be client-side, using the user's credentials

**Native S3**
* Added Step definitions for Direct S3 access
* Added Gherkin for the scenarios
* Added the target to the staging part of the S3 direct access	Actions

* In o2-paas we added the securityContext to allow privileged user and added the setup SYS_ADMIN and runAsUser 1001 to force a 1001 startup to each container we need privileged user for. This includes OMS, WCS, DOWNLOAD, MENSA. and STAGER. We also added a BUCKETS env variable to allow one to specify the bucks to mount.
* On the OpenShift cluster we must run on master "oc edit scc restricted" to enable pods: to come up as privileged, allow SYS_ADMIN to be set and to RunAsAny user.
* Only the pipelines we are currently using have been modified to support mounting the s3 on startup. On our distribution we modified omar-oms, omar-download, omar-stager, and omar-mensa. We added a run.sh that checks for the environment variable BUCKETS and mount the buckets to a /s3 directory
* We added a pipeline ossim-goofys that takes the goofys master branch and builds the binary and uploads it to the bucket location ossimlabs/dependencies/goofys/goofys. The Docker SPEC for the build pipelines mentioned uses a wget to install the goofys onto the /usr/bin directory.	Actions

**OC2S Environment**
* Added to the PKI confluence All certificates and how to convert them to a PEM
* Currently only dev has been tested. we modified the location of the PKI CERTs to be it's own directory /etc/ssl/omar-certs.
* Modified our unclass PKI to use the /etc/ssl/omar-certs directory
* We now use the config mapping on the high side to replace the certs at deploy time

**One-way Guard**
* SMTP Notifier Github repo created
* SMTP Notifier Jenkins pipelines created for master and dev
* SMTP Notifier Code is complete with the ability to configure the SMTP settings, 'From' email address, and email signature	Actions

**PKI Authorization**
* Modified the PKI proxy image on high side to include the Certificate Revocation List setup for all CRL posted on the high side
* Updated the Jenkins pipeline to automatically update the revocation list
* Updated the Confluence for PKI configuration to describe the Jenkins steps being executed by the omar-update-crl pipeline	Actions

**OSSIM Mensuration**
* OSSIM now supports wild point filtering

**Basemap**
* Updated the reverese-proxy.conf files for omar-dev, and omar-rel on the unclassified cluster to use the new o2-mapproxy route
* Updated the reverese-proxy.conf files for c2s-dev on the classified cluster to use the new o2-mapproxy route
* Removed service-proxy route from the reverse-proxy.conf files for omar-dev, and omar-rel on unclassified cluster
* Added 'Project deprecated' message to omar-server-proxy README.md on Github
* Removed the server-proxy Deployment, Service and Pods on omar-rel and omar-dev unclass
* Removed master and dev Jenkin's pipelines for omar-service-proxy
* Removed service-proxy from deployment template

**EFK Logging**
* Web proxy and pki proxy now log to standard out

**Automated Testing**
* Added TLV scenarios of automated UI testing.
* Separated tests into backend, frontend, and ingest tests.
* Created separate Jenkins pipelines for dev and master of each test type.
* Tests now run periodically and after a related project builds (backend tests run after omar-wfs, etc, are built)

**Placename (Twofishes)**
* Added a Jenkins build pipeline for twofishes app so that its build and deployment is automated.

**Image Ingest**
* scdf image dumper - Added call to OSSIM JNI DataInfo object to get image info for each image staged.

**OMAR UI**
* Modified the geoscript and ui configs for OCS Dev define and use the highside color scheme for footprints.
* Added a new profile for geoscript oc2s dev until we are able to update the stage env.

### Bugs
The following bugs have been resolved:

* The OpenShift integration environment on unclassified AWS was having resource utilization issues. OpenShift stack upgraded to 1.5.1.


## Guides
