set data=D:\GMT_data\
set ps=13_5_3d_perspective.ps
set R=-80/-70/-56/-48

gmt gmtset MAP_FRAME_TYPE plain FONT_ANNOT_PRIMARY 8p FONT_LABEL 10p PS_MEDIA A3

gmt grdcut %data%ETOPO1_Bed_g_gmt5.grd -R%R% -Gtmp.grd
gmt grdcut %data%ETOPO1_Bed_g_gmt5_shad.grd -R%R% -Gtmp_shad.grd

rem -Qi -N
gmt grdview tmp.grd -Itmp_shad.grd -R%R%/-6000/2000 -JL-75/-52.5/-59/-45/7.5 -JZ2 -p210/40 ^
-Cibcao.cpt -N-6000+glightgray -Qi500 -Ba -Bza4000f2000+l"Topo (m)" -BWeSnZ+t"-Qi -N" -K > %ps%

rem -Qi & grdcontour
gmt grdcontour tmp.grd -R -J -JZ -p -C500 -A1000 -Ba -BWeSn -K -O -Y11 >> %ps%
gmt grdview tmp.grd -Itmp_shad.grd -R%R%/-6000/2000 -J -JZ -p -Cibcao.cpt ^
-Qi500 -Ba -Bza4000f2000+l"Topo (m)" -BwesnZ+t"-Qi & grdcontour" -K -O -Y3 >> %ps%

rem -Qs -Wc
gmt grdview tmp.grd -Itmp_shad.grd -R%R%/-6000/2000 -J -JZ -p -Cibcao.cpt ^
-Qs -Ba -Bza4000f2000+l"Topo (m)" -BWeSnZ+t"-Qs -Wc" -Wc.5 -K -O -X13 -Y-3 >> %ps%

rem -Qm -N -Wm -Wf
gmt grdsample tmp.grd -I10k -Gtmp10.grd
gmt grdsample tmp_shad.grd -I10k -Gtmp10_shad.grd
gmt grdview tmp10.grd -Itmp10_shad.grd -R%R%/-6000/2000 -JL -JZ2 -p -Cibcao.cpt ^
-N-6000+glightgray -Qm -Ba -Bz4000f2000+l"Topo (m)" -BWeSnZ+t"-Qm -N -Wm -Wf" ^
-Wm.5 -Wf.75,red -K -O -Y-11 >> %ps%

gmt psxy -R -J -Jz -T -O >> %ps%
gmt psconvert %ps% -Tg -A -P
del tmp*