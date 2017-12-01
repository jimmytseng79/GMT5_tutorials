set ps=12_4_visitor_residence.ps
set cpt=categorical.cpt

rem gmt makecpt -C%cpt% -T0/39/1 -Fr > tmp.cpt

rem pie chart
echo 10 10 0 360 | gmt psxy -R0/20/0/20 -JX15 -SW14 -W3 -K > %ps%
gmt psxy visitor_2016.gmt -R -JX -Cvisitor.cpt -SW14 -K -O >> %ps%
awk "NR==1 {print 14,13,$6}" visitor_2016.gmt | ^
gmt pstext -R -JX -F+f14p,1 -N -K -O >> %ps%
awk "NR==2 {print 13,5,$6}" visitor_2016.gmt | ^
gmt pstext -R -JX -F+f14p,1 -N -K -O >> %ps%
awk "NR==3 {print 7,5,$6}" visitor_2016.gmt | ^
gmt pstext -R -JX -F+f14p,1 -N -K -O >> %ps%
awk "{sum += $6} END {print 15,1,""Total:"""",sum}" visitor_2016.gmt | ^
gmt pstext -R -JX -F+f16p,1+jML -N -K -O >> %ps%
gmt psscale -R -JX -Cvisitor.cpt -D22/0+w15/1.2 -K -O >> %ps%

gmt psxy -R -J -T -O >> %ps%
gmt psconvert %ps% -Tg -A -P
del tmp*
