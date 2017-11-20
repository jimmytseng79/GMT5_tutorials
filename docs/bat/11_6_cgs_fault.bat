set ps=11_6_cgs_fault.ps
set data=D:\GMT_data\
set cpt=gebco.cpt

rem topographic map
gmt psbasemap -R119.7/122.1/21.8/25.4 -JM15 -BWeSn -Ba -P -K > %ps%
gmt pscoast -R -JM -Df -Gc -K -O >> %ps%
gmt grdimage %data%tw_40.grd -R -JM -C%cpt% -I%data%tw_40shad.grd -M -K -O >> %ps%
gmt pscoast -R -JM -Df -Q -K -O >> %ps%
gmt pscoast -R -JM -Df -W1 -K -O >> %ps%

rem fault type
gmt psxy %data%CGS_fault.gmt -R -JM -Sqn1:+Lh+T"fault_label.dat" > tmp
gmt gmtconvert %data%CGS_fault.gmt -S"1 1 |" > tmp
gmt psxy tmp -R -JM -W2,red -K -O >> %ps%
gmt gmtconvert %data%CGS_fault.gmt -S"1 2 |" > tmp
gmt psxy tmp -R -JM -W2,red,3_3:0p -K -O >> %ps%
gmt gmtconvert %data%CGS_fault.gmt -S"2 1 |" > tmp
gmt psxy tmp -R -JM -W2,255/193/37 -K -O >> %ps%
gmt gmtconvert %data%CGS_fault.gmt -S"2 2 |" > tmp
gmt psxy tmp -R -JM -W2,255/193/37,3_3:0p -K -O >> %ps%

rem fault numbers in map
awk "$4<=25 {print $0}" fault_label_fix.dat | ^
gmt pstext -R -JM -F+a -D.2/-.2 -K -O >> %ps%
awk "$4>=26 {print $0}" fault_label_fix.dat | ^
gmt pstext -R -JM -F+a -D-.2/.2 -K -O >> %ps%

rem fault numbers name
gmt gmtconvert %data%CGS_fault.gmt -L > tmp
sed -i 's\\"\\\\g' tmp
awk "{print $7, $8, $2}" tmp > tmp2
awk "NR !=1 {print 119.85, 25.35, $4}" fault_label_fix.dat > tmp1
awk "NR==FNR{tmp1[$3]=$0; next} {$3=tmp1[$3]; print}" tmp2 tmp1 > tmp3
awk "NR<=20 {print $1, $2-($5-1)*.07, $5, $3, $4}" tmp3 | ^
gmt pstext -R -JM -F+f12p+jML -K -O >> %ps%
awk "NR>=21 {print 122.05, $2-($5-1)*.07, $5, $3, $4}" tmp3 | ^
gmt pstext -R -JM -F+f12p+jMR -D0/-7 -K -O >> %ps%

rem legend set
echo H 18 1 Legend > tmp
echo D 0.2 1p >> tmp
echo G .2 >> tmp
echo S .6 - .8 0 3,red 1.3 Holocene active fault >> tmp
echo S .6 - .8 0 3,255/193/37 1.3 Late Pleistoene active fault >> tmp
echo S .6 - .8 0 3,black,3_3:0p 1.3 Fault concealed or inferred >> tmp
gmt pslegend tmp -R -JM -C.1/.1 -Dx.1/.1+w5.8 -F+p1 ^
--FONT_ANNOT_PRIMARY=10p --FONT_LABEL=14p -K -O >> %ps%

gmt psxy -R -J -T -O >> %ps%
gmt psconvert %ps% -Tg -A -P
del tmp*