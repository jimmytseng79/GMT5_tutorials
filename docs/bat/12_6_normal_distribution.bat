set ps=12_6_normal_distribution.ps

rem histogram
awk "{print $1}" normal_distribution.dat | ^
gmt pshistogram -R-4/4/0/42 -JX20/15 -W.1 -G200 -N0+p2 -K > %ps% 
awk "{print $2}" normal_distribution.dat | ^
gmt pshistogram -R -JX -W.1 -G255/200/200 -N0+p2,red -K -O >> %ps%
awk "{print $3}" normal_distribution.dat | ^
gmt pshistogram -R -JX -W.1 -G200/255/200 -N0+p2,green -K -O >> %ps%
awk "{print $4}" normal_distribution.dat | ^
gmt pshistogram -R -JX -W.1 -G200/200/255 -N0+p2,blue -K -O >> %ps%
gmt psbasemap -R -JX -BWeSn+t"Noraml Distribution" -Ba -K -O >> %ps%

rem legend set
echo S .4 - .4 0 2,0 .8 \265=0, @~s@~=0.1 > tmp
echo S .4 - .4 0 2,red .8 \265=2, @~s@~=0.3 >> tmp
echo S .4 - .4 0 2,green .8 \265=0, @~s@~=0.7 >> tmp
echo S .4 - .4 0 2,blue .8 \265=-2, @~s@~=0.5 >> tmp
gmt pslegend tmp -R -JX -C.1/.1 -Dg-3.9/35.7+w3.5 -F+g240+p1+s4p/-4p/gray50 ^
--FONT_ANNOT_PRIMARY=12p -K -O >> %ps%

gmt psxy -R -J -T -O >> %ps%
gmt psconvert %ps% -Tg -A -P
del tmp*
