set ps=5_3_taiwan.ps

gmt pscoast -R119.0/122.5/21.5/26.0 -JM18 -S0/0/255 -Gspringgreen2 -W1 -Df -P > %ps%

gmt psconvert %ps% -Tg