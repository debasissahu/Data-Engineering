-- Convert Lat Long to Point GEOM
SELECT ST_SetSRID(ST_MakePoint(Long, Lat),4326);

-- Get let long from GEOM --
SELECT ST_Y(geom) as Lat,ST_X(geom) As Long FROM TABLE NAME;

--Create buffer from geom (0.01 -> 1 KM)
ST_Multi(ST_Buffer(geom_point, 0.90))

--INTERSECTION
Select ST_Intersection(public.assam_ac_utm_valid.geom, public.assam_district_utm.geom) 
FROM assam_ac_utm_valid, public.assam_district_utm;

-- Catchment wise district intersect village data --
Select pol.name, pa.*,pin.pincode, pd.*, ST_Y(v.geom) as Lat,ST_X(v.geom) As Long 
from suryoday1_25km pol, vilwgs v, pca_administrative pa, pca_demographic pd, oneindia_pindex pin, india_dist_name dis  where ST_Intersects(pol.geom, dis.geom) and ST_Intersects(dis.geom, v.geom) and ST_Intersects(pin.geom,v.geom) and v.census_code=pa.census_code and v.census_code=pd.census_code;

-- Catchment intersect villages -- 
Select pol.name, pa.*,pin.pincode, pd.*, ST_Y(v.geom) as Lat,ST_X(v.geom) As Long 
from suryoday1_25km pol, vilwgs v, pca_administrative pa, pca_demographic pd, oneindia_pindex pin where ST_Intersects(pol.geom, v.geom) and ST_Intersects(pin.geom,v.geom) and v.census_code=pa.census_code and v.census_code=pd.census_code

--convert multi point
ALTER TABLE abcd_table ALTER COLUMN geom TYPE geometry(MultiPoint,4326) USING ST_Multi(geom);
                   
--MultiPolygonZ to MultiPolygon
ALTER TABLE new_tehsil_gis_upload ALTER COLUMN geom TYPE geometry(MultiPolygon,4326) USING ST_Multi(ST_Force2D(geom));

--Convert multi pointo to point 
Alter table guj_pollingbooth_not_matched ALTER COLUMN geom TYPE geometry(Point,4326) USING ST_GeometryN(geom, 1);

--invalid geom view
select ward, ST_IsValid(geom) As bad_poly FROM chilis_hyd_revised_wards;

SELECT ward, reason(ST_IsValidDetail(geom)), ST_AsText(location(ST_IsValidDetail(geom))) as location 
FROM chilis_hyd_revised_wards;

--Polygon centroid
Select ST_SetSRID(ST_Centroid(geom),4326) from table name;
