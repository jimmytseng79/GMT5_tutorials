set ps=13_4_3d_bar.ps
set data=D:\GMT_data\
set C=gray
set FS=green
set CS=cyan
set G=red

gmt grdimage %data%tw_20.grd -R120.62/120.69/24.03/24.13/0/100 -JM12 -JZ10 -p205/35 ^
-BWeSnZ -Bxa.03 -Bya.04 -Bz10+l"Depth (m)" -Cdem1.cpt -I%data%tw_20shad.grd -K > %ps%
gmt psxy %data%taiwan_river_tributary.gmt -R -JM -JZ -p -W1,72/92/199 -K -O >> %ps%
gmt psxy %data%taiwan_river_mainstream.gmt -R -JM -JZ -p -W1,30/34/170 -K -O >> %ps%

rem 061851G1
awk "{if ($3==""061851G1"""") print $0}" core.gmt > tmp
awk "{print $1,$2,$4,0}" tmp | gmt psxyz -R -JM -JZ -p -So.3 -G%C% -W.5 -K -O >> %ps%
awk "{print $1,$2,$4+$6,$4}" tmp | gmt psxyz -R -JM -JZ -p -So.3b -G%CS% -W.5 -K -O >> %ps%
awk "{print $1,$2,$4+$6+$8,$4+$6}" tmp | gmt psxyz -R -JM -JZ -p -So.3b -G%C% -W.5 -K -O >> %ps%
awk "{print $1,$2,$4+$6+$8+$10,$4+$6+$8}" tmp | ^
gmt psxyz -R -JM -JZ -p -So.3b -G%CS% -W.5 -K -O >> %ps%
awk "{print $1,$2,$4+$6+$8+$10+$12,$4+$6+$8+$10}" tmp | ^
gmt psxyz -R -JM -JZ -p -So.3b -G%C% -W.5 -K -O >> %ps%
awk "{print $1,$2,$4+$6+$8+$10+$12+$14,$4+$6+$8+$10+$12}" tmp | ^
gmt psxyz -R -JM -JZ -p -So.3b -G%G% -W.5 -K -O >> %ps%
awk "{print $1,$2,$4+$6+$8+$10+$12+$14+$16,$4+$6+$8+$10+$12+$14}" tmp | ^
gmt psxyz -R -JM -JZ -p -So.3b -G%CS% -W.5 -K -O >> %ps%
awk "{print $1,$2,$3}" tmp | gmt pstext -R -JM -JZ -p -F+f12p=2p,white -D0/-.5 -K -O >> %ps%
awk "{print $1,$2,$3}" tmp | gmt pstext -R -JM -JZ -p -F+f12p -D0/-.5 -K -O >> %ps%

rem 062051G1
awk "{if ($3==""062051G1"""") print $0}" core.gmt > tmp
awk "{print $1,$2,$4,0}" tmp | gmt psxyz -R -JM -JZ -p -So.3 -G%G% -W.5 -K -O >> %ps%
awk "{print $1,$2,$4+$6,$4}" tmp | gmt psxyz -R -JM -JZ -p -So.3b -G%FS% -W.5 -K -O >> %ps%
awk "{print $1,$2,$4+$6+$8,$4+$6}" tmp | gmt psxyz -R -JM -JZ -p -So.3b -G%C% -W.5 -K -O >> %ps%
awk "{print $1,$2,$4+$6+$8+$10,$4+$6+$8}" tmp | ^
gmt psxyz -R -JM -JZ -p -So.3b -G%G% -W.5 -K -O >> %ps%
awk "{print $1,$2,$4+$6+$8+$10+$12,$4+$6+$8+$10}" tmp | ^
gmt psxyz -R -JM -JZ -p -So.3b -G%C% -W.5 -K -O >> %ps%
awk "{print $1,$2,$3}" tmp | gmt pstext -R -JM -JZ -p -F+f12p=2p,white -D0/-.5 -K -O >> %ps%
awk "{print $1,$2,$3}" tmp | gmt pstext -R -JM -JZ -p -F+f12p -D0/-.5 -K -O >> %ps%

rem 061552G1
awk "{if ($3==""061552G1"""") print $0}" core.gmt > tmp
awk "{print $1,$2,$4,0}" tmp | gmt psxyz -R -JM -JZ -p -So.3 -G%CS% -W.5 -K -O >> %ps%
awk "{print $1,$2,$4+$6,$4}" tmp | gmt psxyz -R -JM -JZ -p -So.3b -G%C% -W.5 -K -O >> %ps%
awk "{print $1,$2,$4+$6+$8,$4+$6}" tmp | gmt psxyz -R -JM -JZ -p -So.3b -G%G% -W.5 -K -O >> %ps%
awk "{print $1,$2,$4+$6+$8+$10,$4+$6+$8}" tmp | ^
gmt psxyz -R -JM -JZ -p -So.3b -G%CS% -W.5 -K -O >> %ps%
awk "{print $1,$2,$4+$6+$8+$10+$12,$4+$6+$8+$10}" tmp | ^
gmt psxyz -R -JM -JZ -p -So.3b -G%G% -W.5 -K -O >> %ps%
awk "{print $1,$2,$4+$6+$8+$10+$12+$14,$4+$6+$8+$10+$12}" tmp | ^
gmt psxyz -R -JM -JZ -p -So.3b -G%CS% -W.5 -K -O >> %ps%
awk "{print $1,$2,$4+$6+$8+$10+$12+$14+$16,$4+$6+$8+$10+$12+$14}" tmp | ^
gmt psxyz -R -JM -JZ -p -So.3b -G%G% -W.5 -K -O >> %ps%
awk "{print $1,$2,$4+$6+$8+$10+$12+$14+$16+$18,$4+$6+$8+$10+$12+$14+$16}" tmp | ^
gmt psxyz -R -JM -JZ -p -So.3b -G%FS% -W.5 -K -O >> %ps%
awk "{print $1,$2,$3}" tmp | gmt pstext -R -JM -JZ -p -F+f12p=2p,white -D0/-.5 -K -O >> %ps%
awk "{print $1,$2,$3}" tmp | gmt pstext -R -JM -JZ -p -F+f12p -D0/-.5 -K -O >> %ps%

rem 061553G1
awk "{if ($3==""061553G1"""") print $0}" core.gmt > tmp
awk "{print $1,$2,$4,0}" tmp | gmt psxyz -R -JM -JZ -p -So.3 -G%G% -W.5 -K -O >> %ps%
awk "{print $1,$2,$4+$6,$4}" tmp | gmt psxyz -R -JM -JZ -p -So.3b -G%CS% -W.5 -K -O >> %ps%
awk "{print $1,$2,$4+$6+$8,$4+$6}" tmp | gmt psxyz -R -JM -JZ -p -So.3b -G%G% -W.5 -K -O >> %ps%
awk "{print $1,$2,$4+$6+$8+$10,$4+$6+$8}" tmp | ^
gmt psxyz -R -JM -JZ -p -So.3b -G%FS% -W.5 -K -O >> %ps%
awk "{print $1,$2,$4+$6+$8+$10+$12,$4+$6+$8+$10}" tmp | ^
gmt psxyz -R -JM -JZ -p -So.3b -G%G% -W.5 -K -O >> %ps%
awk "{print $1,$2,$4+$6+$8+$10+$12+$14,$4+$6+$8+$10+$12}" tmp | ^
gmt psxyz -R -JM -JZ -p -So.3b -G%C% -W.5 -K -O >> %ps%
awk "{print $1,$2,$4+$6+$8+$10+$12+$14+$16,$4+$6+$8+$10+$12+$14}" tmp | ^
gmt psxyz -R -JM -JZ -p -So.3b -G%CS% -W.5 -K -O >> %ps%
awk "{print $1,$2,$4+$6+$8+$10+$12+$14+$16+$18,$4+$6+$8+$10+$12+$14+$16}" tmp | ^
gmt psxyz -R -JM -JZ -p -So.3b -G%G% -W.5 -K -O >> %ps%
awk "{print $1,$2,$4+$6+$8+$10+$12+$14+$16+$18+$20,$4+$6+$8+$10+$12+$14+$16+$18}" tmp | ^
gmt psxyz -R -JM -JZ -p -So.3b -G%FS% -W.5 -K -O >> %ps%
awk "{print $1,$2,$3}" tmp | gmt pstext -R -JM -JZ -p -F+f12p=2p,white -D0/-.5 -K -O >> %ps%
awk "{print $1,$2,$3}" tmp | gmt pstext -R -JM -JZ -p -F+f12p -D0/-.5 -K -O >> %ps%

rem 061551G1
awk "{if ($3==""061551G1"""") print $0}" core.gmt > tmp
awk "{print $1,$2,$4,0}" tmp | gmt psxyz -R -JM -JZ -p -So.3 -G%G% -W.5 -K -O >> %ps%
awk "{print $1,$2,$4+$6,$4}" tmp | gmt psxyz -R -JM -JZ -p -So.3b -G%C% -W.5 -K -O >> %ps%
awk "{print $1,$2,$4+$6+$8,$4+$6}" tmp | gmt psxyz -R -JM -JZ -p -So.3b -G%FS% -W.5 -K -O >> %ps%
awk "{print $1,$2,$4+$6+$8+$10,$4+$6+$8}" tmp | ^
gmt psxyz -R -JM -JZ -p -So.3b -G%C% -W.5 -K -O >> %ps%
awk "{print $1,$2,$4+$6+$8+$10+$12,$4+$6+$8+$10}" tmp | ^
gmt psxyz -R -JM -JZ -p -So.3b -G%CS% -W.5 -K -O >> %ps%
awk "{print $1,$2,$4+$6+$8+$10+$12+$14,$4+$6+$8+$10+$12}" tmp | ^
gmt psxyz -R -JM -JZ -p -So.3b -G%G% -W.5 -K -O >> %ps%
awk "{print $1,$2,$4+$6+$8+$10+$12+$14+$16,$4+$6+$8+$10+$12+$14}" tmp | ^
gmt psxyz -R -JM -JZ -p -So.3b -G%FS% -W.5 -K -O >> %ps%
awk "{print $1,$2,$3}" tmp | gmt pstext -R -JM -JZ -p -F+f12p=2p,white -D0/-.5 -K -O >> %ps%
awk "{print $1,$2,$3}" tmp | gmt pstext -R -JM -JZ -p -F+f12p -D0/-.5 -K -O >> %ps%

rem legend
echo C %C% > tmp
echo L - - L Clay >> tmp
echo C %FS% >> tmp
echo L - - L Fine Sand >> tmp
echo C %CS% >> tmp
echo L - - L Coarse Sand >> tmp
echo C %G% >> tmp
echo L - - L Gravel >> tmp
gmt pslegend tmp -R -JM -JZ -p -Dx7.7/.5+w4 -F+g0+p1+s-6p/-4p/gray20@40 -K -O >> %ps%

gmt psxy -R -J -JZ -T -O >> %ps%
gmt psconvert %ps% -Tg -A -P
del tmp*
