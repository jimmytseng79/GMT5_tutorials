rem 1. set two profile start point and end point
set ps=7_5_elevation_profile.ps
set A_lon1=121.38
set A_lat1=24.07
set A_lon2=121.5
set A_lat2=23.6
set B_lon1=121.54
set B_lat1=24.06
set B_lon2=121.47
set B_lat2=24.0   

rem 2. contour basemap
gmt pscoast -R121.33/121.68/23.55/24.1 -JM10 -BWeSn -Bxa.2 -Bya.2 ^
-Df -W1 -G194/250/216 -S175/243/255 -K --MAP_FRAME_TYPE=plain > %ps%
gmt pscoast -R -JM -Df -Gc -K -O >> %ps%
gmt grdcontour east_rift_valley.grd -R -JM -C250 -A1000+f10p ^
-Wc.5,150 -Wa1,30 -Q180 -K -O >> %ps%
gmt pscoast -R -JM -Q -K -O >> %ps%

rem 3. AA' line
echo %A_lon1% %A_lat1% > tmp
echo %A_lon2% %A_lat2% >> tmp
gmt psxy tmp -R -JM -W2,238/91/78 -K -O >> %ps%
echo %A_lon1% %A_lat1% A > tmp
gmt psxy tmp -R -JM -Sc.8 -G238/91/78 -W1 -K -O >> %ps% 
gmt pstext tmp -R -JM -F+f16p,0,blue -K -O >> %ps%
echo %A_lon2% %A_lat2% A' > tmp
gmt psxy tmp -R -JM -Sc.8 -G238/91/78 -W1 -K -O >> %ps% 
gmt pstext tmp -R -JM -F+f16p,0,blue -K -O >> %ps%

rem 4. BB' line
echo %B_lon1% %B_lat1% > tmp
echo %B_lon2% %B_lat2% >> tmp
gmt psxy tmp -R -JM -W2,234/235/128 -K -O >> %ps%
echo %B_lon1% %B_lat1% B > tmp
gmt psxy tmp -R -JM -Sc.8 -G234/235/128 -W1 -K -O >> %ps% 
gmt pstext tmp -R -JM -F+f16p -K -O >> %ps%
echo %B_lon2% %B_lat2% B' > tmp
gmt psxy tmp -R -JM -Sc.8 -G234/235/128 -W1 -K -O >> %ps% 
gmt pstext tmp -R -JM -F+f16p -K -O >> %ps%

rem 5. insert map
gmt pscoast -R119.9/122.1/21.8/25.4 -JM3 -Bwesn -Ba -Df -W1 -S255 -G230 ^
-X7 -K -O --MAP_FRAME_TYPE=inside >> %ps%
gmt psbasemap -R -JM -D121.33/121.68/23.55/24.1 -F+p2 -K -O >> %ps%

rem 6. AA' profile
gmt project -C%A_lon1%/%A_lat1% -E%A_lon2%/%A_lat2% -G0.1 -Q | ^
gmt grdtrack -Geast_rift_valley.grd > tmp
gmtinfo tmp -i2,3 -I1/10 > tmp1
set /p pr=<tmp1
gmtinfo tmp -i2 -C -o1 > tmp1
set /p md=<tmp1
sed -i '1i %A_lon1% %A_lat1% 0 0' tmp
sed -i '$a %A_lon2% %A_lat2% %md% 0' tmp
awk "{print $3, $4}" tmp | gmt psxy %pr% -JX12/6 -W2 -G238/91/78 -X5 -Y.5 -K -O >> %ps%
gmt psbasemap -R -JX -BwESn+t"AA' Profile" -Bxa+l"Distance (km)" ^
-Bya+l"Elevation (m)" -K -O --FONT_TITLE=24p,0,blue >> %ps%

rem 7. BB' profile
gmt project -C%B_lon1%/%B_lat1% -E%B_lon2%/%B_lat2% -G0.1 -Q | ^
gmt grdtrack -Geast_rift_valley.grd > tmp
gmtinfo tmp -i2,3 -I1/10 > tmp1
set /p pr=<tmp1
gmtinfo tmp -i2 -C -o1 > tmp1
set /p md=<tmp1
sed -i '1i %B_lon1% %B_lat1% 0 0' tmp
sed -i '$a %B_lon2% %B_lat2% %md% 0' tmp
awk "{print $3, $4}" tmp | gmt psxy %pr% -JX -W2 -G234/235/128 -Y9 -K -O >> %ps%
gmt psbasemap -R -JX -BwESn+t"BB' Profile" -Bxa -Bya+l"Elevation (m)" -K -O >> %ps%

gmt psxy -R -J -T -O >> %ps%
gmt psconvert %ps% -Tg -A -P
del tmp*