
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
11. [第七章: 台灣地理資訊](/taiwan_geography.md)
12. [第八章: 直方、圓餅、三元圖](/histo_pie_ternary.md)

---

## 12. 直方、圓餅、三元圖
在統計圖表中，除了之前介紹的折線圖、點散佈圖等，還有一些是平常生活中也常會使用到的，
本章將依序介紹GMT是如何繪製直方圖、圓餅圖及三元圖。

## 12.1 目的
本章將學習如何繪製
  1. 直方圖(Histogram)
  2. 圓餅圖(Pie Chart)
  3. 三元圖(Ternary)

## 12.2 學習的指令與概念

* `pshistogram`: 繪製直方圖

## 12.3 直方圖
當拿到散亂的大筆一維資料時，通常第一時間想到的分類方式是透過設定區間，將資料分類，
譬如期中考成績，透過固定分數級距，將分數轉變成A+、A、A-依序下去，
將不同級距的數量統計並繪製成圖，通常稱這種圖為直方圖。本節將利用2016台灣人口的年齡資料，
以每五歲為一個級距，來繪製人口金字塔圖。本次檔案有點大，故做壓縮處理。

使用的資料檔:
- [2016台灣人口年齡](dat/population_2016.rar)

成果圖

<p align="center">
  <img src="fig/12_3_population_histo_1.png"/>
</p>

批次檔
```bash
set ps=12_3_population_histo.ps
set cpt=haxby.cpt

gmt makecpt -C%cpt% -T0/100/5 -D > tmp.cpt
gmt pshistogram population_2016_b.dat -R0/102.5/0/1.3e6 -JX-12/15 ^
-BWeS+t"2016 Taiwan Age Distribution" -Bxa20f10+l"Age" -Bya+l"Male" ^
-A -Ctmp.cpt -D+o-1.7 -W5 -L0.5 -K > %ps%
gmt pshistogram population_2016_g.dat -R -JX12/15 ^
-BS -Bxa -Bya+l"Female" -A -Ctmp.cpt -D -W5 -L0.5 -X12 -K -O >> %ps%

gmt psxy -R -J -T -O >> %ps%
gmt psconvert %ps% -Tg -A -P
del tmp*
```

學習到的指令:
* `pshistogram`繪製直方圖。
  * `-W`間隔寬度。
    * 控制落在範圍外點的處理方式，**+b**範圍外的數據包含在第一個或最後一個級距中；
    **+l**只將小於範圍的放入第一個級距中；**+h**只將大於範圍的放入最後一個級距中。
  * `-A`改為繪製水平直方圖。
  * `-C`色階檔，依照每個間隔的中間值繪製對應顏色。
  * `-D`在每個Bar加上標注，內容為統計數目。
    * **+b**標注放在Bar底部，默認是頂部
    * **+f**字體
    * **+o**偏移量
    * **+r**標注從水平轉垂直
  * `-F`更改取邊界範圍的方式。以0到100為例，一般以10為一個級距，是算0~10為一間隔，
  使用`-F`將變成0~5、5~15為間隔。
  * `-G`填滿Bar的顏色。
  * `-I`輸出計算結果不繪圖，輸出<mark>x最小值 x最大值 y最小值 y最大值</mark>。
  * `-L`設定Bar的邊框屬性。
  * `-N`模式+p筆觸，繪製常態分佈曲線。
    * **mode=0**: mean and standard deviation
    * **mode=1**: median and L1 scale
    * **mode=2**: LMS mode and scale
  * `-Q`繪製累積直方圖。
  * `-S`繪製階梯直方圖。
  * `-Z`種類+w間隔，繪製其他種類直方圖。
    * **type=0**: count(默認值)
    * **type=1**: frequency_percent
    * **type=2**: log(1.0+count)
    * **type=3**: log(1.0+frequency_percent)
    * **type=4**: log10(1.0+count)
    * **type=5**: log10(1.0+frequency_percent)

從圖中了解到台灣已經度過人口紅利的時期，慢慢要進入高扶養比、高齡化的時代，
老人產業將會是下一個重要的課題，提早做好準備，或許能搶得一些先機。

## 12.4 圓餅圖

成果圖

批次檔
```bash
```

學習到的指令:

## 12.5 三元圖

成果圖

批次檔
```bash
```

學習到的指令:

## 12.6 習題

使用的資料檔:

完成圖如下:

## 12.7 參考批次檔
列出本章節使用的批次檔，供讀者參考使用，檔案路經可能會有些許不同，再自行修改。

---

[上一章](/taiwan_geography.md) -- [下一章](/histo_pie_ternary.md)
