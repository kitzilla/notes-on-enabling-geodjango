from django.contrib.gis.db import models
from django.contrib.postgres.fields import JSONField

# Create your models here.
class MyGeoModel(models.Model):
    geom = models.GeometryField(srid=3857, spatial_index=True)
    data = JSONField()