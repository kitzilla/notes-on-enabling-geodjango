#!/bin/sh

# Written 15 Jan 2019
# Tested with Alpine edge (3.9?)

apk add --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing proj4-dev geos gdal-dev

# Install Python 3 and postgresql-client
apk add --no-cache python3 py3-setuptools postgresql-libs libstdc++

# Install GDAL (Proj.4 will automatically come along as a dependency of libgdal-dev)
apk add --no-cache --virtual .build-deps g++ python3-dev postgresql-dev

# Install Django
pip3 install --upgrade pip
pip3 install django==1.11.18 psycopg2-binary==2.7.5

# (Optional) Install GDAL-python binding. Not needed to make GeoDjango work
pip3 install GDAL==2.4.0

apk --purge del .build-deps

