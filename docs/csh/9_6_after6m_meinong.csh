set ps=9_6_after6m_meinong.ps
set data=/Users/Rau/GMT_data
set cpt=seis.cpt
set lon1=120.0
set lat1=22.93
set lon2=121.05
set lat2=22.93
set width1=20
set width2=30
set inp=after6m_meinong_catalog.gmt

# 1. focal meca and seismicity basemap
gmt psbasemap -R119.8/121.1/22.3/23.6 -JM10 -BWeSN -Bxa -Bya -K > $ps
gmt grdimage $data/ETOPO1_Bed_g_gmt5.grd -R -JM -Cetopo1.cpt \
-I$data/ETOPO1_Bed_g_gmt5_shad.grd -M -K -O >> $ps
gmt pscoast -R -JM -Df -W1 -K -O >> $ps
gmt pscoast -R -JM -Df -Gc -K -O >> $ps
gmt grdimage $data/tw_40.grd -R -JM -Cetopo1.cpt \
-I$data/tw_40shad.grd -M -K -O >> $ps
gmt pscoast -R -JM -Df -Q -K -O >> $ps
echo $lon1 $lat1 > tmp
echo $lon2 $lat2 >> tmp
gmt psxy tmp -R -JM -W1 -K -O >> $ps
gmt makecpt -C$cpt -T0/40/5 -D -Z > tmp.cpt
awk '{print $1,$2,$3,exp($4)*0.002}' $inp | \
gmt psxy -R -JM -Ctmp.cpt -Sc -K -O >> $ps
echo 120.54 22.93 16 288.36 51.02 19.79 6.11 121.6 23.55 BATS | \
gmt psmeca -R -JM -Sa.9/14 -C1P.1 -G104/210/223 -N -K -O >> $ps
echo 120.54 22.93 16 1.25 -0.48 -0.77 0.74 -4.65 2.07 25 121.85 23.55 GCMT | \
gmt psmeca -R -JM -Sd.9/14 -C1 -G201/151/0 -N -K -O >> $ps
echo 120.54 22.93 16 274.81 41.74 17.02 6.6 122.1 23.55 CWB | \
gmt psmeca -R -JM -Sa.9/14 -C1 -G172/79/198 -N -K -O >> $ps

# 2. cross area
set wid1 = `echo $width1 110.4 | awk '{print $1/$2}'`
set wid2 = `echo $width2 110.4 | awk '{print $1/$2}'`
set tmplat1 = `echo $lat1 $wid1 | awk '{print $1-$2}'`
set tmplat2 = `echo $lat1 $wid2 | awk '{print $1-$2}'`
echo $lon1 $tmplat1 > tmp
echo $lon1 $tmplat2 >> tmp
echo $lon2 $tmplat2 >> tmp
echo $lon2 $tmplat1 >> tmp
gmt psxy tmp -R -JM -W1,- -L -K -O >> $ps
echo $lon1 $lat1 A | gmt pstext -R -JM -F+f14p,1,darkgreen -G230 -K -O >> $ps
echo $lon2 $lat2 A\'| gmt pstext -R -JM -F+f14p,1,darkgreen -G230 -K -O >> $ps

# 3. insert map
gmt pscoast -R119.6/122.1/21.8/25.4 -JM2 -B0 -Df -G230 -S255 -W.5 \
-Ya7.6 -K -O --MAP_FRAME_TYPE=plain >> $ps
gmt psbasemap -R -JM -D119.8/121.1/22.3/23.6 -F+p1 -Ya7.6 -K -O >> $ps
gmt psscale -Ctmp.cpt -Dx.3/1+w3/.3+e+h+ml -Ba10f5+l"Depth" \
-By+l"km" -K -O --FONT_LABEL=14p >> $ps

# 4. seismicity profile
gmt psbasemap -R$lon1/$lon2/0/40 -JX12/-4 -BwES -Bxa+l"Longitude (degree)" \
-Bya+l"Depth (km)" -X13 -K -O >> $ps
gmt project $inp -C$lon1/$lat1 -E$lon2/$lat2 -W-$wid1/$wid2 > tmp
awk '{print $1,$3,$3,exp($4)*0.002}' tmp | \
gmt psxy -R -JX -Ctmp.cpt -Sc -K -O >> $ps
echo 120.54 16 16 .8 | gmt psxy -R -JX -Sa -W1 -Ctmp.cpt -K -O >> $ps
echo 120.54 22 Meinong EQ. | gmt pstext -R -JX -F+f14p,1+jML -K -O >> $ps

# 5. elevation profile
gmt project -C$lon1/$lat1 -E$lon2/$lat2 -G0.1 -Q | \
gmt grdtrack -G$data/tw_40.grd > tmp
set pr = `gmt gmtinfo tmp -i0,3 -I.001/10`
set mi = `gmt gmtinfo tmp -i3 -C -o0`
set ma = `gmt gmtinfo tmp -i2 -C -o1`
gsed -i "1i $lon1 $lat1 0 $mi" tmp
gsed -i -e '$a\' -e "$lon2 $lat2 $ma 0" tmp
awk '{print $1, $4}' tmp | gmt psxy $pr -JX12/4 -W2 -G238/91/78 -Y4 -K -O >> $ps
gmt psbasemap -R -JX -BWen+t"AA' Profile" -Bxa \
-Bya+l"Elevation (m)" -K -O --FONT_TITLE=18p >> $ps

gmt psxy -R -J -T -O >> $ps
gmt psconvert $ps -Tg -A -P
rm tmp*
