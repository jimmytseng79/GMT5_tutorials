set ps=12_5_volcano_compo.ps

rem ternary diagram
gmt gmtconvert volcano_composition.dat -S"ctranew_york_kimberlites" | ^
awk "NR!=1{print $2,$3,$4}" | ^
gmt psternary -R0/35/0/50/0/50 -JX15 -Baag+l"Weight Percent (\045)" ^
-Bbag -Bcag -B+g20 -LAl@-2@-O@-3@-/CaO/MgO -Sa.3 -G102/121.13/255 ^
-P -Xc -Y5 -K --MAP_GRID_PEN_PRIMARY=.25p,230 > %ps%

gmt gmtconvert volcano_composition.dat -S"ETNA_SICILY" | ^
awk "NR!=1 {print $2,$3,$4}" | ^
gmt psternary -R -JX -Ba -Sc.3 -G102/235.88/255 -K -O >> %ps%

gmt gmtconvert volcano_composition.dat -S"HYBLEAN_OR_IBLEAN_PLATEAU" | ^
awk "NR!=1 {print $2,$3,$4}" | ^
gmt psternary -R -JX -Ba -St.3 -G102/255/159.38 -K -O >> %ps%

gmt gmtconvert volcano_composition.dat -S"NUEVO_LEON" | ^
awk "NR!=1 {print $2,$3,$4}" | ^
gmt psternary -R -JX -Ba -Ss.3 -G159.38/255/102 -K -O >> %ps%

gmt gmtconvert volcano_composition.dat -S"OAXACA" | ^
awk "NR!=1 {print $2,$3,$4}" | ^
gmt psternary -R -JX -Ba -Sd.3 -G255/232.69/165.75 -K -O >> %ps%

gmt gmtconvert volcano_composition.dat -S"POTIGUAR_BASIN" | ^
awk "NR!=1 {print $2,$3,$4}" | ^
gmt psternary -R -JX -Ba -Sn.3 -G255/188.06/165.75 -K -O >> %ps%

gmt gmtconvert volcano_composition.dat -S"TAMAULIPAS" | ^
awk "NR!=1 {print $2,$3,$4}" | ^
gmt psternary -R -JX -Ba -Sh.3 -G255/175.31/190.25 -K -O >> %ps%

gmt gmtconvert volcano_composition.dat -S"USTICA_ISLAND" | ^
awk "NR!=1 {print $2,$3,$4}" | ^
gmt psternary -R -JX -Ba -Sg.3 -G255/194.44/228.5 -K -O >> %ps%

rem legend set
echo H 16 1 Legend > tmp
echo D 0.4 1p >> tmp
echo G .2 >> tmp
echo S .4 a .4 102/121.13/255 0 .8 ctranew_york_kimberlites >> tmp
echo S .4 c .4 102/235.88/255 0 .8 ETNA_SICILY >> tmp
echo S .4 t .4 102/255/159.38 0 .8 HYBLEAN_OR_IBLEAN_PLATEAU >> tmp
echo S .4 s .4 159.38/255/102 0 .8 NUEVO_LEON >> tmp
echo S .4 d .4 255/232.69/165.75 0 .8 OAXACA >> tmp
echo S .4 n .4 255/188.06/165.75 0 .8 POTIGUAR_BASIN >> tmp
echo S .4 h .4 255/175.31/190.25 0 .8 TAMAULIPAS >> tmp
echo S .4 g .4 255/194.44/228.5 0 .8 USTICA_ISLAND >> tmp
gmt pslegend tmp -R0/1/0/1 -JX -C.1/.1 -Dx-2/9+w7.8 -F+g240+p1+s4p/-4p/gray50 ^
--FONT_ANNOT_PRIMARY=12p -K -O >> %ps%

gmt psxy -R -J -T -O >> %ps%
gmt psconvert %ps% -Tg -A -P
del tmp*
