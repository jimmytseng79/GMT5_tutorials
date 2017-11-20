set ps=11_3_taiwan_road.ps
set data=D:\GMT_data\road\

rem 1. road map
gmt psbasemap -R119.8/122.1/21.8/25.4 -JM15 -BWeSn -Ba -P -K > %ps%
gmt pscoast -R -JM -Df -W1 -G80 -S159/229/255 -K -O >> %ps%
gmt psxy %data%provincial_highway.gmt -R -JM -W.4,green -K -O >> %ps%
gmt psxy %data%national_freeway.gmt -R -JM -W1.5,blue -K -O >> %ps%
gmt psxy %data%national_freeway_attach.gmt -R -JM -W.7,purple -K -O >> %ps%
gmt psxy %data%TRA_rail.gmt -R -JM -W2.5,white -K -O >> %ps%
gmt psxy %data%TRA_rail.gmt -R -JM -W2.5,black,4_4:0p -K -O >> %ps%
gmt psxy %data%THSRC_rail.gmt -R -JM -W3,red -K -O >> %ps%
gmt psxy %data%THSRC_rail.gmt -R -JM -W3,black,8_8:0p -K -O >> %ps%
gmt psxy %data%THSRC_station.gmt -R -JM -Ss.5 -W.5 -Gred -K -O >> %ps%

rem 2. legend set
echo 119.83 25.37 > tmp
echo 119.83 24.75 >> tmp
echo 120.60 24.75 >> tmp
echo 120.60 25.37 >> tmp
gmt psxy tmp -R -JM -W2 -L -G200 -K -O >> %ps%
echo 119.86 25.27 Legend | gmt pstext -R -JM -F+f18,2+jML -K -O >> %ps%
echo 119.86 25.15 > tmp
echo 119.96 25.15 >> tmp
gmt psxy tmp -R -JM -W3,green -K -O >> %ps%
echo 120.00 25.15 Provincial Highway | gmt pstext -R -JM -F+f12+jML -K -O >> %ps%
echo 119.86 25.05 > tmp
echo 119.96 25.05 >> tmp
gmt psxy tmp -R -JM -W3,blue -K -O >> %ps%
echo 120.00 25.05 National Freeway | gmt pstext -R -JM -F+f12+jML -K -O >> %ps%
echo 119.86 24.95 > tmp
echo 119.96 24.95 >> tmp
gmt psxy tmp -R -JM -W3,white -K -O >> %ps%
gmt psxy tmp -R -JM -W3,black,4_4:0p -K -O >> %ps%
echo 120.00 24.95 TRA Rail | gmt pstext -R -JM -F+f12+jML -K -O >> %ps%
echo 119.86 24.85 > tmp
echo 119.96 24.85 >> tmp
gmt psxy tmp -R -JM -W3,red -K -O >> %ps%
gmt psxy tmp -R -JM -W3,black,4_4:0p -K -O >> %ps%
echo 120.00 24.85 THSRC Rail | gmt pstext -R -JM -F+f12+jML -K -O >> %ps%

gmt psxy -R -J -T -O >> %ps%
gmt psconvert %ps% -Tg -A -P
del tmp*