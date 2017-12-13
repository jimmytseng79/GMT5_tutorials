set ps=9_5_focal_profile.ps
set data=D:\GMT_data\
set cpt=seis.cpt
set lon1=122.3
set lat1=25.3
set lon2=121.1
set lat2=21.6
set width1=20
set width2=20

rem 1. focal meca and seismicity basemap
gmt psbasemap -R119/123/21/26 -JM10 -BWeSN -Bxa -Bya -K > %ps%
gmt grdimage %data%ETOPO1_Bed_g_gmt5.grd -R -JM -Cgebco.cpt ^
-I%data%ETOPO1_Bed_g_gmt5_shad.grd -M -K -O >> %ps%
gmt pscoast -R -JM -Df -W1 -K -O >> %ps%
gmt pscoast -R -JM -Df -Gc -K -O >> %ps%
gmt grdimage %data%tw_40.grd -R -JM -Cgebco.cpt ^
-I%data%tw_40shad.grd -M -K -O >> %ps%
gmt pscoast -R -JM -Df -Q -K -O >> %ps%
gmt gmtinfo 2017_catalog.gmt -i2 -T20 > tmp
set /p cr=<tmp
gmt makecpt -C%cpt% %cr% > tmp.cpt
awk "{print $1,$2,$3,exp($4)*0.002}" 2017_catalog.gmt | ^
gmt psxy -R -JM -Ctmp.cpt -Sc -K -O >> %ps%
awk "{print $1,$2,$3,$4,$5,$6,$7,$8,$9}" focal_mechanism.gmt | ^
gmt psmeca -R -JM -Sa.5 -Ggray -K -O >> %ps%

rem 2. convert km to degree
echo %width1% 110.4 | awk "{print $1/$2}" > tmp
set /p wid1=<tmp
echo %width2% 110.4 | awk "{print $1/$2}" > tmp
set /p wid2=<tmp

rem 3. cross area
gmt project 2017_catalog.gmt -C%lon1%/%lat1% -E%lon2%/%lat2% ^
-W-%wid1%/%wid2% > catalog_profile.gmt
gmt project focal_mechanism.gmt -C%lon1%/%lat1% -E%lon2%/%lat2% ^
-W-%wid1%/%wid2% > focal_profile.gmt
rem left-lateral strike-slip
awk "{if ($6>=-20 && $6<20) print $1,$2,$3,$4,$5,$6,$7,$8,$9}" focal_profile.gmt | ^
gmt psmeca -R -JM -Sa.5 -Gyellow -K -O >> %ps%
rem right-lateral strike-slip
awk "{if ($6>=160 || $6<-160) print $1,$2,$3,$4,$5,$6,$7,$8,$9}" focal_profile.gmt | ^
gmt psmeca -R -JM -Sa.5 -Gyellow -K -O >> %ps%
rem reverse fault
awk "{if ($6>=20 && $6<160) print $1,$2,$3,$4,$5,$6,$7,$8,$9}" focal_profile.gmt | ^
gmt psmeca -R -JM -Sa.5 -Gred -K -O >> %ps%
rem normal fault
awk "{if ($6>=-160 && $6<-20) print $1,$2,$3,$4,$5,$6,$7,$8,$9}" focal_profile.gmt | ^
gmt psmeca -R -JM -Sa.5 -Gblue -K -O >> %ps%
echo %lon1% %lat1% > tmp
echo %lon2% %lat2% >> tmp
gmt psxy tmp -R -JM -W3 -K -O >> %ps%
echo %lon1% %lat1% A | gmt pstext -R -JM -F+f16p,1,darkgreen -G230 -K -O >> %ps%
echo %lon2% %lat2% A'| gmt pstext -R -JM -F+f16p,1,darkgreen -G230 -K -O >> %ps%

echo 120.4 25.6 Profile Width: %width1%/%width2% km | ^
gmt pstext -R -JM -F+f14p,1+jML -K -O >> %ps%

rem 4. seismicity profile
gmt psbasemap -R0/100/21/26 -JX6/13.56 -BwESn -Bxa+l"Depth (km)" ^
-Bya+l"Latitude (degree)" -X11 -K -O >> %ps%
awk "{print $3,$2,$3,exp($4)*0.002}" catalog_profile.gmt | ^
gmt psxy -R -JX -Ctmp.cpt -Sc -K -O >> %ps%
awk "{if ($6>=-20 && $6<20) print $3,$2,$3,$4,$5,$6,$7,$8,$9}" focal_profile.gmt | ^
gmt psmeca -R -JX -Sa.5 -Gyellow -K -O >> %ps%
awk "{if ($6>=160 || $6<-160) print $3,$2,$3,$4,$5,$6,$7,$8,$9}" focal_profile.gmt | ^
gmt psmeca -R -JX -Sa.5 -Gyellow -K -O >> %ps%
awk "{if ($6>=20 && $6<160) print $3,$2,$3,$4,$5,$6,$7,$8,$9}" focal_profile.gmt | ^
gmt psmeca -R -JX -Sa.5 -Gred -K -O >> %ps%
awk "{if ($6>=-160 && $6<-20) print $3,$2,$3,$4,$5,$6,$7,$8,$9}" focal_profile.gmt | ^
gmt psmeca -R -JX -Sa.5 -Gblue -K -O >> %ps%
echo 5 25.8 AA' Profile | gmt pstext -R -JX -F+f16p,1+jML -K -O >> %ps%

gmt psxy -R -J -T -O >> %ps%
gmt psconvert %ps% -Tg -A -P
del tmp*