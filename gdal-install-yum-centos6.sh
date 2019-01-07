#!/bin/bash

# Written 6 Jan 2019
# Tested on CentOS 6.10

yum update

# Install EPEL
yum -y install wget
cd ~
wget http://dl.fedoraproject.org/pub/epel/epel-release-latest-6.noarch.rpm
rpm -Uvh epel-release-*.rpm

# Install Python 3
yum -y install python34-devel python34-setuptools
python3 /usr/lib/python3.4/site-packages/easy_install.py pip

# Install GDAL (ver 1.7.3). proj4 will come along as dependency
yum -y install gdal

# Install Django with Psycopg2
pip3 install django==1.11.18 psycopg2-binary==2.7.5

# GDAL-python binding cannot be installed for the combination of Python3 and GDAL 1.7.3
# Anyways GeoDjango will work without this binding