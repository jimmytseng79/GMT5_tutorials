set ps=8_3_cpt.ps

gmt gmtset PS_MEDIA=A2 FONT_LABEL=16p,1,black

rem -------- column 1 --------
set name=abyss
makecpt -C%name%.cpt -Z > tmp1.cpt
makecpt -C%name%.cpt -T-1/1/0.25 > tmp2.cpt
gmt psscale -Ctmp1.cpt -Dx0/46+w6/0.5+h+ml -Ba+l%name% -S -P -K ^
--FONT_ANNOT_PRIMARY=.1p > %ps%
gmt psscale -Ctmp2.cpt -Dx0/45.5+w6/0.5+h -Baf -K -O >> %ps%

set name=bathy
makecpt -C%name%.cpt -Z > tmp1.cpt
makecpt -C%name%.cpt -T-1/1/0.25 > tmp2.cpt
gmt psscale -Ctmp1.cpt -Dx0/43+w6/0.5+h+ml -Ba+l%name% -S -K -O ^
--FONT_ANNOT_PRIMARY=.1p >> %ps%
gmt psscale -Ctmp2.cpt -Dx0/42.5+w6/0.5+h -Baf -K -O >> %ps%

set name=categorical
makecpt -C%name%.cpt -Z > tmp1.cpt
makecpt -C%name%.cpt -T-1/1/0.25 > tmp2.cpt
gmt psscale -Ctmp1.cpt -Dx0/40+w6/0.5+h+ml -Ba+l%name% -S -K -O ^
--FONT_ANNOT_PRIMARY=.1p >> %ps%
gmt psscale -Ctmp2.cpt -Dx0/39.5+w6/0.5+h -Baf -K -O >> %ps%

set name=cool
makecpt -C%name%.cpt -Z > tmp1.cpt
makecpt -C%name%.cpt -T-1/1/0.25 > tmp2.cpt
gmt psscale -Ctmp1.cpt -Dx0/37+w6/0.5+h+ml -Ba+l%name% -S -K -O ^
--FONT_ANNOT_PRIMARY=.1p >> %ps%
gmt psscale -Ctmp2.cpt -Dx0/36.5+w6/0.5+h -Baf -K -O >> %ps%

set name=copper
makecpt -C%name%.cpt -Z > tmp1.cpt
makecpt -C%name%.cpt -T-1/1/0.25 > tmp2.cpt
gmt psscale -Ctmp1.cpt -Dx0/34+w6/0.5+h+ml -Ba+l%name% -S -K -O ^
--FONT_ANNOT_PRIMARY=.1p >> %ps%
gmt psscale -Ctmp2.cpt -Dx0/33.5+w6/0.5+h -Baf -K -O >> %ps%

set name=cubhelix
makecpt -C%name%.cpt -Z > tmp1.cpt
makecpt -C%name%.cpt -T-1/1/0.25 > tmp2.cpt
gmt psscale -Ctmp1.cpt -Dx0/31+w6/0.5+h+ml -Ba+l%name% -S -K -O ^
--FONT_ANNOT_PRIMARY=.1p >> %ps%
gmt psscale -Ctmp2.cpt -Dx0/30.5+w6/0.5+h -Baf -K -O >> %ps%

set name=cyclic
makecpt -C%name%.cpt -Z > tmp1.cpt
makecpt -C%name%.cpt -T-1/1/0.25 > tmp2.cpt
gmt psscale -Ctmp1.cpt -Dx0/28+w6/0.5+h+ml -Ba+l%name% -S -K -O ^
--FONT_ANNOT_PRIMARY=.1p >> %ps%
gmt psscale -Ctmp2.cpt -Dx0/27.5+w6/0.5+h -Baf -K -O >> %ps%

set name=dem1
makecpt -C%name%.cpt -Z > tmp1.cpt
makecpt -C%name%.cpt -T-1/1/0.25 > tmp2.cpt
gmt psscale -Ctmp1.cpt -Dx0/25+w6/0.5+h+ml -Ba+l%name% -S -K -O ^
--FONT_ANNOT_PRIMARY=.1p >> %ps%
gmt psscale -Ctmp2.cpt -Dx0/24.5+w6/0.5+h -Baf -K -O >> %ps%

set name=dem2
makecpt -C%name%.cpt -Z > tmp1.cpt
makecpt -C%name%.cpt -T-1/1/0.25 > tmp2.cpt
gmt psscale -Ctmp1.cpt -Dx0/22+w6/0.5+h+ml -Ba+l%name% -S -K -O ^
--FONT_ANNOT_PRIMARY=.1p >> %ps%
gmt psscale -Ctmp2.cpt -Dx0/21.5+w6/0.5+h -Baf -K -O >> %ps%

set name=dem3
makecpt -C%name%.cpt -Z > tmp1.cpt
makecpt -C%name%.cpt -T-1/1/0.25 > tmp2.cpt
gmt psscale -Ctmp1.cpt -Dx0/19+w6/0.5+h+ml -Ba+l%name% -S -K -O ^
--FONT_ANNOT_PRIMARY=.1p >> %ps%
gmt psscale -Ctmp2.cpt -Dx0/18.5+w6/0.5+h -Baf -K -O >> %ps%

set name=dem4
makecpt -C%name%.cpt -Z > tmp1.cpt
makecpt -C%name%.cpt -T-1/1/0.25 > tmp2.cpt
gmt psscale -Ctmp1.cpt -Dx0/16+w6/0.5+h+ml -Ba+l%name% -S -K -O ^
--FONT_ANNOT_PRIMARY=.1p >> %ps%
gmt psscale -Ctmp2.cpt -Dx0/15.5+w6/0.5+h -Baf -K -O >> %ps%

set name=drywet
makecpt -C%name%.cpt -Z > tmp1.cpt
makecpt -C%name%.cpt -T-1/1/0.25 > tmp2.cpt
gmt psscale -Ctmp1.cpt -Dx0/13+w6/0.5+h+ml -Ba+l%name% -S -K -O ^
--FONT_ANNOT_PRIMARY=.1p >> %ps%
gmt psscale -Ctmp2.cpt -Dx0/12.5+w6/0.5+h -Baf -K -O >> %ps%

set name=earth
makecpt -C%name%.cpt -Z > tmp1.cpt
makecpt -C%name%.cpt -T-1/1/0.25 > tmp2.cpt
gmt psscale -Ctmp1.cpt -Dx0/10+w6/0.5+h+ml -Ba+l%name% -S -K -O ^
--FONT_ANNOT_PRIMARY=.1p >> %ps%
gmt psscale -Ctmp2.cpt -Dx0/9.5+w6/0.5+h -Baf -K -O >> %ps%

set name=elevation
makecpt -C%name%.cpt -Z > tmp1.cpt
makecpt -C%name%.cpt -T-1/1/0.25 > tmp2.cpt
gmt psscale -Ctmp1.cpt -Dx0/7+w6/0.5+h+ml -Ba+l%name% -S -K -O ^
--FONT_ANNOT_PRIMARY=.1p >> %ps%
gmt psscale -Ctmp2.cpt -Dx0/6.5+w6/0.5+h -Baf -K -O >> %ps%

set name=etopo1
makecpt -C%name%.cpt -Z > tmp1.cpt
makecpt -C%name%.cpt -T-1/1/0.25 > tmp2.cpt
gmt psscale -Ctmp1.cpt -Dx0/4+w6/0.5+h+ml -Ba+l%name% -S -K -O ^
--FONT_ANNOT_PRIMARY=.1p >> %ps%
gmt psscale -Ctmp2.cpt -Dx0/3.5+w6/0.5+h -Baf -K -O >> %ps%

rem -------- column 2 --------
set name=gebco
makecpt -C%name%.cpt -Z > tmp1.cpt
makecpt -C%name%.cpt -T-1/1/0.25 > tmp2.cpt
gmt psscale -Ctmp1.cpt -Dx8/46+w6/0.5+h+ml -Ba+l%name% -S -K -O ^
--FONT_ANNOT_PRIMARY=.1p >> %ps%
gmt psscale -Ctmp2.cpt -Dx8/45.5+w6/0.5+h -Baf -K -O >> %ps%

set name=geo
makecpt -C%name%.cpt -Z > tmp1.cpt
makecpt -C%name%.cpt -T-1/1/0.25 > tmp2.cpt
gmt psscale -Ctmp1.cpt -Dx8/43+w6/0.5+h+ml -Ba+l%name% -S -K -O ^
--FONT_ANNOT_PRIMARY=.1p >> %ps%
gmt psscale -Ctmp2.cpt -Dx8/42.5+w6/0.5+h -Baf -K -O >> %ps%

set name=globe
makecpt -C%name%.cpt -Z > tmp1.cpt
makecpt -C%name%.cpt -T-1/1/0.25 > tmp2.cpt
gmt psscale -Ctmp1.cpt -Dx8/40+w6/0.5+h+ml -Ba+l%name% -S -K -O ^
--FONT_ANNOT_PRIMARY=.1p >> %ps%
gmt psscale -Ctmp2.cpt -Dx8/39.5+w6/0.5+h -Baf -K -O >> %ps%

set name=gray
makecpt -C%name%.cpt -Z > tmp1.cpt
makecpt -C%name%.cpt -T-1/1/0.25 > tmp2.cpt
gmt psscale -Ctmp1.cpt -Dx8/37+w6/0.5+h+ml -Ba+l%name% -S -K -O ^
--FONT_ANNOT_PRIMARY=.1p >> %ps%
gmt psscale -Ctmp2.cpt -Dx8/36.5+w6/0.5+h -Baf -K -O >> %ps%

set name=haxby
makecpt -C%name%.cpt -Z > tmp1.cpt
makecpt -C%name%.cpt -T-1/1/0.25 > tmp2.cpt
gmt psscale -Ctmp1.cpt -Dx8/34+w6/0.5+h+ml -Ba+l%name% -S -K -O ^
--FONT_ANNOT_PRIMARY=.1p >> %ps%
gmt psscale -Ctmp2.cpt -Dx8/33.5+w6/0.5+h -Baf -K -O >> %ps%

set name=hot
makecpt -C%name%.cpt -Z > tmp1.cpt
makecpt -C%name%.cpt -T-1/1/0.25 > tmp2.cpt
gmt psscale -Ctmp1.cpt -Dx8/31+w6/0.5+h+ml -Ba+l%name% -S -K -O ^
--FONT_ANNOT_PRIMARY=.1p >> %ps%
gmt psscale -Ctmp2.cpt -Dx8/30.5+w6/0.5+h -Baf -K -O >> %ps%

set name=ibcso
makecpt -C%name%.cpt -Z > tmp1.cpt
makecpt -C%name%.cpt -T-1/1/0.25 > tmp2.cpt
gmt psscale -Ctmp1.cpt -Dx8/28+w6/0.5+h+ml -Ba+l%name% -S -K -O ^
--FONT_ANNOT_PRIMARY=.1p >> %ps%
gmt psscale -Ctmp2.cpt -Dx8/27.5+w6/0.5+h -Baf -K -O >> %ps%

set name=inferno
makecpt -C%name%.cpt -Z > tmp1.cpt
makecpt -C%name%.cpt -T-1/1/0.25 > tmp2.cpt
gmt psscale -Ctmp1.cpt -Dx8/25+w6/0.5+h+ml -Ba+l%name% -S -K -O ^
--FONT_ANNOT_PRIMARY=.1p >> %ps%
gmt psscale -Ctmp2.cpt -Dx8/24.5+w6/0.5+h -Baf -K -O >> %ps%

set name=jet
makecpt -C%name%.cpt -Z > tmp1.cpt
makecpt -C%name%.cpt -T-1/1/0.25 > tmp2.cpt
gmt psscale -Ctmp1.cpt -Dx8/22+w6/0.5+h+ml -Ba+l%name% -S -K -O ^
--FONT_ANNOT_PRIMARY=.1p >> %ps%
gmt psscale -Ctmp2.cpt -Dx8/21.5+w6/0.5+h -Baf -K -O >> %ps%

set name=magma
makecpt -C%name%.cpt -Z > tmp1.cpt
makecpt -C%name%.cpt -T-1/1/0.25 > tmp2.cpt
gmt psscale -Ctmp1.cpt -Dx8/19+w6/0.5+h+ml -Ba+l%name% -S -K -O ^
--FONT_ANNOT_PRIMARY=.1p >> %ps%
gmt psscale -Ctmp2.cpt -Dx8/18.5+w6/0.5+h -Baf -K -O >> %ps%

set name=nighttime
makecpt -C%name%.cpt -Z > tmp1.cpt
makecpt -C%name%.cpt -T-1/1/0.25 > tmp2.cpt
gmt psscale -Ctmp1.cpt -Dx8/16+w6/0.5+h+ml -Ba+l%name% -S -K -O ^
--FONT_ANNOT_PRIMARY=.1p >> %ps%
gmt psscale -Ctmp2.cpt -Dx8/15.5+w6/0.5+h -Baf -K -O >> %ps%

set name=no_green
makecpt -C%name%.cpt -Z > tmp1.cpt
makecpt -C%name%.cpt -T-1/1/0.25 > tmp2.cpt
gmt psscale -Ctmp1.cpt -Dx8/13+w6/0.5+h+ml -Ba+l%name% -S -K -O ^
--FONT_ANNOT_PRIMARY=.1p >> %ps%
gmt psscale -Ctmp2.cpt -Dx8/12.5+w6/0.5+h -Baf -K -O >> %ps%

set name=ocean
makecpt -C%name%.cpt -Z > tmp1.cpt
makecpt -C%name%.cpt -T-1/1/0.25 > tmp2.cpt
gmt psscale -Ctmp1.cpt -Dx8/10+w6/0.5+h+ml -Ba+l%name% -S -K -O ^
--FONT_ANNOT_PRIMARY=.1p >> %ps%
gmt psscale -Ctmp2.cpt -Dx8/9.5+w6/0.5+h -Baf -K -O >> %ps%

set name=paired
makecpt -C%name%.cpt -Z > tmp1.cpt
makecpt -C%name%.cpt -T-1/1/0.25 > tmp2.cpt
gmt psscale -Ctmp1.cpt -Dx8/7+w6/0.5+h+ml -Ba+l%name% -S -K -O ^
--FONT_ANNOT_PRIMARY=.1p >> %ps%
gmt psscale -Ctmp2.cpt -Dx8/6.5+w6/0.5+h -Baf -K -O >> %ps%

set name=panoply
makecpt -C%name%.cpt -Z > tmp1.cpt
makecpt -C%name%.cpt -T-1/1/0.25 > tmp2.cpt
gmt psscale -Ctmp1.cpt -Dx8/4+w6/0.5+h+ml -Ba+l%name% -S -K -O ^
--FONT_ANNOT_PRIMARY=.1p >> %ps%
gmt psscale -Ctmp2.cpt -Dx8/3.5+w6/0.5+h -Baf -K -O >> %ps%

rem -------- column 3 --------
set name=plasma
makecpt -C%name%.cpt -Z > tmp1.cpt
makecpt -C%name%.cpt -T-1/1/0.25 > tmp2.cpt
gmt psscale -Ctmp1.cpt -Dx16/46+w6/0.5+h+ml -Ba+l%name% -S -K -O ^
--FONT_ANNOT_PRIMARY=.1p >> %ps%
gmt psscale -Ctmp2.cpt -Dx16/45.5+w6/0.5+h -Baf -K -O >> %ps%

set name=polar
makecpt -C%name%.cpt -Z > tmp1.cpt
makecpt -C%name%.cpt -T-1/1/0.25 > tmp2.cpt
gmt psscale -Ctmp1.cpt -Dx16/43+w6/0.5+h+ml -Ba+l%name% -S -K -O ^
--FONT_ANNOT_PRIMARY=.1p >> %ps%
gmt psscale -Ctmp2.cpt -Dx16/42.5+w6/0.5+h -Baf -K -O >> %ps%

set name=rainbow
makecpt -C%name%.cpt -Z > tmp1.cpt
makecpt -C%name%.cpt -T-1/1/0.25 > tmp2.cpt
gmt psscale -Ctmp1.cpt -Dx16/40+w6/0.5+h+ml -Ba+l%name% -S -K -O ^
--FONT_ANNOT_PRIMARY=.1p >> %ps%
gmt psscale -Ctmp2.cpt -Dx16/39.5+w6/0.5+h -Baf -K -O >> %ps%

set name=red2green
makecpt -C%name%.cpt -Z > tmp1.cpt
makecpt -C%name%.cpt -T-1/1/0.25 > tmp2.cpt
gmt psscale -Ctmp1.cpt -Dx16/37+w6/0.5+h+ml -Ba+l%name% -S -K -O ^
--FONT_ANNOT_PRIMARY=.1p >> %ps%
gmt psscale -Ctmp2.cpt -Dx16/36.5+w6/0.5+h -Baf -K -O >> %ps%

set name=relief
makecpt -C%name%.cpt -Z > tmp1.cpt
makecpt -C%name%.cpt -T-1/1/0.25 > tmp2.cpt
gmt psscale -Ctmp1.cpt -Dx16/34+w6/0.5+h+ml -Ba+l%name% -S -K -O ^
--FONT_ANNOT_PRIMARY=.1p >> %ps%
gmt psscale -Ctmp2.cpt -Dx16/33.5+w6/0.5+h -Baf -K -O >> %ps%

set name=seafloor
makecpt -C%name%.cpt -Z > tmp1.cpt
makecpt -C%name%.cpt -T-1/1/0.25 > tmp2.cpt
gmt psscale -Ctmp1.cpt -Dx16/31+w6/0.5+h+ml -Ba+l%name% -S -K -O ^
--FONT_ANNOT_PRIMARY=.1p >> %ps%
gmt psscale -Ctmp2.cpt -Dx16/30.5+w6/0.5+h -Baf -K -O >> %ps%

set name=sealand
makecpt -C%name%.cpt -Z > tmp1.cpt
makecpt -C%name%.cpt -T-1/1/0.25 > tmp2.cpt
gmt psscale -Ctmp1.cpt -Dx16/28+w6/0.5+h+ml -Ba+l%name% -S -K -O ^
--FONT_ANNOT_PRIMARY=.1p >> %ps%
gmt psscale -Ctmp2.cpt -Dx16/27.5+w6/0.5+h -Baf -K -O >> %ps%

set name=seis
makecpt -C%name%.cpt -Z > tmp1.cpt
makecpt -C%name%.cpt -T-1/1/0.25 > tmp2.cpt
gmt psscale -Ctmp1.cpt -Dx16/25+w6/0.5+h+ml -Ba+l%name% -S -K -O ^
--FONT_ANNOT_PRIMARY=.1p >> %ps%
gmt psscale -Ctmp2.cpt -Dx16/24.5+w6/0.5+h -Baf -K -O >> %ps%

set name=split
makecpt -C%name%.cpt -Z > tmp1.cpt
makecpt -C%name%.cpt -T-1/1/0.25 > tmp2.cpt
gmt psscale -Ctmp1.cpt -Dx16/22+w6/0.5+h+ml -Ba+l%name% -S -K -O ^
--FONT_ANNOT_PRIMARY=.1p >> %ps%
gmt psscale -Ctmp2.cpt -Dx16/21.5+w6/0.5+h -Baf -K -O >> %ps%

set name=terra
makecpt -C%name%.cpt -Z > tmp1.cpt
makecpt -C%name%.cpt -T-1/1/0.25 > tmp2.cpt
gmt psscale -Ctmp1.cpt -Dx16/19+w6/0.5+h+ml -Ba+l%name% -S -K -O ^
--FONT_ANNOT_PRIMARY=.1p >> %ps%
gmt psscale -Ctmp2.cpt -Dx16/18.5+w6/0.5+h -Baf -K -O >> %ps%

set name=topo
makecpt -C%name%.cpt -Z > tmp1.cpt
makecpt -C%name%.cpt -T-1/1/0.25 > tmp2.cpt
gmt psscale -Ctmp1.cpt -Dx16/16+w6/0.5+h+ml -Ba+l%name% -S -K -O ^
--FONT_ANNOT_PRIMARY=.1p >> %ps%
gmt psscale -Ctmp2.cpt -Dx16/15.5+w6/0.5+h -Baf -K -O >> %ps%

set name=viridis
makecpt -C%name%.cpt -Z > tmp1.cpt
makecpt -C%name%.cpt -T-1/1/0.25 > tmp2.cpt
gmt psscale -Ctmp1.cpt -Dx16/13+w6/0.5+h+ml -Ba+l%name% -S -K -O ^
--FONT_ANNOT_PRIMARY=.1p >> %ps%
gmt psscale -Ctmp2.cpt -Dx16/12.5+w6/0.5+h -Baf -K -O >> %ps%

set name=world
makecpt -C%name%.cpt -Z > tmp1.cpt
makecpt -C%name%.cpt -T-1/1/0.25 > tmp2.cpt
gmt psscale -Ctmp1.cpt -Dx16/10+w6/0.5+h+ml -Ba+l%name% -S -K -O ^
--FONT_ANNOT_PRIMARY=.1p >> %ps%
gmt psscale -Ctmp2.cpt -Dx16/9.5+w6/0.5+h -Baf -K -O >> %ps%

set name=wysiwyg
makecpt -C%name%.cpt -Z > tmp1.cpt
makecpt -C%name%.cpt -T-1/1/0.25 > tmp2.cpt
gmt psscale -Ctmp1.cpt -Dx16/7+w6/0.5+h+ml -Ba+l%name% -S -K -O ^
--FONT_ANNOT_PRIMARY=.1p >> %ps%
gmt psscale -Ctmp2.cpt -Dx16/6.5+w6/0.5+h -Baf -K -O >> %ps%

echo .5 .7 GMT Default | gmt pstext -R0/1/0/1 -JX15/3 -F+f24p,1+jMC -X11.5 -Y2.3 -K -O >> %ps%
echo .5 .4 Color Bar | gmt pstext -R0/1/0/1 -JX15/3 -F+f24p,1+jMC -K -O >> %ps%

gmt psxy -R -J -T -O >> %ps%
gmt psconvert %ps% -Tg -A -P
del tmp* gmt.conf
