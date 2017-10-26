
### 目錄
1. [總覽](/index.md)
2. [GMT介紹及安裝](/intro_install.md)
3. [網路資源及配套軟體](/net_software.md)
4. [第零章: 基本概念及默認值](/basic_defaults.md)
5. [第一章: 製作地圖(地理投影法)](/projection.md)
6. [第二章: XY散佈圖(其他投影法)](/xy_figure.md)
7. [第三章: 等高線圖及剖面](/contour_profile.md)
8. [第四章: 地形圖與色階](/topographic_cpt.md)

---

## 8. 地形圖及色階
當想要呈現三維的資料，可以利用xyz座標系畫出立體圖，但如果三維資料要呈現在二維平面上時，
除了利用等高線之外，還可以利用顏色來做為第三維度的變化，因此衍生出了色階，
在GMT裡稱作.cpt(color palette tables)。而這種方式被廣泛利用在各種成果展示上面，
其中一個就是地形圖，本章將介紹如何繪製地形圖以及搭配的色階檔。

## 8.1 目的
本章將學習如何繪製
  1. 簡介色階檔(cpt, color palette tables)
  2. 地形圖(Topography)
  3. 地形暈渲面(Hillshading)

## 8.2 學習的指令與概念

* `grdgradient`: 計算網格檔的梯度與照明度
* `grdimage`: 繪製色階地圖
* `grd2cpt`: 利用網格檔資料建立色階檔
* `psscale`: 繪製色階
* `makecpt`: 製作色階檔

## 8.3 簡介色階檔
色階的概念是將某一區段的資料用一種顏色來表示，這種技巧被應用在很多方面，像是熱影像圖、地形圖等等。
GMT在安裝的時後，同時有提供一些色階檔作為使用，這些檔案被安裝在==GMT根目錄/share/cpt==，
將打開==abyss.cpt==，裡面的內容:
```bash
#       $Id$
#
# Color table for bathymetry modeled after IBCSO
# at depth but turning lighter towards sea level.
# Designed by P. Wessel, SOEST
# COLOR_MODEL = RGB
-8000      black  	-7000	20/30/53
-7000	20/30/53  	-6000	38/60/106
-6000	38/60/106	-5000	46/80/133
-5000	46/80/133	-4000	53/99/160
-4000	53/99/160	-3000	72/151/211
-3000	72/151/211	-2000	90/185/233
-2000	90/185/233	-1000	141/210/239
-1000	141/210/239	0	245/255/255
B black
F white
N gray
```
一開始`#`之後的文字為註解，通常會紀錄設計者名稱、設計目的、使用的顏色模型，接著檔案的格式為四欄，
第一欄是起始範圍；第二欄色碼；第三欄是結束範圍；第四欄色碼，所以在-8000至-7000就是以黑色來表示，
在檔案的最下面**B**、**F**、**N**分別代表Background color、Foreground color及NaN color，簡單地說，
就是小於範圍中最小值所用的顏色、大於範圍中最大值值所用的顏色及無資料時所使用的顏色。
來看GMT有提供的色階檔畫出來的樣子:
<p align="center">
  <img src="fig/8_3_cpt_1.jpg"/>
</p>

## 8.4

## 8.5

## 8.6

## 8.7 習題

## 8.8 參考批次檔
列出本章節使用的批次檔，供讀者參考使用，檔案路經可能會有些許不同，再自行修改。

---

[上一章](/contour_profile.md) -- [下一章](/topography_cpt.md)