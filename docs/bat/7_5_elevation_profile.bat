rem 1. set two profile start point and end point
set ps=7_5_elevation_profile.ps
set Alon1=121.38
set Alat1=24.07
set Alon2=121.5
set Alat2=23.6
set Blon1=121.54
set Blat1=24.06
set Blon2=121.47
set Blat2=24.0   

rem 2. contour basemap
gmt pscoast -R121.33/121.68/23.55/24.1 -JM10 -BWeSn -Bxa.2 -Bya.2 ^
-Df -W1 -G194/250/216 -S175/243/255 -K --MAP_FRAME_TYPE=plain > %ps%
gmt pscoast -R -JM -Df -Gc -K -O >> %ps%
gmt grdcontour east_rift_valley.grd -R -JM -C250 -A1000+f10p ^
-Wc.5,150 -Wa1,30 -Q180 -K -O >> %ps%
gmt pscoast -R -JM -Q -K -O >> %ps%

rem 3. AA' line
echo %Alon1% %Alat1% > tmp
echo %Alon2% %Alat2% >> tmp
gmt psxy tmp -R -JM -W2,238/91/78 -K -O >> %ps%
echo %Alon1% %Alat1% A > tmp
gmt psxy tmp -R -JM -Sc.8 -G238/91/78 -W1 -K -O >> %ps% 
gmt pstext tmp -R -JM -F+f16p,0,blue -K -O >> %ps%
echo %Alon2% %Alat2% A' > tmp
gmt psxy tmp -R -JM -Sc.8 -G238/91/78 -W1 -K -O >> %ps% 
gmt pstext tmp -R -JM -F+f16p,0,blue -K -O >> %ps%

rem 4. BB' line
echo %Blon1% %Blat1% > tmp
echo %Blon2% %Blat2% >> tmp
gmt psxy tmp -R -JM -W2,234/235/128 -K -O >> %ps%
echo %Blon1% %Blat1% B > tmp
gmt psxy tmp -R -JM -Sc.8 -G234/235/128 -W1 -K -O >> %ps% 
gmt pstext tmp -R -JM -F+f16p -K -O >> %ps%
echo %Blon2% %Blat2% B' > tmp
gmt psxy tmp -R -JM -Sc.8 -G234/235/128 -W1 -K -O >> %ps% 
gmt pstext tmp -R -JM -F+f16p -K -O >> %ps%

rem 5. insert map
gmt pscoast -R119.9/122.1/21.8/25.4 -JM3 -Bwesn -Ba -Df -W1 -S255 -G230 ^
-X7 -K -O --MAP_FRAME_TYPE=inside >> %ps%
gmt psbasemap -R -JM -D121.33/121.68/23.55/24.1 -F+p2 -K -O >> %ps%

rem 6. AA' profile
gmt project -C%Alon1%/%Alat1% -E%Alon2%/%Alat2% -G0.1 -Q | ^
gmt grdtrack -Geast_rift_valley.grd > tmp
gmtinfo tmp -i2,3 -I1/10 > tmp1
set /p pr=<tmp1
gmtinfo tmp -i2 -C -o1 > tmp1
set /p md=<tmp1
sed -i '1i %Alon1% %Alat1% 0 0' tmp
sed -i '$a %Alon2% %Alat2% %md% 0' tmp
awk "{print $3, $4}" tmp | gmt psxy %pr% -JX12/6 -W2 -G238/91/78 -X5 -Y.5 -K -O >> %ps%
gmt psbasemap -R -JX -BwESn+t"AA' Profile" -Bxa+l"Distance (km)" ^
-Bya+l"Elevation (m)" -K -O --FONT_TITLE=24p,0,blue >> %ps%

rem 7. BB' profile
gmt project -C%Blon1%/%Blat1% -E%Blon2%/%Blat2% -G0.1 -Q | ^
gmt grdtrack -Geast_rift_valley.grd > tmp
gmtinfo tmp -i2,3 -I1/10 > tmp1
set /p pr=<tmp1
gmtinfo tmp -i2 -C -o1 > tmp1
set /p md=<tmp1
sed -i '1i %Blon1% %Blat1% 0 0' tmp
sed -i '$a %Blon2% %Blat2% %md% 0' tmp
awk "{print $3, $4}" tmp | gmt psxy %pr% -JX -W2 -G234/235/128 -Y9 -K -O >> %ps%
gmt psbasemap -R -JX -BwESn+t"BB' Profile" -Bxa -Bya+l"Elevation (m)" -K -O >> %ps%

gmt psxy -R -J -T -O >> %ps%
gmt psconvert %ps% -Tg -A -P
del tmp*