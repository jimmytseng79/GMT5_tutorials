
### 目錄
1. [總覽](/index.md)
2. [GMT介紹及安裝](/intro_install.md)
3. [網路資源及配套軟體](/net_software.md)
4. [第零章: 基本概念及默認值](/basic_defaults.md)
5. [第一章: 製作地圖(地理投影法)](/projection.md)
6. [第二章: XY散佈圖(其他投影法)](/xy_figure.md)
7. [第三章: 等高線圖及剖面](/contour_profile.md)
8. [第四章: 地形圖與色階](/topography_cpt.md)
9. [第五章: 地震活動性與機制解](/seismicity_meca.md)
10. [第六章: 向量與速度場](/vector_velocity.md)

---

## 10. 向量與速度場
向量(vector)是用來同時表達大小與方向的幾何圖形，在6-6極軸中，
介紹了利用極軸來表示四個氣象站夏季與冬季的風量(大小)及風向(方向)，
明顯地，這種資料符合向量所描述的對象，當想把這些帶有大小及方向性的資料繪製在地圖時，
要如何利用GMT來繪製向量，將在本章介紹。

## 10.1 目的
本章將學習如何繪製
  1. 向量(Vector)
  2. 速度場(Velocity Field)

## 10.2 學習的指令與概念

* `psxy`: 繪製線、多邊形、符號

## 10.3 向量
在開始將向量繪製在地圖上前，首先先熟習GMT在繪製箭頭上的語法，使用的模組是`psxy`，
但是選項是之前沒介紹的笛卡爾向量`-Sv(V)`及弧形向量`-Sm`，而地理向量`-S=`將在不本章介紹，
就來看看向量有哪些變化吧！

成果圖
<p align="center">
  <img src="fig/10_3_vector_1.png"/>
</p>

批次檔
```bash
set ps=10_3_vector.ps

gmt psbasemap -R0/19/0/15 -JX19/15 -BWESN -Bag1 -K > %ps%

# 1. -Sv
echo 2 1 0 1.5 | gmt psxy -R -JX -Sv.5+e -W1.5 -Gred -K -O >> %ps%
echo 1.8 1 0\260 | gmt pstext -R -JX -F+f14p,1+jMR -G255 -K -O >> %ps%
echo 2 1.5 90 1.5 | gmt psxy -R -JX -Sv.5+e -W1.5 -Gred -K -O >> %ps%
echo 1.8 2 90\260 | gmt pstext -R -JX -F+f14p,1+jMR -G255 -K -O >> %ps%
echo 2 3.5 180 1.5 | gmt psxy -R -JX -Sv.5+e -W1.5 -Gred -K -O >> %ps%
echo 2.2 3.5 180\260 | gmt pstext -R -JX -F+f14p,1+jML -G255 -K -O >> %ps%
echo 2 5.5 270 1.5 | gmt psxy -R -JX -Sv.5+e -W1.5 -Gred -K -O >> %ps%
echo 2.2 5 270\260 | gmt pstext -R -JX -F+f14p,1+jML -G255 -K -O >> %ps%
echo 1.25 6.25 -Sv | gmt pstext -R -JX -F+f18p,1+jML -G255 -K -O >> %ps%

# 2. -SV
echo 6 1 0 1.5 | gmt psxy -R -JX -SV.5+e -W1.5 -Gred -K -O >> %ps%
echo 5.8 1.5 0\260 | gmt pstext -R -JX -F+f14p,1+jMR -G255 -K -O >> %ps%
echo 6 3.0 90 1.5 | gmt psxy -R -JX -SV.5+e -W1.5 -Gred -K -O >> %ps%
echo 5.8 3.0 90\260 | gmt pstext -R -JX -F+f14p,1+jMR -G255 -K -O >> %ps%
echo 6 5.0 180 1.5 | gmt psxy -R -JX -SV.5+e -W1.5 -Gred -K -O >> %ps%
echo 6.2 4.5 180\260 | gmt pstext -R -JX -F+f14p,1+jML -G255 -K -O >> %ps%
echo 6 5.5 270 1.5 | gmt psxy -R -JX -SV.5+e -W1.5 -Gred -K -O >> %ps%
echo 6.2 5.5 270\260 | gmt pstext -R -JX -F+f14p,1+jML -G255 -K -O >> %ps%
echo 5.25 6.25 -SV | gmt pstext -R -JX -F+f18p,1+jML -G255 -K -O >> %ps%

# 3. -Sm
echo 1 7 2 0 90 | gmt psxy -R -JX -Sm0.2i+e -W1.5 -Gred -K -O >> %ps%
echo 1 7.5 0~90\260 | gmt pstext -R -JX -F+f14p,1+jML -G255 -K -O >> %ps%
echo 5 9 2 270 450 | gmt psxy -R -JX -Sm0.2i+e -W1.5 -Gred -K -O >> %ps%
echo 4 8 270~450\260 | gmt pstext -R -JX -F+f14p,1+jML -G255 -K -O >> %ps%
echo 3 12 2 0 270 | gmt psxy -R -JX -Sm0.2i+e -W1.5 -Gred -K -O >> %ps%
echo 3 12 0~270\260 | gmt pstext -R -JX -F+f14p,1+jMC -G255 -K -O >> %ps%
echo 3.5 9.5 -Sm | gmt pstext -R -JX -F+f18p,1+jML -G255 -K -O >> %ps%

# 4. vector type
echo 9 14 0 3 | gmt psxy -R -JX -Sv.5+ba+ea -W1.5 -Gred -K -O >> %ps%
echo 12.5 14 -Sv.5+ba+ea | gmt pstext -R -JX -F+f14p,1+jML -G255 -K -O >> %ps%
echo 9 13 0 3 | gmt psxy -R -JX -Sv.5+ba+ea -W1.5 -Gred -K -O --MAP_VECTOR_SHAPE=-2 >> %ps%
echo 12.5 13 MAP_VECTOR_SHAPE=-2 | gmt pstext -R -JX -F+f12p,1+jML -G255 -K -O >> %ps%
echo 9 12 0 3 | gmt psxy -R -JX -Sv.5+ba+ea -W1.5 -Gred -K -O --MAP_VECTOR_SHAPE=-1 >> %ps%
echo 12.5 12 MAP_VECTOR_SHAPE=-1 | gmt pstext -R -JX -F+f12p,1+jML -G255 -K -O >> %ps%
echo 9 11 0 3 | gmt psxy -R -JX -Sv.5+ba+ea -W1.5 -Gred -K -O --MAP_VECTOR_SHAPE=1 >> %ps%
echo 12.5 11 MAP_VECTOR_SHAPE=1 | gmt pstext -R -JX -F+f12p,1+jML -G255 -K -O >> %ps%
echo 9 10 0 3 | gmt psxy -R -JX -Sv.5+ba+ea -W1.5 -Gred -K -O --MAP_VECTOR_SHAPE=2 >> %ps%
echo 12.5 10 MAP_VECTOR_SHAPE=2 | gmt pstext -R -JX -F+f12p,1+jML -G255 -K -O >> %ps%
echo 9 9 0 3 | gmt psxy -R -JX -Sv.5+bt+e -W1.5 -Gred -K -O >> %ps%
echo 12.5 9 -Sv.5+bt+e | gmt pstext -R -JX -F+f14p,1+jML -G255 -K -O >> %ps%
echo 9 8 0 3 | gmt psxy -R -JX -Sv.5+b+ec -W1.5 -Gred -K -O >> %ps%
echo 12.5 8 -Sv.5+b+ec | gmt pstext -R -JX -F+f14p,1+jML -G255 -K -O >> %ps%
echo 9 7 0 3 | gmt psxy -R -JX -Sv.5+b+e+r -W1.5 -Gred -K -O >> %ps%
echo 12.5 7 -Sv.5+b+e+r | gmt pstext -R -JX -F+f14p,1+jML -G255 -K -O >> %ps%
echo 9 6 0 3 | gmt psxy -R -JX -Sv.5+b+e+l -W1.5 -Gred -K -O >> %ps%
echo 12.5 6 -Sv.5+b+e+l | gmt pstext -R -JX -F+f14p,1+jML -G255 -K -O >> %ps%
echo 9 5 0 3 | gmt psxy -R -JX -Sv.5+b+e+a90 -W1.5 -Gred -K -O >> %ps%
echo 12.5 5 -Sv.5+b+e+a90 | gmt pstext -R -JX -F+f14p,1+jML -G255 -K -O >> %ps%
echo 9 4 0 3 | gmt psxy -R -JX -Sv.5+mf -W1.5 -Gred -K -O >> %ps%
echo 12.5 4 -Sv.5+mf | gmt pstext -R -JX -F+f14p,1+jML -G255 -K -O >> %ps%
echo 9 3 0 3 | gmt psxy -R -JX -Sv.5+mr -W1.5 -Gred -K -O >> %ps%
echo 12.5 3 -Sv.5+mr | gmt pstext -R -JX -F+f14p,1+jML -G255 -K -O >> %ps%
echo 9 2 0 3 | gmt psxy -R -JX -Sv.5+b+e+t.5 -W1.5 -Gred -K -O >> %ps%
echo 12.5 2 -Sv.5+b+e+t.5 | gmt pstext -R -JX -F+f14p,1+jML -G255 -K -O >> %ps%
echo 9 1 0 3 | gmt psxy -R -JX -Sv.5+b+e+t-.5/.5 -W1.5 -Gred -K -O >> %ps%
echo 12.5 1 -Sv.5+b+e+t-.5/.5 | gmt pstext -R -JX -F+f14p,1+jML -G255 -K -O >> %ps%

gmt psxy -R -J -T -O >> %ps%
gmt psconvert %ps% -Tg -A -P
del tmp*
```
學習到的指令:

* `-Sv`笛卡爾向量(直線向量)，對應的資料格式<mark>x軸位置 y軸位置 角度 長度 (大小)</mark>，
角度是從水平逆時針旋轉算起，如果沒有在`-Sv`指定大小，將會讀取第五欄的大小。
  * **+a**設定向量頭(vector head)的角度大小，默認值是30。
  * **+b**在起使位置繪製向量。
    * **t**向量改用終端線(terminal line)表示
    * **c**向量改用圓形表示
    * **a**向量改用箭頭表示，默認值
  * **+e**在結束位置繪製向量，其餘設置同**+b**。
  * **+l**只繪製左半邊的箭頭。
  * **+m**將向量頭繪製在中間，其餘設置同**+b**。
    * **f**箭頭朝終點方向
    * **r**箭頭朝起點方向
  * **+r**只繪製右半邊的箭頭。
  * **+t**偏移起始點與終點位置。
  * **+s**資料格式改成<mark>起始x軸位置 起始y軸位置 結束x軸位置 結束y軸位置</mark>
  * **--MAP_VECTOR_SHAPE**設定向量頭的種類，數值從-2到2。
* `-SV`的語法和`-Sv`一樣，除了角度是從北邊開始順時鐘算起。
* `-Sm`弧形向量，對應的資料格式<mark>圓心x軸位置 圓心y軸位置 半徑 起始角度 結束角度</mark>。
* `-G`向量頭的顏色。
* `-W`設定線段的寬度。

從上圖中可以清楚地從各圖片配合旁邊的文字解說，了解各種向量頭的繪製方式，在新版(5.4.2)中，
還有新增幾種向量頭的表示方式，**i**向量改用箭尾表示、**A**向量改用箭頭表示、
**I**向量改用簡單箭尾表示，下一節將利用這些知識，加上實際的資料，
來看看把向量繪製在地圖上的效果。

## 10.4 速度場

## 10.5

## 10.6 習題

## 10.7 參考批次檔
列出本章節使用的批次檔，供讀者參考使用，檔案路經可能會有些許不同，再自行修改。

---

[上一章](/seismicity_meca.md) -- [下一章](/vector_velocity.md)

---
