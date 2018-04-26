set ps=9_3_seismicity.ps
set cpt=seis.cpt

# 1. seismicity basemap
set cr=(`gmt gmtinfo 2017_catalog.gmt -i2 -T20`)
gmt makecpt -C$cpt% $cr > tmp.cpt
gmt psbasemap -R119/123/21/26 -JM15 -BwESn -Bxa -Bya -P -K > $ps
gmt pscoast -R -JM -Df -W1 -S203/211/235 -G230 -K -O >> $ps
awk '{print $1,$2,$3,exp($4)*0.002}' 2017_catalog.gmt | \
gmt psxy -R -JM -Ctmp.cpt -Sc -K -O >> $ps

# 2. magnitude calculation
set var = ()
foreach mag (`seq 1 1 6`)
  set x = `echo $mag | awk '{print exp($1)*0.002}'`
  set var = ($var $x)
end

# 3. boundary of four seismic zones
echo 119.0 22.8 > tmp
echo 120.8 22.8 >> tmp
echo ">" >> tmp
echo 120.8 21.0 >> tmp
echo 120.8 22.8 >> tmp
echo ">" >> tmp
echo 120.8 22.8 >> tmp
echo 121.5 24.2 >> tmp
echo ">" >> tmp
echo 121.5 26.0 >> tmp
echo 121.5 24.2 >> tmp
echo ">" >> tmp
echo 123.0 23.3 >> tmp
echo 121.5 24.2 >> tmp
echo ">" >> tmp
gmt psxy tmp -R -JM -W1 -K -O >> $ps
echo 119.8 23.8 A | gmt pstext -R -JM -F+f40p,2 -K -O >> $ps
echo 119.8 22.1 B | gmt pstext -R -JM -F+f40p,2 -K -O >> $ps
echo 122.3 25.3 C | gmt pstext -R -JM -F+f40p,2 -K -O >> $ps
echo 122.3 22.1 D | gmt pstext -R -JM -F+f40p,2 -K -O >> $ps

# 4. legend set
gmt pslegend -R -JM -C.1/.1 -Dx.1/14+w5 -F+g245+p1+s4p/-4p/gray50 \
--FONT_ANNOT_PRIMARY=10p --FONT_LABEL=14p -K -O  << EOF >> $ps
H 18 1 Legend
D 0.4 1p
G .7
B tmp.cpt 0.2 0.3+ml -Ba40f20+l"Depth (km)"
G .3
M 121 23.5 100+u +f
G .1
D 0.6 1p,0,-
G .2
L 14 0 C Magnitude
N 3
G .2
S .5 c $var[1] 0 0 1 1
S .5 c $var[2] 0 0 1 2
S .5 c $var[3] 0 0 1 3
G .4 >> tmp
S .5 c $var[4] 0 0 1 4
S .5 c $var[5] 0 0 1 5
S .5 c $var[6] 0 0 1 6
G .3
EOF

gmt psxy -R -J -T -O >> $ps
gmt psconvert $ps -Tg -A -P
rm tmp*
