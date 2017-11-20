set ps=11_5_drainage_area.ps
set data=D:\GMT_data\
set cpt=gebco.cpt

rem mainstream
gmt gmtset MAP_FRAME_TYPE=plain
gmt psbasemap -R119.8/122.1/21.8/25.4 -JM10 -BWeSn -Ba -K > %ps%
gmt grdimage %data%tw_500_119.grd -R -JM -C%cpt% -I%data%tw_500shad_119.grd -M -K -O >> %ps%
gmt pscoast -R -JM -Df -Gc -K -O >> %ps%
gmt grdimage %data%tw_40.grd -R -JM -C%cpt% -I%data%tw_40shad.grd -M -K -O >> %ps%
gmt pscoast -R -JM -Df -Q -K -O >> %ps%
gmt pscoast -R -JM -Df -W1 -K -O >> %ps%
gmt psxy %data%taiwan_river_mainstream.gmt -R -JM -W1,30/34/170 -K -O >> %ps%
echo 119.87 25.2 Mainstream | gmt pstext -R -JM -F+f18p,2+jML -K -O >> %ps%
gmt psbasemap -R -JM -D120.7/121.5/24.6/25.4 -F+p2,red -K -O >> %ps%

rem mainstream & tributary
gmt psbasemap -R120.7/121.5/24.6/25.4 -JM12 -BwESn -Ba -X12 -K -O >> %ps%
gmt pscoast -R -JM -Df -W1 -S235 -K -O >> %ps%
gmt psxy %data%taiwan_river_tributary.gmt -R -JM -W.5,72/92/199 -K -O >> %ps%
gmt psxy %data%taiwan_river_mainstream.gmt -R -JM -W1,30/34/170 -K -O >> %ps%
echo 120.75 25.35 Mainstream \046 | gmt pstext -R -JM -F+f16p,2+jML -K -O >> %ps%
echo 120.75 25.30 Tributary | gmt pstext -R -JM -F+f16p,2+jML -K -O >> %ps%

gmt psxy -R -J -T -O >> %ps%
gmt psconvert %ps% -Tg -A -P
del tmp* gmt.conf