set ps=12_3_population_histo.ps
set cpt=haxby.cpt

gmt makecpt -C%cpt% -T0/100/5 -D > tmp.cpt

rem histogram
gmt pshistogram population_2016_b.dat -R0/102.5/0/1.3e6 -JX-12/15 ^
-BWeS+t"2016 Taiwan Age Distribution" -Bxa20f10+l"Age" -Bya+l"Male" ^
-A -Ctmp.cpt -D+o-1.7 -W5 -L0.5 -K > %ps%
gmt pshistogram population_2016_g.dat -R -JX12/15 ^
-BS -Bxa -Bya+l"Female" -A -Ctmp.cpt -D -W5 -L0.5 -X12 -K -O >> %ps%

gmt psxy -R -J -T -O >> %ps%
gmt psconvert %ps% -Tg -A -P
del tmp*
