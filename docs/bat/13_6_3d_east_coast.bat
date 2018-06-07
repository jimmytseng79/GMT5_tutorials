set data=D:\GMT_data\
set ps=13_6_3d_east_valley.ps
set R=120.5/122.5/21.6/25.4

gmt gmtset MAP_FRAME_TYPE plain FONT_LABEL 20p FONT_ANNOT_PRIMARY 12p

gmt grdcut %data%ETOPO1_Bed_g_gmt5.grd -R%R% -Gtmp.grd
gmt grdcut %data%ETOPO1_Bed_g_gmt5_shad.grd -R%R% -Gtmp_shad.grd

gmt pscoast -R119.6/123.2/21.2/26.0 -JM3 -JZ5 -p140/40 -Ba2 -BWeSn -Df -W.5 -K -Y10 > %ps%
gmt psbasemap -R -J -JZ -p -D%R% -F+p2,red -K -O >> %ps%
gmt grdview tmp.grd -Itmp_shad.grd -R%R%/-6000/4000 -JM10 -JZ -p140/40 -Cetopo1.cpt ^
-N-6000+glightgray -Qi300 -Ba -Bza3000+l"Topo (m)" -BwesnZ -K -O -X5 >> %ps%
echo 121.6 23.4 East Valley > tmp
echo 121.3 23.4 Central Mountain Range >> tmp
gmt pstext tmp -R -J -JZ -p140/90 -F+a60+f16p=2p,white -N -K -O >> %ps%
gmt pstext tmp -R -J -JZ -p -F+a60+f16p -N -K -O >> %ps%
echo 122.5 24.0 Ryukyu Trench > tmp
gmt pstext tmp -R -J -JZ -p140/90 -F+f16p=2p,yellow -N -K -O >> %ps%
gmt pstext tmp -R -J -JZ -p -F+f16p -N -K -O >> %ps%

gmt psxy -R -J -Jz -T -O >> %ps%
gmt psconvert %ps% -Tg -A -P
del tmp*