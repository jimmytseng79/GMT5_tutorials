set ps=6_3_accidentalDeath.ps

rem 製作底圖框架
gmt psbasemap -R0/100/0/450 -JX20/15 -Bxa5+l"Age" -Bya50+l"Deaths (count)" ^
-BWeSn+t"2016 Taiwan Accidental Deaths" -K > %ps%

rem 繪製垂直虛線
echo 15 0 > area
echo 15 450 >> area
gmt psxy area -R -JX -W1.5,180/180/255,-. -K -O >> %ps%
echo 75 0 > area
echo 75 450 >> area
gmt psxy area -R -JX -W1.5,255/180/180,-. -K -O >> %ps%

rem 繪製死亡人數資料點
awk "$3==1 {print $1, $2}" dead105.dat | gmt psxy -R -JX -Sd.4 ^
-G30/34/170 -W1 -K -O >> %ps%
awk "$3==2 {print $1, $2}" dead105.dat | gmt psxy -R -JX -Sc.4 ^
-G208/0/111 -W1 -K -O >> %ps%

rem 圖例框與圖例說明
echo 1 385 > area
echo 15.5 385 >> area
echo 15.5 445 >> area
echo 1 445 >> area
gmt psxy area -R -JX -W1 -G255 -L -K -O >> %ps%
echo 3 430 | gmt psxy -R -JX -Sd.4 -G30/34/170 -W1 -K -O >> %ps%
echo 6 430 Male | gmt pstext -R -JX -F+f14+jML -K -O >> %ps%
echo 3 400 | gmt psxy -R -JX -Sc.4 -G208/0/111 -W1 -K -O >> %ps%
echo 6 400 Female | gmt pstext -R -JX -F+f14+jML -O >> %ps%

rem 轉成.png檔，刪除暫存資料
gmt psconvert %ps% -Tg -A -P
del area