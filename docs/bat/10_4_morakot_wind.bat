set ps=10_4_morakot_wind.ps
set data=D:\GMT_data\
set cpt=gebco.cpt

gmt surface morakot_presure.gmt -R119/123/21/26 -I.01 -Gmorakot_presure.grd

rem 1. topography & presure contour
gmt psbasemap -R119/123/21/26 -JM15 -BWeSn -Bxa -Bya -P -K > %ps%
gmt grdimage %data%ETOPO1_Bed_g_gmt5.grd -R -JM -C%cpt% ^
-I%data%ETOPO1_Bed_g_gmt5_shad.grd -M -K -O >> %ps%
gmt pscoast -R -JM -Df -Gc -K -O >> %ps%
gmt grdimage %data%tw_40.grd -R -JM -C%cpt% ^
-I%data%tw_40shad.grd -M -K -O >> %ps%
gmt pscoast -R -JM -Q -K -O >> %ps%
gmt pscoast -R -JM -Df -W1 -K -O >> %ps%
gmt grdcontour morakot_presure.grd -R -JM -A100 -C50 -K -O >> %ps%

rem 2. typhoon track & wind
gmt psvelo morakot_wind.gmt -R -JM -Se.3/.01/0 -G36/64/254 -A+ea+a45 -W1,36/64/254 -K -O >> %ps%
awk "{print $3,$2}" morakot_track.dat | gmt psxy -R -JM -W2,255/205/0,- -K -O >> %ps%
awk "$1 != 082009080800 {print $3,$2}" morakot_track.dat | ^
gmt psxy -R -JM -SkHURRICANE/.5 -G232/178/14 -W.5 -K -O >> %ps%
awk "$1 == 082009080800 {print $3,$2}" morakot_track.dat | ^
gmt psxy -R -JM -SkHURRICANE/.7 -G218/41/28 -W.5 -K -O >> %ps%

rem 3. legend set
echo H 18 1 Legend > tmp
echo D 0.4 1p >> tmp
echo G .2 >> tmp
echo M 122 21.5 100+u +f >> tmp
echo G .2 >> tmp
echo S .5 kHURRICANE .5 232/178/14 .5 1 Typhoon Track >> tmp
echo P >> tmp
echo G .2 >> tmp
echo S .5 kHURRICANE .7 218/41/28 .5 1 Eye at 2009/08/08 0:00:00 >> tmp
echo G .2 >> tmp
echo S .8 v.3+ea+a45 1 36/64/254 1,36/64/254 1.5 Wind 1 m/s >> tmp
gmt pslegend tmp -R -JM -C.1/.1 -Dx9.4/.1+w5.5 -F+g245+p1+s4p/-4p/gray50 ^
--FONT_ANNOT_PRIMARY=10p --FONT_LABEL=14p -K -O >> %ps%

gmt psxy -R -J -T -O >> %ps%
gmt psconvert %ps% -Tg -A -P
del tmp*
