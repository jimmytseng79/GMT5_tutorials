set ps=8_4_yangmingShan.ps
set cpt=dem1.cpt

rem 1. default dem1.cpt
gmt grdimage yangmingShan.grd -R121.27/121.85/25.05/25.35 -JM13 -BWeSn -Ba ^
-C%cpt% -P -Y21 -K > %ps%
gmt pscoast -R -JM -Df -W1 -S34/201/237 -K -O >> %ps%
gmt psscale -C%cpt% -Dx14/0+w7/.5+e -Ba100+l"Elevation (m)" -K -O >> %ps%
echo 121.3 25.32 1. | gmt pstext -R -JM -F+f24p -G250 -K -O >> %ps%

rem 2. discrete 0~1200 dem1.cpt 
makecpt -C%cpt% -T0/1200/100 > tmp.cpt
gmt grdimage yangmingShan.grd -R121.27/121.85/25.05/25.35 -JM13 -BWeSn -Ba -Ctmp.cpt ^
-M -Y-9 -K -O >> %ps%
gmt pscoast -R -JM -Df -W1 -S34/201/237 -K -O >> %ps%
gmt psscale -Ctmp.cpt -Dx14/0+w7/.5 -Ba200+l"Elevation (m)" -M -K -O >> %ps%
echo 121.3 25.32 2. | gmt pstext -R -JM -F+f24p -G250 -K -O >> %ps%

rem 3. continuous 0~1200 dem1.cpt 
makecpt -C%cpt% -T0/1200/100 -Z > tmp.cpt
gmt grdimage yangmingShan.grd -R121.27/121.85/25.05/25.35 -JM13 -BWeSn -Ba -Ctmp.cpt ^
-Y-9 -K -O >> %ps%
gmt pscoast -R -JM -Df -W1 -S34/201/237 -K -O >> %ps%
gmt psscale -Ctmp.cpt -Dx14/0+w7/.5 -Ba200+l"Elevation (m)" -I -K -O >> %ps%
echo 121.3 25.32 3. | gmt pstext -R -JM -F+f24p -G250 -K -O >> %ps%

gmt psxy -R -J -T -O >> %ps%
gmt psconvert %ps% -Tg -A -P
del tmp*