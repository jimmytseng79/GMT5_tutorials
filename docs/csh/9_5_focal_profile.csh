set ps=9_5_focal_profile.ps
set data=/Users/Rau/GMT_data
set cpt=seis.cpt
set lon1=122.3
set lat1=25.3
set lon2=121.1
set lat2=21.6
set width=20
set depth=100
set wid=`echo $width | awk '{print $1*2}'`

# 1. focal meca and seismicity basemap
gmt psbasemap -R119/123/21/26 -JM10 -BWeSN -Bxa -Bya -K > $ps
gmt grdimage $data/ETOPO1_Bed_g_gmt5.grd -R -JM -Cetopo1.cpt \
-I$data/ETOPO1_Bed_g_gmt5_shad.grd -M -K -O >> $ps
gmt pscoast -R -JM -Df -W1 -K -O >> $ps
gmt pscoast -R -JM -Df -Gc -K -O >> $ps
gmt grdimage $data/tw_40.grd -R -JM -Cetopo1.cpt \
-I$data/tw_40shad.grd -M -K -O >> $ps
gmt pscoast -R -JM -Df -Q -K -O >> $ps
set cr=(`gmt gmtinfo 2017_catalog.gmt -i2 -T20`)
gmt makecpt -C$cpt $cr -Z > tmp.cpt
awk '{print $1,$2,$3,exp($4)*0.002}' 2017_catalog.gmt | \
gmt psxy -R -JM -Ctmp.cpt -Sc -K -O >> $ps
awk '{print $1,$2,$3,$4,$5,$6,$7,$8,$9}' focal_mechanism.gmt | \
gmt psmeca -R -JM -Sa.5 -Ggray -K -O >> $ps

# 2. cross area
gmt project 2017_catalog.gmt -C$lon1/$lat1 -E$lon2/$lat2 \
-W-$width/$width -Q > catalog_profile.gmt
gmt project focal_mechanism.gmt -C$lon1/$lat1 -E$lon2/$lat2 \
-W-$width/$width -Q > focal_profile.gmt
# left-lateral strike-slip
awk '{if ($6>=-20 && $6<20) print $1,$2,$3,$4,$5,$6,$7,$8,$9}' focal_profile.gmt > tmp.ls
gmt psmeca tmp.ls -R -JM -Sa.5 -Gyellow -K -O >> $ps
# right-lateral strike-slip
awk '{if ($6>=160 || $6<-160) print $1,$2,$3,$4,$5,$6,$7,$8,$9}' focal_profile.gmt > tmp.rs
gmt psmeca tmp.rs -R -JM -Sa.5 -Gyellow -K -O >> $ps
# reverse fault
awk '{if ($6>=20 && $6<160) print $1,$2,$3,$4,$5,$6,$7,$8,$9}' focal_profile.gmt > tmp.rf
gmt psmeca tmp.rf -R -JM -Sa.5 -Gred -K -O >> $ps
# normal fault
awk '{if ($6>=-160 && $6<-20) print $1,$2,$3,$4,$5,$6,$7,$8,$9}' focal_profile.gmt > tmp.nf
gmt psmeca tmp.nf -R -JM -Sa.5 -Gblue -K -O >> $ps
echo $lon1 $lat1 > tmp
echo $lon2 $lat2 >> tmp
gmt psxy tmp -R -JM -W3 -K -O >> $ps
echo $lon1 $lat1 A | gmt pstext -R -JM -F+f16p,1,darkgreen -G230 -K -O >> $ps
echo $lon2 $lat2 A\'| gmt pstext -R -JM -F+f16p,1,darkgreen -G230 -K -O >> $ps

echo 120.4 25.6 Profile Width: $width/$width km | \
gmt pstext -R -JM -F+f14p,1+jML -K -O >> $ps

# 3. seismicity profile
set mdis=(`gmt gmtinfo catalog_profile.gmt -i4 -C -o1`)
gmt psbasemap -R0/$mdis/0/$depth -JX13.56/-8 -BwESn -Bxa+l"Distance (km)" \
-Bya+l"Depth (km)" -X11 -K -O >> $ps
awk '{print $5,$3,$3,exp($4)*0.002}' catalog_profile.gmt | \
gmt psxy -R -JX -Ctmp.cpt -Sc -K -O >> $ps
awk '{print $1,$2,$3,$4,$5,$6,$7,$8,$9}' tmp.ls | \
gmt pscoupe -R -JX -Sa.5 -Gyellow -Aa$lon1/$lat1/$lon2/$lat2/90/$wid/0/$depth -K -O >> $ps
awk '{print $1,$2,$3,$4,$5,$6,$7,$8,$9}' tmp.rs | \
gmt pscoupe -R -JX -Sa.5 -Gyellow -Aa$lon1/$lat1/$lon2/$lat2/90/$wid/0/$depth -K -O >> $ps
awk '{print $1,$2,$3,$4,$5,$6,$7,$8,$9}' tmp.rf | \
gmt pscoupe -R -JX -Sa.5 -Gred -Aa$lon1/$lat1/$lon2/$lat2/90/$wid/0/$depth -K -O >> $ps
awk '{print $1,$2,$3,$4,$5,$6,$7,$8,$9}' tmp.nf | \
gmt pscoupe -R -JX -Sa.5 -Gblue -Aa$lon1/$lat1/$lon2/$lat2/90/$wid/0/$depth -K -O >> $ps

# 4. legend set
echo 5 -5 AA\' Profile | gmt pstext -R -JX -F+f16p,1+jML -N -K -O >> $ps
gmt psscale -R -JX -Ctmp.cpt -Dx3.5/9+w10/.5+ml+h -Bxa+l"Depth (km)" -K -O >> $ps
echo 1 2 2 > tmp.m
echo 2 2 3 >> tmp.m
echo 3 2 4 >> tmp.m
echo 4 2 5 >> tmp.m
echo 5 2 6 >> tmp.m
echo 6.5 2 7 >> tmp.m
awk '{print $1,$2,exp($3)*0.002}' tmp.m | \
gmt psxy -R0/8/0/10 -JX -Sc -W2 -Y5 -K -O >> $ps
gmt pstext tmp.m -R -JX -F+f14p -D0/.7 -K -O >> $ps
echo 0 0 Magnitude: | gmt pstext -R -JX -F+f16p,1+jML -N -K -O >> $ps

gmt psxy -R -J -T -O >> $ps
gmt psconvert $ps -Tg -A -P
rm tmp*
