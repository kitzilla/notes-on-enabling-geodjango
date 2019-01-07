#!/bin/bash

# Written 6 Jan 2019
# Tested on CentOS 6.10


GEOS_VER=3.6.3   # 3.7.0+ can't be built straight away in CentOS6 due to c++11 requirement
PROJ_VER=5.1.0   # 5.2.0+ can't be built straight away in CentOS6 due to c++11 requirement
GDAL_VER=2.2.4   # 2.3.0+ can't be built straight away in CentOS6 due to c++11 requirement


yum update

# Install EPEL
yum -y install wget
cd /tmp
wget http://dl.fedoraproject.org/pub/epel/epel-release-latest-6.noarch.rpm
rpm -Uvh epel-release-*.rpm

# Install Python 3
yum -y install python34-devel python34-setuptools postgresql
python3 /usr/lib/python3.4/site-packages/easy_install.py pip


# Install GDAL from source (Takes approx 30mins)
yum -y install gcc make gcc-c++ libtool libxml2-devel libpng libtiff

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

echo "/usr/local/lib" >> /etc/ld.so.conf.d/usrlocalbin.conf
ldconfig -v


# Install Django with Psycopg2
pip3 install django==1.11.18 psycopg2-binary==2.7.5


# (Optional) Install GDAL-python binding. Not needed to make GeoDjango work
pip3 install GDAL==$GDAL_VER --global-option=build_ext --global-option="-I/usr/include/gdal"

