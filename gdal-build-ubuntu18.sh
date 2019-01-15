#!/bin/bash

# Written 7 Jan 2019
# Tested on Ubuntu bionic

GEOS_VER=3.7.1
PROJ_VER=5.2.0
GDAL_VER=2.4.0


cd /tmp

apt-get update

# Install Python 3 and postgresql-client
apt-get install -y python3-dev python3-pip postgresql-client


# Install GDAL from source (Takes approx 1.5 hours)
apt-get install -y --no-install-recommends wget make g++ libtool-bin

wget http://download.osgeo.org/geos/geos-${GEOS_VER}.tar.bz2 -O download.tar.bz2
tar xjf download.tar.bz2
rm download.tar.bz2
cd geos-$GEOS_VER
chmod +x ./configure
./configure
make
make install
cd ..
rm -R geos-$GEOS_VER

wget http://download.osgeo.org/proj/proj-${PROJ_VER}.tar.gz -O download.tar.gz
tar -xzf download.tar.gz
rm download.tar.gz
cd proj-$PROJ_VER
chmod +x ./configure
./configure
make
make install
cd ..
rm -R proj-$PROJ_VER

wget http://download.osgeo.org/gdal/${GDAL_VER}/gdal-${GDAL_VER}.tar.gz -O download.tar.gz
tar -xzf download.tar.gz
rm download.tar.gz
cd gdal-$GDAL_VER
chmod +x ./configure
./configure --with-geos=/usr/local/bin/geos-config
make
make install
cd ..
rm -R gdal-$GDAL_VER

ldconfig -v

# Install Django
pip3 install django==1.11.18 psycopg2-binary==2.7.5


# (Optional) Install GDAL-python binding. Not needed to make GeoDjango work
pip3 install GDAL==$GDAL_VER
