set ps=6_6_season_wind.ps

gmt psbasemap -R0/360/0/5 -JPa17 -BN+g230 -Bxa20 -Byg1 -K > %ps%
rem 466920, Taipei
awk "$4==466920 {print $3, $2}" summer_wind.dat | gmt psxy -R -JP -Sc.3 -G161/216/132 -K -O >> %ps%
awk "$4==466920 {print $3, $2}" winter_wind.dat | gmt psxy -R -JP -Sc.3 -G42/99/246 -K -O >> %ps%
rem 467490, Taichung
awk "$4==467490 {print $3, $2}" summer_wind.dat | gmt psxy -R -JP -Ss.3 -G161/216/132 -K -O >> %ps%
awk "$4==467490 {print $3, $2}" winter_wind.dat | gmt psxy -R -JP -Ss.3 -G42/99/246 -K -O >> %ps%
rem 467410, Tainan
awk "$4==467410 {print $3, $2}" summer_wind.dat | gmt psxy -R -JP -St.3 -G161/216/132 -K -O >> %ps%
awk "$4==467410 {print $3, $2}" winter_wind.dat | gmt psxy -R -JP -St.3 -G42/99/246 -K -O >> %ps%
rem 467660, Taitung
awk "$4==467660 {print $3, $2}" summer_wind.dat | gmt psxy -R -JP -Sn.3 -G161/216/132 -K -O >> %ps%
awk "$4==467660 {print $3, $2}" winter_wind.dat | gmt psxy -R -JP -Sn.3 -G42/99/246 -K -O >> %ps%
rem wind speed label
echo -90 1 1 m/s > tmp
echo -90 2 2 m/s >> tmp
echo -90 3 3 m/s >> tmp
echo -90 4 4 m/s >> tmp
gmt pstext tmp -R -JP -F+f14p -G230 -K -O >> %ps% 

rem legend set
echo H 24 Times-Roman Legend > tmp
echo D 0.4 1p >> tmp
echo G .2 >> tmp
echo N 2 >> tmp
echo S .5 c .5 0 0 1 Taipei >> tmp
echo S .5 s .5 0 0 1 Taichung >> tmp
echo G .1 >> tmp
echo S .5 t .5 0 0 1 Tainan >> tmp
echo S .5 n .5 0 0 1 Taitung >> tmp
echo D 0.8 1p,0,- >> tmp
echo P >> tmp
echo G .1 >> tmp
echo T Each symbols indicate the different city. >> tmp
echo T The green data are in the summer (Jun., Jul., Aug.), >> tmp
echo T and the blue points are in the winter (Dec., Jan., Feb.). >> tmp
gmt pslegend tmp -R -JP -C.1/.1 -Dx18.5/5+w8 -F+g240+p1+s4p/-4p/gray50 ^
--FONT_ANNOT_PRIMARY=16p -K -O >> %ps%

gmt psxy -R -J -T -O >> %ps%
gmt psconvert %ps% -Tg -A -P
del tmp