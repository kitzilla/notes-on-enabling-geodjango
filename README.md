# Memo: Enabling GeoDjango

Ways to enable GeoDjango and GDAL-Python binding from scratch

GeoDjango:

https://docs.djangoproject.com/en/2.1/ref/contrib/gis/

GDAL in Python:

https://pypi.org/project/GDAL/

https://pcjericks.github.io/py-gdalogr-cookbook/

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


Author: Go Sato, 2019

Licence: MIT
