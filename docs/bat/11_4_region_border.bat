set ps=11_4_region_border.ps
set data=D:\GMT_data\
set cpt=gebco.cpt

rem Taiwan
gmt psbasemap -R119.2/122.1/21.8/25.4 -Jm6 -BWeSn -Ba -P -K > %ps%
gmt grdimage %data%tw_500_119.grd -R -Jm -C%cpt% -I%data%tw_500shad_119.grd -M -K -O >> %ps%
gmt pscoast -R -Jm -Df -Gc -K -O >> %ps%
gmt grdimage %data%tw_40.grd -R -Jm -C%cpt% -I%data%tw_40shad.grd -M -K -O >> %ps%
gmt psxy %data%country_2016.gmt -R -Jm -W.5,237/98/98 -K -O >> %ps%
gmt psxy %data%city_2016.gmt -R -Jm -W1,red -K -O >> %ps%
gmt pscoast -R -Jm -Df -Q -K -O >> %ps%
gmt pscoast -R -Jm -Df -W1 -K -O >> %ps%

gmt gmtspatial %data%country_2016.gmt -Q+p -o0,1 > tmp1
gmt gmtconvert %data%country_2016.gmt -L> tmp2
awk "NR==FNR{tmp1[NR]=$0; next} {print tmp1[FNR], $2,$3,$4}" tmp1 tmp2 > tmp
awk "{print $1,$2,$3}" tmp | gmt pstext -R -Jm -F+f6p=1p,white -K -O >> %ps%
awk "{print $1,$2,$3}" tmp | gmt pstext -R -Jm -F+f6p -K -O >> %ps%
gmt gmtspatial %data%city_2016.gmt -Q+p -o0,1 > tmp1
gmt gmtconvert %data%city_2016.gmt -L > tmp2
awk "NR==FNR{tmp1[NR]=$0; next} {print tmp1[FNR], $2,$3,$4}" tmp1 tmp2 > tmp
gmt pstext tmp -R -Jm -F+f12p=2p,white -K -O >> %ps%
gmt pstext tmp -R -Jm -F+f12p -K -O >> %ps%

rem Kinmen
gmt psbasemap -R118.17/118.55/24.35/24.58 -Jm12 -Bwesn -B0 ^
-X.2 -Y17 -K -O --MAP_FRAME_TYPE=plain >> %ps%
gmt pscoast -R -Jm -Df -W1 -G220 -S250 -K -O >> %ps%
gmt pscoast -R -Jm -Df -Gc -K -O >> %ps%
gmt psxy %data%country_2016.gmt -R -Jm -W.5,237/98/98 -K -O >> %ps%
gmt pscoast -R -Jm -Df -Q -K -O >> %ps%

gmt gmtspatial %data%country_2016.gmt -Q+p -o0,1 > tmp1
gmt gmtconvert %data%country_2016.gmt -L > tmp2
awk "NR==FNR{tmp1[NR]=$0; next} {print tmp1[FNR], $2,$3,$4}" tmp1 tmp2 > tmp
awk "{print $1,$2,$3}" tmp | gmt pstext -R -Jm -F+f6p=1p,white -K -O >> %ps%
awk "{print $1,$2,$3}" tmp | gmt pstext -R -Jm -F+f6p -K -O >> %ps%
gmt gmtspatial %data%city_2016.gmt -Q+p -o0,1 > tmp1
gmt gmtconvert %data%city_2016.gmt -L > tmp2
awk "NR==FNR{tmp1[NR]=$0; next} {print tmp1[FNR], $2,$3,$4}" tmp1 tmp2 > tmp
gmt pstext tmp -R -Jm -F+f12p=2p,white -K -O >> %ps%
gmt pstext tmp -R -Jm -F+f12p -K -O >> %ps%

rem Lienchiang
gmt psbasemap -R119.86/120.11/25.91/26.30 -Jm -Bwesn -B0 ^
-X5 -Y1 -K -O --MAP_FRAME_TYPE=plain >> %ps%
gmt pscoast -R -Jm -Df -W1 -G220 -S250 -K -O >> %ps%

gmt gmtspatial %data%country_2016.gmt -Q+p -o0,1 > tmp1
gmt gmtconvert %data%country_2016.gmt -L > tmp2
awk "NR==FNR{tmp1[NR]=$0; next} {print tmp1[FNR], $2,$3,$4}" tmp1 tmp2 > tmp
awk "{print $1,$2,$3}" tmp | gmt pstext -R -Jm -F+f6p=1p,white -K -O >> %ps%
awk "{print $1,$2,$3}" tmp | gmt pstext -R -Jm -F+f6p -K -O >> %ps%
gmt gmtspatial %data%city_2016.gmt -Q+p -o0,1 > tmp1
gmt gmtconvert %data%city_2016.gmt -L > tmp2
awk "NR==FNR{tmp1[NR]=$0; next} {print tmp1[FNR], $2,$3,$4}" tmp1 tmp2 > tmp
gmt pstext tmp -R -Jm -F+f10p=2p,white -D.7/-1 -K -O >> %ps%
gmt pstext tmp -R -Jm -F+f10p -D.7/-1 -K -O >> %ps%

gmt psxy -R -J -T -O >> %ps%
gmt psconvert %ps% -Tg -A -P
del tmp*