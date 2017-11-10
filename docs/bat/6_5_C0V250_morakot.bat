set ps=6_5_C0V250_morakot.ps

rem 設定圖框、刻度、標題等等
gmt gmtset ^
FORMAT_DATE_MAP = yyyy/mm/dd ^
MAP_FRAME_PEN = 3p ^
MAP_TICK_PEN_PRIMARY = 3p ^
FONT_ANNOT_PRIMARY = 16p,4,black ^
FONT_LABEL = 20p,4,black ^
FONT_TITLE = 26p,4,black

rem 繪製雨量長條圖
gmt psbasemap -R2009-08-06T/2009-08-15T/0/150 -JX20/12 ^
-BW+t"Station: C0V250"+g225 -Bxa2D -Bya30+l"Rainfall (mm)" -K > %ps%
awk "{print $1,$2}" C0V250_rain.dat | gmt psxy -R -JX -Sb.1 -G0/14/203 -K -O >> %ps%

rem 繪製累積雨量折線圖
awk "{print $1,$3}" C0V250_rain.dat | gmt psxy -R2009-08-06T/2009-08-15T/0/2200 ^
-JX -W3.5,242/51/51 -K -O >> %ps%
gmt psbasemap -R -JX -BESn -Bxa2D+l"Time (Year/Mon/Day)" ^
-Bya400f200+l"Accumulated Rainfall (mm)" -K -O >> %ps%

gmt psxy -R -J -T -O >> %ps%
gmt psconvert %ps% -Tg -A -P
del gmt.conf