set ps=11_7_population_density.ps
set data=D:\GMT_data\
set cpt=rainbow.cpt

rem population density map
gmt psbasemap -R119.2/122.1/21.8/25.4 -JM15 -BWeSn -Ba -P -K --MAP_FRAME_TYPE=plain > %ps%
gmt grdimage %data%tw_500_119.grd -R -JM -C%cpt% -I%data%tw_500shad_119.grd -M -K -O >> %ps%
gmt pscoast -R -JM -Df -Gc -K -O >> %ps%
rem gmt makecpt -C%cpt% -Trange.txt -D -Fr+c > tmp.cpt
rem awk "{print $0}" range.txt | gmt makecpt -C%cpt% -E42 -D -Fr+c > tmp.cpt2
gmt psxy %data%country_popuDen_2016f.gmt -R -JM ^
-Cpopulation_density.cpt -L -K -O >> %ps%
gmt psxy %data%city_2016.gmt -R -JM -W.5 -K -O >> %ps%
gmt pscoast -R -JM -Df -Q -K -O >> %ps%
gmt pscoast -R -JM -Df -W1 -K -O >> %ps%

rem legend set
echo 119.2 25.4 > tmp
echo 119.2 23.9 >> tmp
echo 120.2 23.9 >> tmp
echo 120.4 24.2 >> tmp
echo 120.4 25.4 >> tmp
gmt psxy tmp -R -JM -G255 -W1 -L -K -O >> %ps%
awk "$1>=0 && $1< 1000 {print $0}" population_density.cpt > tmp.cpt
gmt psscale -Ctmp.cpt -R -JM -Dx1.1/12.8+w7/.5 -A -S ^
-K -O --FONT_ANNOT_PRIMARY=8p >> %ps%
awk "$1>=1000 && $1< 8000 {print $0}" population_density.cpt > tmp.cpt
gmt psscale -Ctmp.cpt -R -JM -Dx3.1/12.8+w7/.5 -A -S ^
-K -O --FONT_ANNOT_PRIMARY=8p >> %ps%
awk "$1>=8000 && $1< 40000 {print $0}" population_density.cpt > tmp.cpt
gmt psscale -Ctmp.cpt -R -JM -Dx5.1/12.8+w7/.5 -A -S ^
-K -O --FONT_ANNOT_PRIMARY=8p >> %ps%
echo 119.22 24.00 Population Density (1\057km@+2@+) | ^
gmt pstext -R -JM -F+f12,0+jML -K -O >> %ps%

gmt psxy -R -J -T -O >> %ps%
gmt psconvert %ps% -Tg -A -P
del tmp*