set ps=9_4_taiwan_focal.ps
set data=D:\GMT_data\

rem 1. focal meca basemap
gmt psbasemap -R119/123/21/26 -JM15 -BWeSn -Bxa -Bya -P -K > %ps%
gmt grdimage %data%ETOPO1_Bed_g_gmt5.grd -R -JM -Cgebco.cpt ^
-I%data%ETOPO1_Bed_g_gmt5_shad.grd -K -O >> %ps%
gmt pscoast -R -JM -Df -W1 -G230 -K -O >> %ps%
rem left-lateral strike-slip
awk "{if ($6>=-20 && $6<20) print $1,$2,$3,$4,$5,$6,$7,$8,$9}" focal_mechanism.gmt | ^
gmt psmeca -R -JM -Sa.5 -Gyellow -K -O >> %ps%
rem right-lateral strike-slip
awk "{if ($$6>=160 || 6<-160) print $1,$2,$3,$4,$5,$6,$7,$8,$9}" focal_mechanism.gmt | ^
gmt psmeca -R -JM -Sa.5 -Gyellow -K -O >> %ps%
rem reverse fault
awk "{if ($6>=20 && $6<160) print $1,$2,$3,$4,$5,$6,$7,$8,$9}" focal_mechanism.gmt | ^
gmt psmeca -R -JM -Sa.5 -Gred -K -O >> %ps%
rem normal fault
awk "{if ($6>=-160 && $6<-20) print $1,$2,$3,$4,$5,$6,$7,$8,$9}" focal_mechanism.gmt | ^
gmt psmeca -R -JM -Sa.5 -Gblue -K -O >> %ps%

rem 2. earthquake event
echo 120.54 22.93 16 288.36 51.02 19.79 6.11 119.2 26.5 Meinong > tmp
echo 120.56 21.89 41 118.64 50.07 -128.06 6.7 119.9 26.5 Hengchun >> tmp
echo 120.73 23 18 318.05 41.39 67.64 5.66 120.6 26.5 Jiashian >> tmp
echo 121.75 23.78 41 237.95 37.03 120.73 6.26 121.3 26.5 Hualien >> tmp
echo 120.797500 23.861667 8.140 320.06 57.39 66.04 7.30 122.0 26.5 Chi-Chi >> tmp
echo 121.3982 23.0667 18 8.82 42.16 72.8 6.58 122.7 26.5 Chengkung >> tmp
gmt psmeca tmp -R -JM -Sa1/14p/6 -Gblack -C1 -N -K -O >> %ps%

rem 3. legend set
echo 119 26 > tmp
echo 119 25.05 >> tmp
echo 120.5 25.05 >> tmp
echo 120.5 26 >> tmp
gmt psxy tmp -R -JM -G255 -W.5 -D.1/-.1 -K -O >> %ps%
echo 119.2 25.8 0 0 90 0 5 | gmt psmeca -JM -R -Sa1 -Gyellow -K -O >> %ps%
echo 119.4 25.8 Strike-Slip Fault | gmt pstext -JM -R -F+f14p+jML -K -O >> %ps%
echo 119.2 25.5 0 0 45 90 5 | gmt psmeca -JM -R -Sa1 -Gred -K -O >> %ps%
echo 119.4 25.5 Thrust Fault | gmt pstext -JM -R -F+f14p+jML -K -O >> %ps%
echo 119.2 25.2 0 0 45 -90 5 | gmt psmeca -JM -R -Sa1 -Gblue -K -O >> %ps%
echo 119.4 25.2 Normal Fault | gmt pstext -JM -R -F+f14p+jML -K -O >> %ps%

gmt psxy -R -J -T -O >> %ps%
gmt psconvert %ps% -Tg -A -P
del tmp*