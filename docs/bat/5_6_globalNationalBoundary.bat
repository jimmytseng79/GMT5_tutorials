set ps=5_6_globalNationalBoundary.ps

setlocal ENABLEDELAYEDEXPANSION
set vidx=0
for /F "tokens=2" %%A in (CountryCode.dat) do (
    set /A vidx=!vidx! + 1
    set var!vidx!=%%A
)
set var

set vidx=0
for /F "tokens=1" %%A in (CountryCode.dat) do (
    set /A vidx=!vidx! + 1
    set color!vidx!=%%A
)
set color

gmt pscoast -R-180/180/-79/90 -JN0/25 -W1 -Ba -K > %ps%
gmt pscoast -R -JN -E%var1%+g%color1% -K -O >> %ps%
gmt pscoast -R -JN -E%var2%+g%color2% -K -O >> %ps%
gmt pscoast -R -JN -E%var3%+g%color3% -K -O >> %ps%
gmt pscoast -R -JN -E%var4%+g%color4% -K -O >> %ps%
gmt pscoast -R -JN -E%var5%+g%color5% -K -O >> %ps%
gmt pscoast -R -JN -E%var6%+g%color6% -K -O >> %ps%
gmt pscoast -R -JN -E%var7%+g%color7% -K -O >> %ps%
gmt pscoast -R -JN -E%var8%+g%color8% -K -O >> %ps%
gmt pscoast -R -JN -E%var9%+g%color9% -K -O >> %ps%
gmt pscoast -R -JN -E%var10%+g%color10% -K -O >> %ps%
gmt pscoast -R -JN -A10000 -N1 -W.2 -S255 -O >> %ps%

gmt psconvert %ps% -Tg -A -P
