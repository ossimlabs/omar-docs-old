# O2 Web Services - Islamorada 2.5.0

These docs serve as a guide for installing and running an individual service. It is up to the organization's best practices on how to orchestrate and configure the applications at scale.

## Release Notes

* Chipping speed is now improved

All old indices have been migrated to the new version of elastic search

Elastic Search 5.X has been installed.

Migrated omar-rel to blue/green-style deployment.

Registration of new EC2 instances with EAM

Search Guard has been integrated.

Changed raster to log mission ids, sensor ids, file names, file types, image ids, and entry ids as arrays.
Removed analyzers from Elasticsearch mapping that strip only the first element in array. 
Configured Kibana to split fields with multiple values by each, individual value.

Added SQS stager pausing to deployment and toggle pipelines.

Analyzed functional benefits of using Gluster over NFS. 
Poured through Gluster Administrative Guide.
Created tentative outline for future actions/tickets.

We added the getRasterFiles url to the oms config for thumbnail generation.

The WFS API has been added to the API Gateway.

SQS details have been added to the confluence page for S2P deployment.

SNS details have been added to the confluence page for S2P deployment.

The DynamoDB details for our tables are now listed in the confluence omar S2P deployment document

Added relevant information about RDS to Confluence page.

Added relevant EC2 volume information to Confluence page in table.

Confluence document for omar S2P deployment details now has an EC2 table.

Script written to identify what images are missing in O2.

Exclude packages from being updated during security updates

All apps now use nexus to get dependencies and to promote artifacts.

individual accounts are not required for the test vpc

SCDF Server, MariaDB and RabbitMQ have been deployed into omar-dev. This allowed omar-scdf-sqs and omar-scdf-regex-filter to be deployed which allows SCID images to be filtered out to their own SQS queue.
We are current working on creating a deployment script for SCDF Server, MariaDB and RabbitMQ so they don't have to be deployed manually.

Set up HP Fortify SSC to visualize scan output of source code

Installed high side 6.3.0 ElasticSearch and SearchGuard
Migrated old indices to an index in the new kibana

Simplified porting low-side Jenkins pipeline configurations to high-side.

All EC2s except PROD related ones have been updated with the latest packages.

EAM monitoring of Openshift Pods

O2 version 2.4.2 is now deployed on the lowside. Version tags are now reflected on GitHub.

Migrate Jenkins data to S2P Jenkins environment

## Guides
