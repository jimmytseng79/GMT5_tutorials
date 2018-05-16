set ps=14_4_se_geo.ps

rem basemap and geology color
gmt pscoast -R88/165/-16/28 -JL140.0/0.0/-10.0/15.0/25 -Ba10g2.5 -Df ^
-A5000 -W.5 -G245/246/246 -S234/246/253 -K > %ps%
gmt psxy geo3bl_lonlat.gmt -R -JL -W.1,red -Crock_unit.cpt -L -K -O >> %ps%

rem 3 specified rock type
gmt gmtconvert geo3bl_lonlat.gmt -S"|v|" > tmp
awk "{print $1,""p400/28:F50B""""$2,$3,""p400/28:F50B""""$4}" rock_unit.cpt > tmp.cpt
gmt psxy tmp -R -JL -Ctmp.cpt -W.1,red -L -K -O >> %ps%

gmt gmtconvert geo3bl_lonlat.gmt -S"|i|" > tmp
awk "{print $1,""p400/29:F50B""""$2,$3,""p400/29:F50B""""$4}" rock_unit.cpt > tmp.cpt
gmt psxy tmp -R -JL -Ctmp.cpt -W.1,red -L -K -O >> %ps%

gmt gmtconvert geo3bl_lonlat.gmt -S"|w|" > tmp
awk "{print $1,""p400/44:F50B""""$2,$3,""p400/44:F50B""""$4}" rock_unit.cpt > tmp.cpt
gmt psxy tmp -R -JL -Ctmp.cpt -W.1,red -L -K -O >> %ps%

rem legend part
echo 0 0 > tmp
echo 10 0 >> tmp
echo 10 10 >> tmp
echo 0 10 >> tmp
gmt psxy tmp -JX13/10 -R0/10/0/10 -G255/255/255 -W1 -L -K -O -X13 -Y7 >> %ps%
echo 0.3 9.6 Age of rock units > tmp
echo 2.2 2.3 Specified rock type >> tmp
echo 6.5 2.3 Other units >> tmp
gmt pstext tmp -R -JX -F+f12p,3+jML -K -O >> %ps%
echo 2.4 1.7 0.5 0.30 | gmt psxy -R -JX -Sr -W.5 -Gp400/28:B255 -K -O >> %ps%
echo 2.4 1.2 0.5 0.30 | gmt psxy -R -JX -Sr -W.5 -Gp400/29:B255 -K -O >> %ps%
echo 2.4 0.7 0.5 0.30 | gmt psxy -R -JX -Sr -W.5 -Gp400/44:B255 -K -O >> %ps%
echo 2.7 1.7 Volcanic rocks > tmp
echo 2.7 1.2 Intrusive rocks >> tmp
echo 2.7 0.7 Ophiolites \046 ultrabasic rocks >> tmp
gmt pstext tmp -R -JX -F+f10p+jML -K -O >> %ps%
gmt psxy legend.dat -R -JX -Sr -W.5 -Crock_unit.cpt -K -O >> %ps%
gmt pstext legend.cod -R -JX -F+f4p+jMC -K -O >> %ps%
gmt pstext legend.tex -R -JX -F+f10p+jML -K -O >> %ps%

gmt psxy -R -J -T -O >> %ps%
gmt psconvert %ps% -Tg -A -P
del tmp*