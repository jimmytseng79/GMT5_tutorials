set ps=10_6_ocean_current.ps
set cpt=rainbow.cpt

gmt xyz2grd ucur_201701.xyz -R0/360/-90/90 -I5d/5d -Gucur_201701.grd
gmt xyz2grd vcur_201701.xyz -R0/360/-90/90 -I5d/5d -Gvcur_201701.grd
gmt makecpt -C%cpt% -T0/.3/.01 -D -Z > tmp.cpt

gmt pscoast -R0/360/-80/80 -JN0/20 -A10000 -G0 -S100 -W1 ^
-BWESN+t"2017-01 Monthly Mean Ocean Current" -Ba -Y5 -K > %ps%
gmt grdvector ucur_201701.grd vcur_201701.grd -R -JN -Q+ea+n -W2 ^
-Ctmp.cpt -S.0004 -K -O --MAP_VECTOR_SHAPE=1 >> %ps%
echo -165 70 Depth: 5m | gmt pstext -R -JN -F+f14,1,white+jML -K -O >> %ps%
gmt psscale -Ctmp.cpt -D4.5/-1+w11/.2+h+e -Bxa+l"Velocity (m/s)" -K -O >> %ps%

gmt psxy -R -J -T -O >> %ps%
gmt psconvert %ps% -Tg -A -P
del tmp*