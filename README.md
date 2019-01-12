# Memo: Enabling GeoDjango

Ways to enable GeoDjango and GDAL-Python binding from scratch.

GeoDjango:

https://docs.djangoproject.com/en/2.1/ref/contrib/gis/

GDAL in Python:

https://pypi.org/project/GDAL/

https://pcjericks.github.io/py-gdalogr-cookbook/


Disclaimer:

The author is not one of the developers of GeoDjango, GDAL and other products and materials referred in the codebase.

## Repo content
1. gdal-install-apt-ubuntu18.sh

    Shellscript for Ubuntu 18.04 by installing GDAL with apt-get (most straightforward)
2. gdal-build-ubuntu18.sh

    Shellscript for Ubuntu 18.04 by building GDAL from source (allows you to get the latest ver but very time consuming)
3. gdal-install-yum-centos6.sh

    Shellscript for CentOS6 (and potentially Amazon Linux 1) by install GDAL with yum

    GDAL in Python is unavailable as the python binding is not available for GDAL in EPEL repo. 
4. gdal-build-centos6.sh

    Shellscript for CentOS6 (and potentially Amazon Linux 1) by building GDAL from source

    Allows you to install GDAL in Python but not the latest version.
5. docker-compose.yml

    docker-compose file for testing

6. testsite (directory)

    A minimal Django 1.18 site to debug the scripts
    
## How to test GeoDjango enabled
0. Prerequistics

    Docker

    Docker Compose (17.09.0 or higher)

1. `cd /path/to/where/this/repo/cloned`
2. `docker-compose up -d`
3. `docker-compose exec ubuntu /bin/bash`
4. `cd /myscripts`
5. `./gdal-install-apt-ubuntu18.sh`
6. `cd ./testsite`
7. `python ./manage.py test`

If the installation went correctly, the unittest will finish successfully. Otherwise it will raise exception that GDAL is not installed. (`from django.contrib.gis.db import models` raises Exception when GeoDjango could not find GDAL and GEOS)

## Notes
Setting `GDAL_LIBRARY_PATH` and `GEOS_LIBRARY_PATH` to Django's config file would not be necessary for latest Django versions (confirmed in Django 1.11.18) but may be required for old versions.




Author: Go Sato, 2019

Licence: MIT
