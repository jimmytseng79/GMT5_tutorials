set ps=5_7_youBike.ps
set data=D:\GMT_data\

gmt pscoast -R121.263/122.077/24.671/25.343 -JM15 -BWeSn -Ba -Df -W1 ^
-S0/163/224 -G173/220/145 -K > %ps%
gmt psxy %data%city_twd97.gmt -R -JM -W.5 -K -O >> %ps%
awk -F "," "NR!=1 {print $8,$7}" newTaipeiCity_youBike.csv | ^
gmt psxy -R -JM -St.2 -W.1 -G239/149/207 -O >> %ps%

gmt psconvert %ps% -Tg -A -P