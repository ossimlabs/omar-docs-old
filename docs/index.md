# O2 Web Services - Hollywood 2.4.2

These docs serve as a guide for installing and running an individual service. It is up to the organization's best practices on how to orchestrate and configure the applications at scale.

## Release Notes

### Features

In no particular order, here are the major new and updated features provided in this release.

### Overall

- 2CMV FSG products are now supported and searchable in OC2S

### OMAR-WFS
- Updated WFS to parse filter request and retrieve specific filter fields (country code, mission ID, etc).
- Logged WFS filter keywords as JSON array so that each entry is considered an individual and unique value.

### OMAR-SQS-STAGER
- Added new endpoints to omar-sqs-stager. pause, stop, start, isPasued, isProcessing, isProcessingJobs
- Remaining images are now included in the logs

## Guides