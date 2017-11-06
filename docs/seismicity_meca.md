
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

---

## 9. 地震活動性與機制解
地震活動性是描述一段時間內，地震的空間分佈特性，包含其位置及深度，也紀錄地震強度的變化。
震源機制解是描述地震發震機制的一種方式，地震的發生，是由於斷層發生錯動，而透過對地震訊號進行分析，
從不同的測站得到地震波的方位角、入射角及初動的類型，把這些紀錄投影在大圓上，匯集資料得出震源機制解。

## 9.1 目的
  1. 地震活動性(Seismicity)
  2. 震源機制解(Focal Mechanism)
  3. 地震剖面(Seismicity Profile)

## 9.2 學習的指令與概念

* `gmtinfo`: 從表格資料中讀取資訊
* `psmeca`: 繪製震源機制解
* `psxy`: 繪製線、多邊形、符號
* Windows中批次檔`batch`常用指令
* `awk`語法的示範

## 9.3 地震活動性
從[地球物理資料庫](http://gdms.cwb.gov.tw/index.php)下載2017台灣地區的地震目錄(catalog)，資料共4欄，
分別是震央經度、震央緯度、深度、芮氏規模，透過GMT繪製地震活動性的地圖，
來更加了解台灣的地震分佈與地體構造活動。

使用的資料檔:
- [2017地震活動性](dat/2017_catalog.gmt)

成果圖
<p align="center">
  <img src="fig/9_3_seismicity_1.png"/>
</p>

批次檔
```bash
set ps=9_3_seismicity.ps
set data=D:\GMT_data\
set cpt=seis.cpt

# 1. seismicity basemap
gmt gmtinfo 2017_catalog.gmt -i2 -T20 > tmp
set /p cr=<tmp
gmt makecpt -C%cpt% %cr% > tmp.cpt
gmt psbasemap -R119/123/21/26 -JM15 -BwESn -Bxa -Bya -P -K > %ps%
gmt pscoast -R -JM -Df -W1 -S203/211/235 -G230 -K -O >> %ps%
awk "{print $1,$2,$3,exp($4)*0.002}" 2017_catalog.gmt | ^
gmt psxy -R -JM -Ctmp.cpt -Sc -K -O >> %ps%

# 2. magnitude calculation
echo 1 > tmp
for /l %%i in (2, 1, 6) do (echo %%i >> tmp)
setlocal ENABLEDELAYEDEXPANSION
set vidx=0
for /f %%i in ('awk "{print exp($1)*0.002}" tmp') do (
    set /A vidx=!vidx! + 1
    set var!vidx!=%%i
)
set var

# 3. legend set
echo H 18 1 Legend > tmp
echo D 0.4 1p >> tmp
echo G .7 >> tmp
echo B tmp.cpt 0.2 0.3+ml -Ba40f20+l"Depth (km)" >> tmp
echo G .3 >> tmp
echo M 121 23.5 100+u +f >> tmp
echo G .1 >> tmp
echo D 0.6 1p,0,- >> tmp
echo G .2 >> tmp
echo L 14 0 C Magnitude >> tmp
echo N 3 >> tmp
echo G .2 >> tmp
echo S .5 c %var1% 0 0 1 1 >> tmp
echo S .5 c %var2% 0 0 1 2 >> tmp
echo S .5 c %var3% 0 0 1 3 >> tmp
echo G .4 >> tmp
echo S .5 c %var4% 0 0 1 4 >> tmp
echo S .5 c %var5% 0 0 1 5 >> tmp
echo S .5 c %var6% 0 0 1 6 >> tmp
echo G .3 >> tmp
gmt pslegend tmp -R -JM -C.1/.1 -Dx.1/14+w5 -F+g245+p1+s4p/-4p/gray50 ^
--FONT_ANNOT_PRIMARY=10p --FONT_LABEL=14p -K -O >> %ps%

gmt psxy -R -JM -T -O >> %ps%
gmt psconvert %ps% -Tg -A -P
del tmp
```
學習到的指令:
* `makecpt`:

## 9.4 震源機制解
- [BATS](http://tecws.earth.sinica.edu.tw/BATS/cmtbyform.php)，由中研院管理，提供台灣地震的震源機制解。
- [Global CMT](http://www.globalcmt.org/CMTsearch.html)，由Lamont-Doherty Earth Observatory (LDEO) of Columbia University開發，
提供全球的震源機制解。

## 9.5 地震剖面

## 9.6 習題

## 9.7 參考批次檔
列出本章節使用的批次檔，供讀者參考使用，檔案路經可能會有些許不同，再自行修改。


---

[上一章](/topography_cpt.md) -- [下一章](/seismicity_histo.md)