set ps=5_7_favoriteCountry.ps

gmt pscoast -R-180/180/-79/90 -JN173/25 -A10000 -ENZ+g255/255/0 -G230 ^
-S170/170/255 -Ba > %ps%

gmt psconvert %ps% -Tg -A -P