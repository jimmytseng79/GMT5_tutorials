set ps=8_6_mid-atlantic_ridge.ps
set data=D:\GMT_data\
set cpt=ibcao.cpt

gmt grdimage %data%ETOPO1_Bed_g_gmt5.grd -R-70/0/0/50 -JL-35/20/0/50/25 -BwESn -Ba ^
-C%cpt% -I%data%ETOPO1_Bed_g_gmt5_shad.grd -K > %ps%
gmt pscoast -R -JL -Df -W1 -K -O >> %ps%
gmt psscale -C%cpt% -Dx0/7.5+w10/.5+ma -Bxa500+l"Elevation" -By+l"km" -K -O >> %ps%

gmt psxy -R -J -T -O >> %ps%
gmt psconvert %ps% -Tg -A -P
del tmp*