# WeGA-Updater

A container environment for running the ANT scripts (for testing and deployment)
of the 
[Carl-Maria-von-Weber-Gesamtausgabe](https://weber-gesamtausgabe.de/).

## Setup

### Volumes

We need at least two volumes: for the data and for the schemata (to validate against).

* /path/to/odds:/var/wega-odd
* /path/to/data:/var/wega-data

### Environment Variables

Env variables may be passed through to the ANT scripts with one caveat: dots in the variable names must be replaced by underscores 
(and will be re-substituted by the entrypoint script). Additionally, they must be prefixed with 'UPDATER_', e.g.

* UPDATER_schema_dir=/var/wega-odd/schema/de
* UPDATER_svn_dir=/var/wega-data

