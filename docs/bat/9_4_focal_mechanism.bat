set ps=9_4_focal_mechanism.ps

gmt psbasemap -R0/40/0/10 -JX25/15 -Bwesn -K > %ps%
rem pure strike-slip
echo 5 8 0 0 90 0 5 | gmt psmeca -JX -R -Sa1.5 -K -O >> %ps%
echo 5 9 Pure Strike-Slip | gmt pstext -JX -R -F+f12p,1+jMC -K -O >> %ps%

rem pure dip-slip reverse
echo 5 5 0 0 45 90 5 | gmt psmeca -JX -R -Sa1.5 -K -O >> %ps%
echo 5 6 Pure Dip-Slip Reverse | gmt pstext -JX -R -F+f12p,1+jMC -K -O >> %ps%

rem pure dip-slip normal
echo 5 2 0 0 45 -90 5 | gmt psmeca -JX -R -Sa1.5 -K -O >> %ps%
echo 5 3 Pure Dip-Slip Normal | gmt pstext -JX -R -F+f12p,1,1+jMC -K -O >> %ps%

rem right-lateral strike-slip
echo 17 8 0 0 90 20 5 | gmt psmeca -JX -R -Sa1.5 -K -O >> %ps%
echo 17 9 Reft-Lateral Strike-Slip | gmt pstext -JX -R -F+f12p,1+jMC -K -O >> %ps%

rem left-lateral strike-slip
echo 29 8 0 0 90 -160 5 | gmt psmeca -JX -R -Sa1.5 -K -O >> %ps%
echo 29 9 Left-Lateral Strike-Slip | gmt pstext -JX -R -F+f12p,1+jMC -K -O >> %ps%

rem reverse right-lateral oblique
echo 17 5 0 0 45 45 5 | gmt psmeca -JX -R -Sa1.5 -K -O >> %ps%
echo 17 6 Reverse Right-Lateral Oblique | gmt pstext -JX -R -F+f12p,1+jMC -K -O >> %ps%

rem reverse left-lateral oblique
echo 29 5 0 0 45 135 5 | gmt psmeca -JX -R -Sa1.5 -K -O >> %ps%
echo 29 6 Reverse Left-Lateral Oblique | gmt pstext -JX -R -F+f12p,1+jMC -K -O >> %ps%

rem normal right-lateral oblique
echo 17 2 0 0 45 -45 5 | gmt psmeca -JX -R -Sa1.5 -K -O >> %ps%
echo 17 3 Normal Right-Lateral Oblique | gmt pstext -JX -R -F+f12p,1+jMC -K -O >> %ps%

rem normals left-lateral oblique
echo 29 2 0 0 45 -135 5 | gmt psmeca -JX -R -Sa1.5 -K -O >> %ps%
echo 29 3 Normal Left-Lateral Oblique | gmt pstext -JX -R -F+f12p,1+jMC -K -O >> %ps%

gmt psxy -R -J -T -O >> %ps%
gmt psconvert %ps% -Tg -A -P
del tmp*