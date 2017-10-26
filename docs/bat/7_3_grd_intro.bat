rem tif to xyz
gdal_translate -of XYZ Penghu_20m.tif Penghu_20m.xyz
rem twd97 to wgs84
python trans_script.py
rem xyz to grd
gmt xyz2grd Penghu_20m_wgs84.xyz -R119.0/119.9/21.8/25.4 -I0.6s/0.6s -GPenghu_20m_wgs84.grd

gdal_translate -of XYZ dem_20m.tif dem_20m.xyz
python trans_script.py
gmt xyz2grd dem_20m_wgs84.xyz -R119.0/119.9/21.8/25.4 -I0.6s/0.6s -Gdem_20m_wgs84.grd

gmt grdpaste dem_20m_wgs84.grd Penghu_20m_wgs84.grd -Gtw_20.grd -fg
gmt grdcut tw_20.grd -Geast_rift_valley.grd -R121.33/121.68/23.55/24.1
