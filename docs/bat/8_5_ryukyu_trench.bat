set ps=8_5_ryukyu_trench.ps
set data=D:\GMT_data\
set dcpt=colomia_d.cpt
set ucpt=colomia_u.cpt

gmt grdinfo %data%ETOPO1_Bed_g_gmt5.grd -R121.2/132.0/22.88/31.0 -C -I1 > tmp
for /f %%i in ('awk "{print $6}" tmp') do set minz=%%i
gmt makecpt -C%dcpt% -T%minz%/0/1000 -D -Z > tmp.cpt
rem gmt grd2cpt %data%ETOPO1_Bed_g_gmt5.grd -C%cpt% -R > tmp.cpt
gmt grdimage %data%ETOPO1_Bed_g_gmt5.grd -R -JM17 -BWeSn -Ba ^
-Ctmp.cpt -I%data%ETOPO1_Bed_g_gmt5_shad.grd -K > %ps%
gmt psscale -Ctmp.cpt -Dx19/1.5+w10/.5+e+ml -Bxa1000+l"Bathymetry" -By+l"km" -K -O >> %ps%

gmt pscoast -R -JM -Di -W1 -G189/204/150 -K -O >> %ps%
gmt pscoast -R -JM -Df -Gc -K -O >> %ps%
gmt grdinfo %data%tw_40.grd -R -C -I1 > tmp
for /f %%i in ('awk "{print $7}" tmp') do set maxz=%%i
gmt makecpt -C%ucpt% -T0/%maxz%/500 -D -Z > tmp.cpt
rem grdinfo %data%tw_20.grd -R -T500 > tmp
rem set /p T=<tmp
rem makecpt -C%cpt% %T% -Z > tmp.cpt
gmt grdimage %data%tw_40.grd -R -JM -Ctmp.cpt -I%data%tw_40shad.grd -K -O >> %ps%
gmt pscoast -R -JM -Df -Q -K -O >> %ps%
gmt psscale -Ctmp.cpt -Dx22.5/1.5+w10/.5+e+ml -Bxa500+l"Topography" -By+l"km" -K -O >> %ps%

gmt psxy -R -JM -T -O >> %ps%
gmt psconvert %ps% -Tg -A -P
del tmp*
