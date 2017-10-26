set ps=7_4_east_rift_valley.ps

rem left figure without clip
gmt pscoast -R121.33/121.68/23.55/24.1 -JM10 -BWeSn -Bxa.2 -Bya.2 ^
-Df -W1 -G194/250/216 -S175/243/255 -K > %ps%
gmt grdcontour east_rift_valley.grd -R -JM -C250 -A1000+f12p -K -O >> %ps%

rem right figure with clip
gmt pscoast -R121.33/121.68/23.55/24.1 -JM10 -BWeSn -Bxa.2 -Bya.2 ^
-Df -W1 -G194/250/216 -S175/243/255 -X13 -K -O >> %ps%
gmt pscoast -R -JM -Df -Gc -K -O >> %ps%
gmt grdcontour east_rift_valley.grd -R -JM -C250 -A1000+an+f12p+g255/153/199 ^
-Gd15c -Wc.5,255/110/110 -Wa1,180/13/13 -Q180 -K -O >> %ps%
gmt pscoast -R -JM -Q -K -O >> %ps%

gmt psxy -R -JM -T -O >> %ps%
gmt psconvert %ps% -Tg -A -P
