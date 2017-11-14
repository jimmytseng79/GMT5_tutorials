set ps=10_3_vector.ps

gmt psbasemap -R0/19/0/15 -JX19/15 -BWESN -Bag1 -K > %ps%

rem 1. -Sv
echo 2 1 0 1.5 | gmt psxy -R -JX -Sv.5+e -W1.5 -Gred -K -O >> %ps%
echo 1.8 1 0\260 | gmt pstext -R -JX -F+f14p,1+jMR -G255 -K -O >> %ps%
echo 2 1.5 90 1.5 | gmt psxy -R -JX -Sv.5+e -W1.5 -Gred -K -O >> %ps%
echo 1.8 2 90\260 | gmt pstext -R -JX -F+f14p,1+jMR -G255 -K -O >> %ps%
echo 2 3.5 180 1.5 | gmt psxy -R -JX -Sv.5+e -W1.5 -Gred -K -O >> %ps%
echo 2.2 3.5 180\260 | gmt pstext -R -JX -F+f14p,1+jML -G255 -K -O >> %ps%
echo 2 5.5 270 1.5 | gmt psxy -R -JX -Sv.5+e -W1.5 -Gred -K -O >> %ps%
echo 2.2 5 270\260 | gmt pstext -R -JX -F+f14p,1+jML -G255 -K -O >> %ps%
echo 1.25 6.25 -Sv | gmt pstext -R -JX -F+f18p,1+jML -G255 -K -O >> %ps%

rem 2. -SV
echo 6 1 0 1.5 | gmt psxy -R -JX -SV.5+e -W1.5 -Gred -K -O >> %ps%
echo 5.8 1.5 0\260 | gmt pstext -R -JX -F+f14p,1+jMR -G255 -K -O >> %ps%
echo 6 3.0 90 1.5 | gmt psxy -R -JX -SV.5+e -W1.5 -Gred -K -O >> %ps%
echo 5.8 3.0 90\260 | gmt pstext -R -JX -F+f14p,1+jMR -G255 -K -O >> %ps%
echo 6 5.0 180 1.5 | gmt psxy -R -JX -SV.5+e -W1.5 -Gred -K -O >> %ps%
echo 6.2 4.5 180\260 | gmt pstext -R -JX -F+f14p,1+jML -G255 -K -O >> %ps%
echo 6 5.5 270 1.5 | gmt psxy -R -JX -SV.5+e -W1.5 -Gred -K -O >> %ps%
echo 6.2 5.5 270\260 | gmt pstext -R -JX -F+f14p,1+jML -G255 -K -O >> %ps%
echo 5.25 6.25 -SV | gmt pstext -R -JX -F+f18p,1+jML -G255 -K -O >> %ps%

rem 3. -Sm
echo 1 7 2 0 90 | gmt psxy -R -JX -Sm0.2i+e -W1.5 -Gred -K -O >> %ps%
echo 1 7.5 0~90\260 | gmt pstext -R -JX -F+f14p,1+jML -G255 -K -O >> %ps%
echo 5 9 2 270 450 | gmt psxy -R -JX -Sm0.2i+e -W1.5 -Gred -K -O >> %ps%
echo 4 8 270~450\260 | gmt pstext -R -JX -F+f14p,1+jML -G255 -K -O >> %ps%
echo 3 12 2 0 270 | gmt psxy -R -JX -Sm0.2i+e -W1.5 -Gred -K -O >> %ps%
echo 3 12 0~270\260 | gmt pstext -R -JX -F+f14p,1+jMC -G255 -K -O >> %ps%
echo 3.5 9.5 -Sm | gmt pstext -R -JX -F+f18p,1+jML -G255 -K -O >> %ps%

rem 4. vector type
echo 9 14 0 3 | gmt psxy -R -JX -Sv.5+ba+ea -W1.5 -Gred -K -O >> %ps%
echo 12.5 14 -Sv.5+ba+ea | gmt pstext -R -JX -F+f14p,1+jML -G255 -K -O >> %ps%
echo 9 13 0 3 | gmt psxy -R -JX -Sv.5+ba+ea -W1.5 -Gred -K -O --MAP_VECTOR_SHAPE=-2 >> %ps%
echo 12.5 13 MAP_VECTOR_SHAPE=-2 | gmt pstext -R -JX -F+f12p,1+jML -G255 -K -O >> %ps%
echo 9 12 0 3 | gmt psxy -R -JX -Sv.5+ba+ea -W1.5 -Gred -K -O --MAP_VECTOR_SHAPE=-1 >> %ps%
echo 12.5 12 MAP_VECTOR_SHAPE=-1 | gmt pstext -R -JX -F+f12p,1+jML -G255 -K -O >> %ps%
echo 9 11 0 3 | gmt psxy -R -JX -Sv.5+ba+ea -W1.5 -Gred -K -O --MAP_VECTOR_SHAPE=1 >> %ps%
echo 12.5 11 MAP_VECTOR_SHAPE=1 | gmt pstext -R -JX -F+f12p,1+jML -G255 -K -O >> %ps%
echo 9 10 0 3 | gmt psxy -R -JX -Sv.5+ba+ea -W1.5 -Gred -K -O --MAP_VECTOR_SHAPE=2 >> %ps%
echo 12.5 10 MAP_VECTOR_SHAPE=2 | gmt pstext -R -JX -F+f12p,1+jML -G255 -K -O >> %ps%
echo 9 9 0 3 | gmt psxy -R -JX -Sv.5+bt+e -W1.5 -Gred -K -O >> %ps%
echo 12.5 9 -Sv.5+bt+e | gmt pstext -R -JX -F+f14p,1+jML -G255 -K -O >> %ps%
echo 9 8 0 3 | gmt psxy -R -JX -Sv.5+b+ec -W1.5 -Gred -K -O >> %ps%
echo 12.5 8 -Sv.5+b+ec | gmt pstext -R -JX -F+f14p,1+jML -G255 -K -O >> %ps%
echo 9 7 0 3 | gmt psxy -R -JX -Sv.5+b+e+r -W1.5 -Gred -K -O >> %ps%
echo 12.5 7 -Sv.5+b+e+r | gmt pstext -R -JX -F+f14p,1+jML -G255 -K -O >> %ps%
echo 9 6 0 3 | gmt psxy -R -JX -Sv.5+b+e+l -W1.5 -Gred -K -O >> %ps%
echo 12.5 6 -Sv.5+b+e+l | gmt pstext -R -JX -F+f14p,1+jML -G255 -K -O >> %ps%
echo 9 5 0 3 | gmt psxy -R -JX -Sv.5+b+e+a90 -W1.5 -Gred -K -O >> %ps%
echo 12.5 5 -Sv.5+b+e+a90 | gmt pstext -R -JX -F+f14p,1+jML -G255 -K -O >> %ps%
echo 9 4 0 3 | gmt psxy -R -JX -Sv.5+mf -W1.5 -Gred -K -O >> %ps%
echo 12.5 4 -Sv.5+mf | gmt pstext -R -JX -F+f14p,1+jML -G255 -K -O >> %ps%
echo 9 3 0 3 | gmt psxy -R -JX -Sv.5+mr -W1.5 -Gred -K -O >> %ps%
echo 12.5 3 -Sv.5+mr | gmt pstext -R -JX -F+f14p,1+jML -G255 -K -O >> %ps%
echo 9 2 0 3 | gmt psxy -R -JX -Sv.5+b+e+t.5 -W1.5 -Gred -K -O >> %ps%
echo 12.5 2 -Sv.5+b+e+t.5 | gmt pstext -R -JX -F+f14p,1+jML -G255 -K -O >> %ps%
echo 9 1 0 3 | gmt psxy -R -JX -Sv.5+b+e+t-.5/.5 -W1.5 -Gred -K -O >> %ps%
echo 12.5 1 -Sv.5+b+e+t-.5/.5 | gmt pstext -R -JX -F+f14p,1+jML -G255 -K -O >> %ps%

gmt psxy -R -J -T -O >> %ps%
gmt psconvert %ps% -Tg -A -P
del tmp*
