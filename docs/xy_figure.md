
### 目錄
1. [總覽](/index.md)
2. [GMT介紹及安裝](/intro_install.md)
3. [網路資源及配套軟體](/net_software.md)
4. [第零章: 基本概念及默認值](/basic_defaults.md)
5. [第一章: 製作地圖(地理投影法)](/projection.md)
6. [第二章: XY散佈圖(其他投影法)](/xy_figure.md)

---

## 6. XY散佈圖
除了將資料展示在地圖上，另一個數據分析很重要的圖表格式就是XY散佈圖。本章將分成4個小節介紹
1. 線性軸(Linear)
2. 指數軸(Logarithmic)
3. 時間序列(Time)
4. 極軸(Polar)

## 6.1 目的

## 6.2 學習的指令與概念

## 6.3 線性軸
當我們想知道兩個變數之間的關係，常會用到XY散佈圖來表示，看兩者之間是正相關還是負相關。
此節利用[死因統計](https://data.gov.tw/dataset/5965)，想知道意外事故死亡人數，在各年齡層之間的變化，
以及與性別的關係。首先先來看成果圖及批次檔。

成果圖
<p align="center">
  <img src="fig/6_3_accidentalDeath_1.png"/>
</p>

批次檔
```bash
set ps=6_3_accidentalDeath.ps

gmt psbasemap -R0/100/0/450 -JX20/15 -BWeSn+t"2016 Taiwan Accidental Deaths" ^
-Bxa5+l"Age" -Bya50+l"Deaths (count)" -K > %ps%
awk "$3==1 {print $1, $2}" dead105.dat | gmt psxy -R -JX -Sd.4 -G30/34/170 ^
-W1 -K -O >> %ps%
awk "$3==2 {print $1, $2}" dead105.dat | gmt psxy -R -JX -Sc.4 -G208/0/111 ^
-W1 -K -O >> %ps%
echo 1 385 > area
echo 15 385 >> area
echo 15 445 >> area
echo 1 445 >> area
gmt psxy area -R -JX -W1 -L -K -O >> %ps%
echo 3 430 | gmt psxy -R -JX -Sd.4 -G30/34/170 -W1 -K -O >> %ps%
echo 6 430 Male | gmt pstext -R -JX -F+f14+jML -K -O >> %ps%
echo 3 400 | gmt psxy -R -JX -Sc.4 -G208/0/111 -W1 -K -O >> %ps%
echo 6 400 Female | gmt pstext -R -JX -F+f14+jML -O >> %ps%

gmt psconvert %ps% -Tg -A -P
```

---

[上一章](/projection.md) -- [下一章](/xy_figure.md)