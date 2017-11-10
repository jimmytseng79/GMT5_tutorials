set ps=9_3_seismicity.ps
set data=D:\GMT_data\
set cpt=seis.cpt

rem 1. seismicity basemap
gmt gmtinfo 2017_catalog.gmt -i2 -T20 > tmp
set /p cr=<tmp
gmt makecpt -C%cpt% %cr% > tmp.cpt
gmt psbasemap -R119/123/21/26 -JM15 -BwESn -Bxa -Bya -P -K > %ps%
gmt pscoast -R -JM -Df -W1 -S203/211/235 -G230 -K -O >> %ps%
awk "{print $1,$2,$3,exp($4)*0.002}" 2017_catalog.gmt | ^
gmt psxy -R -JM -Ctmp.cpt -Sc -K -O >> %ps%

rem 2. magnitude calculation
echo 1 > tmp
for /l %%i in (2, 1, 6) do (echo %%i >> tmp)
setlocal ENABLEDELAYEDEXPANSION
set vidx=0
for /f %%i in ('awk "{print exp($1)*0.002}" tmp') do (
    set /A vidx=!vidx! + 1
    set var!vidx!=%%i
)
set var

rem 3. boundary of four seismic zones
echo 119.0 22.8 > tmp
echo 120.8 22.8 >> tmp
echo ^> >> tmp
echo 120.8 21.0 >> tmp
echo 120.8 22.8 >> tmp
echo ^> >> tmp
echo 120.8 22.8 >> tmp
echo 121.5 24.2 >> tmp
echo ^> >> tmp
echo 121.5 26.0 >> tmp
echo 121.5 24.2 >> tmp
echo ^> >> tmp
echo 123.0 23.3 >> tmp
echo 121.5 24.2 >> tmp
echo ^> >> tmp
gmt psxy tmp -R -JM -W1 -K -O >> %ps%
echo 119.8 23.8 A | gmt pstext -R -JM -F+f40p,2 -K -O >> %ps%
echo 119.8 22.1 B | gmt pstext -R -JM -F+f40p,2 -K -O >> %ps%
echo 122.3 25.3 C | gmt pstext -R -JM -F+f40p,2 -K -O >> %ps%
echo 122.3 22.1 D | gmt pstext -R -JM -F+f40p,2 -K -O >> %ps%

rem 4. legend set
echo H 18 1 Legend > tmp
echo D 0.4 1p >> tmp
echo G .7 >> tmp
echo B tmp.cpt 0.2 0.3+ml -Ba40f20+l"Depth (km)" >> tmp
echo G .3 >> tmp
echo M 121 23.5 100+u +f >> tmp
echo G .1 >> tmp
echo D 0.6 1p,0,- >> tmp
echo G .2 >> tmp
echo L 14 0 C Magnitude >> tmp
echo N 3 >> tmp
echo G .2 >> tmp
echo S .5 c %var1% 0 0 1 1 >> tmp
echo S .5 c %var2% 0 0 1 2 >> tmp
echo S .5 c %var3% 0 0 1 3 >> tmp
echo G .4 >> tmp
echo S .5 c %var4% 0 0 1 4 >> tmp
echo S .5 c %var5% 0 0 1 5 >> tmp
echo S .5 c %var6% 0 0 1 6 >> tmp
echo G .3 >> tmp
gmt pslegend tmp -R -JM -C.1/.1 -Dx.1/14+w5 -F+g245+p1+s4p/-4p/gray50 ^
--FONT_ANNOT_PRIMARY=10p --FONT_LABEL=14p -K -O >> %ps%

gmt psxy -R -J -T -O >> %ps%
gmt psconvert %ps% -Tg -A -P
del tmp*