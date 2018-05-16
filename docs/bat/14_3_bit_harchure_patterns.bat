set ps=14_3_bit_harchure_patterns.ps

rem -Gpdpi/pattern[:Bcolor[Fcolor]]
echo .2 23.3 Demonstration of -Gp | gmt pstext -R0/16/0/24 -JX16/24 -F+f18p,1+jML -P -K > %ps%
echo 2 21 3 1.5 | gmt psxy -R -JX -Sr -Gp100/24 -W.5 -K -O >> %ps%
echo 6 21 3 1.5 | gmt psxy -R -JX -Sr -Gp300/24 -W.5 -K -O >> %ps%
echo 10 21 3 1.5 | gmt psxy -R -JX -Sr -Gp500/24:Fblue -W.5 -K -O >> %ps%
echo 14 21 3 1.5 | gmt psxy -R -JX -Sr -Gp300/24:BblackFyellow -W.5 -K -O >> %ps%
echo .5 22.1 -Gp100/24 > tmp
echo 4.5 22.1 -Gp300/24 >> tmp
echo 8.5 22.1 -Gp500/24:Fblue >> tmp
echo 11.8 22.1 -Gp300/24:BblackFyellow >> tmp
gmt pstext tmp -R -JX -F+f10p+jML -K -O >> %ps%

rem Sedimentary Rock
echo .3 19 Sedimentary Lithology Patterns | gmt pstext -R -JX -F+f14p,1+jML -K -O >> %ps%
echo 2 17.5 3 1.5 | gmt psxy -R -JX -Sr -Gp200/24:B230 -W.5 -K -O >> %ps%
echo 6 17.5 3 1.5 | gmt psxy -R -JX -Sr -Gp200/43:B230 -W.5 -K -O >> %ps%
echo 10 17.5 3 1.5 | gmt psxy -R -JX -Sr -Gp200/31:B230 -W.5 -K -O >> %ps%
echo 14 17.5 3 1.5 | gmt psxy -R -JX -Sr -Gp200/62:B227/249/124 -W.5 -K -O >> %ps%
echo .6 18 24 > tmp
echo 4.6 18 43 >> tmp
echo 8.6 18 31 >> tmp
echo 12.6 18 62 >> tmp
gmt pstext tmp -R -JX -F+f10p+jML -W.2 -G255 -K -O >> %ps%
echo 2 16.4 Clay or clay shale > tmp
echo 6 16.4 Sandy or silty shale >> tmp
echo 10 16.4 Massive sand or sandstone >> tmp
echo 14 16.4 Gravel or conglomerate >> tmp
gmt pstext tmp -R -JX -F+f9p+jMC -K -O >> %ps%

echo 2 15.1 3 1.5 | gmt psxy -R -JX -Sr -Gp200/33 -W.5 -K -O >> %ps%
echo 6 15.1 3 1.5 | gmt psxy -R -JX -Sr -Gp200/20 -W.5 -K -O >> %ps%
echo 10 15.1 3 1.5 | gmt psxy -R -JX -Sr -Gp200/21 -W.5 -K -O >> %ps%
echo 14 15.1 3 1.5 | gmt psxy -R -JX -Sr -Gp200/61:B136/251/144 -W.5 -K -O >> %ps%
echo .6 15.6 33 > tmp
echo 4.6 15.6 20 >> tmp
echo 8.6 15.6 21 >> tmp
echo 12.6 15.6 61 >> tmp
gmt pstext tmp -R -JX -F+f10p+jML -W.2 -G255 -K -O >> %ps%
echo 2 14.0 Sandy limestone > tmp
echo 6 14.0 Limestone >> tmp
echo 10 14.0 Dolostone or dolomite >> tmp
echo 14 14.0 Breccia >> tmp
gmt pstext tmp -R -JX -F+f9p+jMC -K -O >> %ps%

rem Igneous rock
echo .3 12.4 Igneous and Vein-matter Lithology Patterns | gmt pstext -R -JX -F+f14p,1+jML -K -O >> %ps%
echo 2 10.9 3 1.5 | gmt psxy -R -JX -Sr -Gp200/29:B245/99/165 -W.5 -K -O >> %ps%
echo 6 10.9 3 1.5 | gmt psxy -R -JX -Sr -Gp200/47:B245/99/165 -W.5 -K -O >> %ps%
echo 10 10.9 3 1.5 | gmt psxy -R -JX -Sr -Gp200/28:B245/99/165 -W.5 -K -O >> %ps%
echo .6 11.4 29 > tmp
echo 4.6 11.4 47 >> tmp
echo 8.6 11.4 28 >> tmp
gmt pstext tmp -R -JX -F+f10p+jML -W.2 -G255 -K -O >> %ps%
echo 2 9.8 Igneous > tmp
echo 6 9.8 Granite >> tmp
echo 10 9.8 Vitrophyre >> tmp
gmt pstext tmp -R -JX -F+f9p+jMC -K -O >> %ps%

gmt psxy -R -J -T -O >> %ps%
gmt psconvert %ps% -Tg -A -P
del tmp*