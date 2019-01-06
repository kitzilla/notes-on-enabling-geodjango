#!/bin/bash

# Written 6 Jan 2019
# Tested with Ubuntu Bionic

apt-get update

# Install Python 3 and postgresql-client
apt-get install -y python3-dev python3-pip postgresql-client

# Install GDAL (Proj.4 will automatically come along as a dependency of libgdal-dev)
apt-get install -y --no-install-recommends gdal-bin libgdal-dev

# Install Django
pip3 install django==1.11.18 psycopg2-binary==2.7.5

# (Optional) Install GDAL-python binding. Not needed to make GeoDjango work
pip3 install GDAL==$(gdal-config --version) --global-option=build_ext --global-option="-I/usr/include/gdal"
