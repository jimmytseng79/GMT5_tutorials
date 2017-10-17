set ps=5_5_TPEairline.ps

gmt pscoast -Rg -JE121.2342/25.0797/12 -S0 -G50 -W.2,white -A1000 -K > %ps%
echo 40 -45 | gmt psxy -R -JE -Sa.8 -Gred -K -O >> %ps%
echo -80 20 | gmt psxy -R -JE -Sa.8 -Gred -K -O >> %ps%
awk "{print $5, $4}" TPE_airline.dat | gmt psxy -R -JE -Sc.15 -G159/174/229 -K -O >> %ps%
gmt psxy TPE_airline.gmt -R -JE -W.3,yellow -K -O >> %ps%

gmt pscoast -R40/-45/-80/20r -JE121.2342/15.0/12 -S0 -G50 -W.2,white -A1000 -X13.5 -K -O >> %ps%
awk "{print $5, $4}" TPE_airline.dat | gmt psxy -R -JE -Sc.2 -G159/174/229 -K -O >> %ps%
gmt psxy TPE_airline.gmt -R -JE -W.3,yellow -O >> %ps%

gmt psconvert %ps% -Tg -A -P
