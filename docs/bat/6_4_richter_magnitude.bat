set ps=6_4_richter_magnitude.ps

rem 製作左側圖
gmt psbasemap -R0/9.99/1e0/9.99e9 -JX9/15l -BWeSn -Bxa1+l"Richter Mag." ^
-Bya1pf3+l"Maximum Amp. (Microns)" -K > %ps%
gmt psxy richter_magnitude.dat -R -JX -W1 -K -O >> %ps%
echo 7.3 7.3e6 1999 Chi-Chi > tmp
echo 6.6 6.6e5 2016 Meinong >> tmp
gmt psxy tmp -R -JX -Sc.6 -G0 -K -O >> %ps%
gmt pstext tmp -R -JX -F+f14p+jMR -D-.6/0 -K -O >> %ps%

rem 製作右側圖
gmt psbasemap -R0/9.99/1e-2/9.99 -JX9/15p2 -BWeSn -Bxa1+l"Magnitude" ^
-Bya1f.2g1+l"Log of Maximum Amp. (Microns)" -X12 -K -O >> %ps%
gmt psxy richter_magnitude_log.dat -R -JX -W1 -K -O >> %ps%
for /l %%x in (1, 1, 9) do (
awk "$2==%%x {print $1, $2}" richter_magnitude_log.dat | ^
gmt psxy -R -JX -Sc.5 -G255 -K -O >> %ps%)
for /l %%x in (1, 1, 9) do (
awk "$2==%%x {print $1, $2, %%x}" richter_magnitude_log.dat | ^
gmt pstext -R -JX -F+f14p -K -O >> %ps%)
echo 2.7 1.7 NOT FELT > tmp
echo 4.2 3.4 MINOR >> tmp
echo 5.2 4.5 SMALL >> tmp
echo 6 5.5 MODERATE >> tmp
echo 7 6.5 STRONG >> tmp
echo 8 7.5 MAJOR >> tmp
echo 8.2 8.5 GREAT >> tmp
gmt pstext tmp -R -JX -F+f12p+jML -K -O >> %ps%
echo 7.7 9.2 RICHTER SCALE | gmt pstext -R -JX -F+f22p,1+jMR -K -O >> %ps%
echo 7.5 8.9 A | gmt pstext -R -JX -F+f18p,2+jMR -K -O >> %ps%
echo 7.4 8.7 GRAPHIC | gmt pstext -R -JX -F+f18p,2+jMR -K -O >> %ps%
echo 7.3 8.5 REPRESENTATION | gmt pstext -R -JX -F+f18p,2+jMR -K -O >> %ps%

gmt psxy -R -J -T -O >> %ps%
gmt psconvert %ps% -Tg -A -P
del tmp