set ps=5_4_unitedstate.ps

gmt pscoast -R-130/-66/24/52 -JL-98/35/33/45/25 -A500 -BWESN -Bxa10g10 -Bya10f5g10 ^
-C104/210/223 -Df -EMX,CA+g210 -Gspringgreen2 -N1/2,red -S0/0/255 -Lg-125/27+c27+w500+f+l"km" ^
-I1.5/1,41/143/194,solid -Tdg-70/27+w1.5+f2 -W1 -F+g255+r > %ps%

gmt psconvert %ps% -Tg