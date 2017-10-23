set ps=6_7_THSRC_timeseries.ps

rem plot data and frame
gmt psbasemap -R2007-01-01T/2017-08-31T/1e3/8e3 -JX20/12 -BW+g230 ^
-Bya2e3f1e3+l"Number of Departures" -K ^
--MAP_FRAME_PEN=2p,red --MAP_TICK_PEN_PRIMARY=2p,red ^
--FONT_ANNOT_PRIMARY=12p,0,red --FONT_LABEL=16p,0,red > %ps%
echo 2008-01-01T 1e3 > tmp
echo 2008-01-01T 8e3 >> tmp
gmt psxy tmp -R -JX -W1,0,- -K -O >> %ps% 
awk "{print $1, $3}" THSRC_NUMBER.dat | gmt psxy -R -JX -W3,238/82/82 -K -O >> %ps%

gmt psbasemap -R2007-01-01T/2017-08-31T/7.0e5/5.5e6 -JX -BE ^
-Bya1e6f5e5+l"Number of Passengers" -K -O ^
--MAP_FRAME_PEN=2p,blue --MAP_TICK_PEN_PRIMARY=2p,blue ^
--FONT_ANNOT_PRIMARY=12p,0,blue --FONT_LABEL=16p,0,blue >> %ps%
awk "{print $1, $2}" THSRC_NUMBER.dat | gmt psxy -R -JX -W3,71/55/255 -K -O >> %ps%

gmt psbasemap -R -JX -BSn -Bxa1Y+l"Times (Year)" -K -O ^
--MAP_FRAME_PEN=2p,black --MAP_TICK_PEN_PRIMARY=2p,black ^
--FONT_ANNOT_PRIMARY=12p,0,black --FONT_LABEL=16p,0,black >> %ps%

rem legend set
echo H 20 Times-Roman Legend > tmp
echo D 0.4 1p >> tmp
echo G .2 >> tmp
echo S .8 - 1 0 5,238/82/82 1.5 Departures >> tmp
echo S .8 - 1 0 5,71/55/255 1.5 Passengers >> tmp
gmt pslegend tmp -R -JX -C.1/.1 -Dx14.5/.5+w5 -F+g255+p1+s4p/-4p/gray50 ^
--FONT_ANNOT_PRIMARY=14p -K -O >> %ps%

gmt psxy -R -JX -T -O >> %ps%
gmt psconvert %ps% -Tg -A -P
del tmp