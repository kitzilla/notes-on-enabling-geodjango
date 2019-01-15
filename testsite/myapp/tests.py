from django.test import TestCase
from django.contrib.gis.geos import GEOSGeometry
from django.contrib.gis.measure import D

from .models import MyGeoModel, MyGeoModel2

from osgeo import ogr, osr
import os

# Create your tests here.

class GeoDjangoTest(TestCase):    
    def test_if_geodjango_works(self):
        geom = GEOSGeometry('{ "type": "Point", "coordinates": [ 200, 0 ] }')
        obj = MyGeoModel(geom=geom, data={ 'foo': 'bar' })
        obj.save()

        origin = GEOSGeometry('{ "type": "Point", "coordinates": [ 0, 0 ] }')
        self.assertEqual(0, MyGeoModel.objects.filter(geom__dwithin=(origin, D(m=199))).count())
        self.assertEqual(1, MyGeoModel.objects.filter(geom__dwithin=(origin, D(m=200))).count())

        self.assertEqual(1, MyGeoModel.objects.filter(data__foo='bar').count())

    def test_if_gdal_works(self):
        shp_path = os.path.join(os.path.dirname(__file__), 'testdata/test_poly.shp')
        
        driver = ogr.GetDriverByName('ESRI Shapefile')
        data_src = driver.Open(shp_path, 0)
        layer = data_src.GetLayer()

        web_mercator = osr.SpatialReference()
        web_mercator.ImportFromEPSG(3857)        
        transform = osr.CoordinateTransformation(layer.GetSpatialRef(), web_mercator)

        self.assertEqual(layer.GetFeatureCount(), 1)

        feat = list(layer)[0]
        geom = feat.GetGeometryRef()
        geom.Transform(transform)
        
        AREA = 4452132000.0 # Calculated in QGIS
        self.assertTrue(abs(geom.GetArea() - AREA) / AREA < 0.001)
        self.assertEqual(feat.GetField("name"), "Narnia")

