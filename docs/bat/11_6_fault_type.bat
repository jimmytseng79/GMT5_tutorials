set ps=11_6_fault_type.ps
set data=D:\GMT_data\
set cpt=dem3.cpt

gmt psbasemap -R120.0/120.6/22.6/23.2 -JM15 -BWeSn -Ba -P -K --MAP_FRAME_TYPE=plain > %ps%
gmt grdimage %data%tw_40.grd -R -JM -C%cpt% -I%data%tw_40shad.grd -K -O >> %ps%
gmt pscoast -R -JM -Df -W1 -S200/200/255 -K -O >> %ps%

rem ·s¤Æ ¥k²¾Â_
gmt gmtconvert %data%CGS_fault.gmt -S"Hsinhua Fault" > tmp
gmt psxy tmp -R -JM -W4,red -Sf.5/.2+r+s+p1,red -K -O >> %ps%
rem «á¥Ò¨½ °f²¾Â_ ¦è¶É
gmt gmtconvert %data%CGS_fault.gmt -S"Houchiali Fault" > tmp
gmt psxy tmp -R -JM -W4,255/193/37 -Sf.4/.25+r+t+o.12+p1,255/193/37 -G255/193/37 -K -O >> %ps%
rem ¥ªÂí ¥ª²¾Â_
gmt gmtconvert %data%CGS_fault.gmt -S"Tsochen Fault" > tmp
gmt psxy tmp -R -JM -Sf.7/.2+l+s+p1,255/193/37 -K -O >> %ps%
gmt gmtconvert %data%CGS_fault.gmt -S"Tsochen Fault" > tmp
gmt psxy tmp -R -JM -W4,255/193/37 -K -O >> %ps%
rem ¤p±^¤s °f²¾Â_ ªF¶É
gmt gmtconvert %data%CGS_fault.gmt -S"Hsiaokangshan Fault" > tmp
gmt psxy tmp -R -JM -W4,255/193/37 -Sf.7/.25+l+t+o.12+p1,255/193/37 -G255/193/37 -K -O >> %ps%
rem ºX¤sÂ_¼h °f²¾­Ý ªF¶É
gmt gmtconvert %data%CGS_fault.gmt -S"Chishan Fault" > tmp
gmt psxy tmp -R -JM -Sf.7/.25+l+t+o.12+p1,red -Gred -K -O >> %ps%
gmt gmtconvert %data%CGS_fault.gmt -S"Chishan Fault" > tmp
gmt psxy tmp -R -JM -W4,red -K -O >> %ps%

awk "$4<=25 {print $0}" fault_label_fix.dat | ^
gmt pstext -R -JM -F+10p+a -D.4/-.4 -K -O >> %ps%

gmt gmtconvert -L %data%CGS_fault.gmt > tmp
sed -i 's\\"\\\\g' tmp
awk "{print $7, $8, $2}" tmp > tmp2
awk "NR !=1 {print 120.01, 23.25, $4}" fault_label_fix.dat > tmp1
awk "NR==FNR{tmp1[$3]=$0; next} {$3=tmp1[$3]; print}" tmp2 tmp1 > tmp3
awk "NR>=19 && NR <=23 {print $1, $2-($5-1)*.02, $5, $3, $4}" tmp3 | ^
gmt pstext -R -JM -F+f12p+jML -K -O >> %ps%

gmt pscoast -R119.8/122.1/21.8/25.4 -JM3 -Df -W1 -B0 -S255 -G230 ^
-X.1 -Y.1 -K -O --MAP_FRAME_TYPE=plain >> %ps%
gmt psbasemap -R -JM -D120.0/120.6/22.5/23.2 -F+p2,red -K -O >> %ps%

gmt psxy -R -J -T -O >> %ps%
gmt psconvert %ps% -Tg -A -P
del tmp*