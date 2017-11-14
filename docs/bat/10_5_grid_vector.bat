set ps=10_5_grid_vector.ps
set data=D:\GMT_data\
set cpt=sealand.cpt

rem 1. surface .xyz to .grd & makecpt
awk "{print $1,$2,$3}" morakot_wind.gmt | ^
gmt surface -R119.9/122.1/21.8/25.4 -I.1 -Gmorakot_wind_e.grd
awk "{print $1,$2,$4}" morakot_wind.gmt | ^
gmt surface -R -I.1 -Gmorakot_wind_n.grd
gmt surface morakot_wind_scalar.gmt -R -I.1 -T.25 -Gmorakot_wind_scalar.grd
gmt makecpt -C%cpt% -T0/10/.5 -D > tmp.cpt

rem 2. bathymetry & grdvector
gmt psbasemap -R119.8/122.1/21.8/25.4 -JM15 -BWeSn -Bxa ^
-Bya -P -K --MAP_FRAME_TYPE=PLAIN > %ps%
gmt grdimage %data%tw_500_119.grd -R -JM -C%cpt% ^
-I%data%tw_500shad_119.grd -M -K -O >> %ps%
gmt pscoast -R -JM -Df -Gc -K -O >> %ps%
gmt grdimage morakot_wind_scalar.grd -R -JM -Ctmp.cpt -K -O >> %ps%
gmt grdvector morakot_wind_e.grd morakot_wind_n.grd -R -JM -Q+ea -W1 ^
-G0 -S.4 -K -O >> %ps%
gmt pscoast -R -JM -Q -K -O >> %ps%
gmt pscoast -R -JM -Df -W1 -K -O >> %ps%

rem 3. typhoon track & psscale
awk "{print $3,$2}" morakot_track.dat | gmt psxy -R -JM -W2,255/205/0,- -K -O >> %ps%
awk "$1 != 082009080800 {print $3,$2}" morakot_track.dat | ^
gmt psxy -R -JM -SkHURRICANE/.5 -G232/178/14 -W.5 -K -O >> %ps%
awk "$1 == 082009080800 {print $3,$2}" morakot_track.dat | ^
gmt psxy -R -JM -SkHURRICANE/.7 -G218/41/28 -W.5 -K -O >> %ps%
gmt psscale -Ctmp.cpt -Dx2/19.2+w5/.5+e+ml -Bxa2+l"Wind (m/s)" ^
-F+g240+r.4+c.3 -K -O >> %ps% 

gmt psxy -R -J -T -O >> %ps%
gmt psconvert %ps% -Tg -A -P
del tmp*
