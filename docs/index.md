# O2 Web Services - Egmont Key 2.1.2

These docs serve as a guide for installing and running an individual service. It is up to the organization's best practices on how to orchestrate and configure the applications at scale.

## Release Notes

## The following updates/upgrades have been implemented

* NTR

### Features

In no particular order, here are the major new and updated features provided in this release.

**ISA**

* Ability to load and view MSP triangulated photoblock

**OSSIM**

* Moved ossim-plugins/csm3 to it's own repo ossim-csm-plugin
* Modified the cam plugin to allow one to turn off an on plugin support from the CSM
* Added des_parsing in ossim and fixed a des parsing error for the dump
* Added keyword for the des_parser enabled.
* Added keywords for the cam plugin location
* Added keywords for the cam data dir
* Added keywords for enable_plugins and disable_plugins that the ossim-csm-plugin module uses.
* Fixed geocell to zero out the state when building overviews.
* Added to test timings to make sure that the state loads are "Faster" than non state loads
* Added calls from our batch test to use the new state test application for testing the ossim baseline.

**Spring Cloud Admin**

* Created Docker container for Spring Cloud Admin
* Created github project with master and dev branches
* Created Jenkins pipelines for master and dev
* Created installation documentation for service
* Spring Cloud docker deployed on low-side

**TLV**

* TLV now accepts imageID only URLs and centers on the identified image

**WFS**

* Additional logging from WFS on type and number of queries

## The following new OMAR service has been created

* NTR

## Bug Fixes

* NTR

## Guides
