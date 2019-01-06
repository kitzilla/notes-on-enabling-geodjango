from django.test import TestCase
from django.contrib.gis.geos import GEOSGeometry
from django.contrib.gis.measure import D

from .models import MyGeoModel

# Create your tests here.

class GeoDjangoTest(TestCase):
    def test_import(self):
        geom = GEOSGeometry('{ "type": "Point", "coordinates": [ 200, 0 ] }')
        obj = MyGeoModel(geom=geom, data={ 'foo': 'bar' })
        obj.save()
        
        origin = GEOSGeometry('{ "type": "Point", "coordinates": [ 0, 0 ] }')
        self.assertEqual(0, MyGeoModel.objects.filter(geom__dwithin=(origin, D(m=199))).count())
        self.assertEqual(1, MyGeoModel.objects.filter(geom__dwithin=(origin, D(m=200))).count())

        self.assertEqual(1, MyGeoModel.objects.filter(data__foo='bar').count())