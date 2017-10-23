set ps=6_7_THSRC_xyFigure.ps

rem plot base point
gmt psbasemap -R1e3/5.5e3/7.0e5/5.5e6 -JX15/15 -BWeSn -Bxa1e3g+l"Number of Departures" ^
-Bya1e6f5e5g+l"Number of Passengers" -X5 -K > %ps%
awk "{print $3, $2}" THSRC_NUMBER.dat | gmt psxy -R -JX -Sc.25 -G0 -K -O >> %ps%
awk "NR<=12 {print $3, $2}" THSRC_NUMBER.dat | gmt psxy -R -JX -Sc.25 -G120 -K -O >> %ps%
awk "NR>13 {print $3, $2}" THSRC_NUMBER.dat | gmt regress -Fxymc -C95 > tmp
awk "{print $1, $3}" tmp | gmt psxy -R -JX -W5,209/106/202 -K -O >> %ps%

rem get slope & intercept
setlocal ENABLEDELAYEDEXPANSION
set vidx=0
for /f %%i in (^
'awk "{for (I=1;I<=NF;I++) if ($I == ""slope:"""" || $I == ""icept:"""") {print $(I+1)};}" tmp') do (
    set /A vidx=!vidx! + 1
    set var!vidx!=%%i
)
set var
echo 1500 4e6 y=%var1%x%var2% | gmt pstext -R -JX -F+f16p+jML -G255 -K -O >> %ps%

gmt psxy -R -JX -T -O >> %ps%
gmt psconvert %ps% -Tg -A -P
del tmp