set ps=14_5_se_geo_grd.ps
set data=D:\GMT_data\

rem gmt grdmask geo3bl_lonlat.gmt -R88/165/-16/28 -I1m -Nz -Ggeo3bl_lonlat.grd -V

gmt gmtset MAP_FRAME_TYPE plain

rem base grid image
gmt grdimage geo3bl_lonlat.grd -R108/120/-5/7.7 -JM14 -Ba -BwESn ^
-Crock_unit.cpt -I%data%ETOPO1_Bed_g_gmt5_shad.grd -K > %ps%
gmt pscoast -R -JM -Df -A500 -W.5 -K -O >> %ps%

rem legend set
echo H 20 Times-Roman Legend > tmp
echo G .2 >> tmp
echo N 2 >> tmp
echo S .5 r .5 255/251/198 .3 .9 Quaternary >> tmp
echo S .5 r .5 255/245/127 .3 .9 Cenozoic >> tmp
echo S .5 r .5 255/233/123 .3 .9 Neogene >> tmp
echo S .5 r .5 139/186/164 .3 .9 Mesozoic >> tmp
echo S .5 r .5 250/190/0 .3 .9 Undivided Tertiary >> tmp
echo S .5 r .5 224/189/188 .3 .9 Mesozoic/Paleozoic >> tmp
echo N 1 >> tmp
echo S .5 r .5 213/201/161 .3 .9 Paleogene >> tmp
echo N 2 >> tmp
echo S .5 r .5 240/244/197 .3 .9 Tertiary/Cretaceous >> tmp
echo S .5 r .5 234/246/253 .3 .9 Surface water >> tmp
echo S .5 r .5 144/195/31 .3 .9 Cretaceous >> tmp
echo S .5 r .5 245/246/246 .3 .9 Geology not shown >> tmp
echo S .5 r .5 92/194/207 .3 .9 Triassic >> tmp
echo S .5 r .5 181/0/129 .3 .9 Undetermined age >> tmp
gmt pslegend tmp -R -JM -C.1/.1 -Dx.2/13+w9 -F+g240+p1+r.2 ^
--FONT_ANNOT_PRIMARY=10p -K -O >> %ps%

gmt psxy -R -J -T -O >> %ps%
gmt psconvert %ps% -Tg -A -P
del tmp*