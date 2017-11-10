set ps=7_6_yuShan.ps

rem Mountain peak info
echo 120.954440 23.47000 Main > tmp
echo 120.959700 23.48740 North >> tmp
echo 120.965700 23.47080 East >> tmp
echo 120.958800 23.44660 South >> tmp
echo 120.933749 23.47186 West >> tmp

rem contour basemap
gmt grdcontour yuShan.grd -R120.9/121.01/23.41/23.53 -JM12 -BWeSn -Ba ^
-C100 -A500+f8p -Wc.5,180 -Wa1,80 -K > %ps%
echo 120.954440 23.47000 > tmp1
echo 120.959700 23.48740 >> tmp1
gmt psxy tmp1 -R -JM -W5,167/123/202 -K -O >> %ps%
echo 120.954440 23.47000 > tmp1
echo 120.965700 23.47080 >> tmp1
gmt psxy tmp1 -R -JM -W5,235/111/189 -K -O >> %ps%
echo 120.954440 23.47000 > tmp1
echo 120.958800 23.44660 >> tmp1
gmt psxy tmp1 -R -JM -W5,122/114/86 -K -O >> %ps%
echo 120.954440 23.47000 > tmp1
echo 120.933749 23.47186 >> tmp1
gmt psxy tmp1 -R -JM -W5,0/163/224 -K -O >> %ps%
gmt psxy tmp -R -JM -St.7 -G254/173/119 -W1 -K -O >> %ps%
gmt pstext tmp -R -JM -F+12p -G255 -D0/.6 -K -O >> %ps%

gmt pscoast -R119.9/122.1/21.8/25.4 -JM3 -Bwesn -Ba -Df -W1 -S255 -G230 ^
-K -O --MAP_FRAME_TYPE=inside >> %ps%
gmt psbasemap -R -JM -D120.9/121.01/23.41/23.53 -F+p2 -K -O >> %ps%

gmt gmtset FONT_TITLE=16p,0,black MAP_TITLE_OFFSET=3p
rem M-N profile
gmt project -C120.954440/23.47000 -E120.959700/23.48740 -G0.01 -Q | ^
gmt grdtrack -GyuShan.grd > tmp
gmt gmtinfo tmp -i2,3 -I.01/10 > tmp1
set /p pr=<tmp1
gmt gmtinfo tmp -i2 -Cmax -o1 > tmp1
set /p md=<tmp1
sed -i '1i 0 0 0 0' tmp
sed -i '$a 0 0 %md% 0' tmp
awk "{print $3, $4}" tmp | gmt psxy %pr% -JX12/3 -W2 -G167/123/202 -X13 -K -O >> %ps%
gmt psbasemap -R -JX -BwESn+t"Main-North Profile" -Bxa+l"Distance (km)" ^
-Bya+l"Elevation (m)" -K -O >> %ps%

rem M-E profile
gmt project -C120.954440/23.47000 -E120.965700/23.47080 -G0.01 -Q | ^
gmt grdtrack -GyuShan.grd > tmp
gmt gmtinfo tmp -i2,3 -I.01/10 > tmp1
set /p pr=<tmp1
gmt gmtinfo tmp -i2 -Cmax -o1 > tmp1
set /p md=<tmp1
sed -i '1i 0 0 0 0' tmp
sed -i '$a 0 0 %md% 0' tmp
awk "{print $3, $4}" tmp | gmt psxy %pr% -JX12/3 -W2 -G235/111/189 -Y4.5 -K -O >> %ps%
gmt psbasemap -R -JX -BwESn+t"Main-East Profile" -Bxa -Bya -K -O >> %ps%

rem M-S profile
gmt project -C120.954440/23.47000 -E120.958800/23.44660 -G0.01 -Q | ^
gmt grdtrack -GyuShan.grd > tmp
gmt gmtinfo tmp -i2,3 -I.01/10 > tmp1
set /p pr=<tmp1
gmt gmtinfo tmp -i2 -Cmax -o1 > tmp1
set /p md=<tmp1
sed -i '1i 0 0 0 0' tmp
sed -i '$a 0 0 %md% 0' tmp
awk "{print $3, $4}" tmp | gmt psxy %pr% -JX12/3 -W2 -G122/114/86 -Y4.5 -K -O >> %ps%
gmt psbasemap -R -JX -BwESn+t"Main-South Profile" -Bxa -Bya -K -O >> %ps%

rem M-W profile
gmt project -C120.954440/23.47000 -E120.933749/23.47186 -G0.01 -Q | ^
gmt grdtrack -GyuShan.grd > tmp
gmt gmtinfo tmp -i2,3 -I.01/10 > tmp1
set /p pr=<tmp1
gmt gmtinfo tmp -i2 -Cmax -o1 > tmp1
set /p md=<tmp1
sed -i '1i 0 0 0 0' tmp
sed -i '$a 0 0 %md% 0' tmp
awk "{print $3, $4}" tmp | gmt psxy %pr% -JX12/3 -W2 -G0/163/224 -Y4.5 -K -O >> %ps%
gmt psbasemap -R -JX -BwESn+t"Main-West Profile" -Bxa -Bya -K -O >> %ps%

gmt psxy -R -J -T -O >> %ps%
gmt psconvert %ps% -Tg -A -P
del tmp* gmt.conf
