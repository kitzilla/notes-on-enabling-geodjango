# -*- coding: utf-8 -*-
# Generated by Django 1.11.18 on 2019-01-06 21:46
from __future__ import unicode_literals

import django.contrib.gis.db.models.fields
import django.contrib.postgres.fields.jsonb
from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='MyGeoModel',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('geom', django.contrib.gis.db.models.fields.GeometryField(srid=3857)),
                ('data', django.contrib.postgres.fields.jsonb.JSONField()),
            ],
        ),
    ]
