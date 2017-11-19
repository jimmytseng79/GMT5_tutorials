
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

---

## 11. 台灣地理資訊
本章的目的較為特殊，其目的是提供讀者繪製台灣地區常用的地理資訊，
並不針對特定模組做詳細的闡述，只針對處理這些資料會用到的指令做必要的說明，所使用的資料可以從
[交通網路資訊倉儲系統](https://gist.motc.gov.tw)及
[政府資料開放平台](https://data.gov.tw/)找到，下載後的檔案處理流程，包含轉換座標系統及
排版將不墜述，如想了解，歡迎聯繫我。

## 11.1 目的
本章將學習如何繪製
  1. 交通系統(Traffic Network)
  2. 行政邊界(Region Border)
  3. 河川流域(Drainage Area)
  4. 斷層分佈及型態(Fault System)
  5. 人口密度(Population Density)

## 11.2 學習的指令與概念

* `gmtconvert`: 處理多區塊式文件
* `gmtspatial`: 地理空間中線和多邊形的操作
* `makecpt`: 製作色階檔
* `psscale`: 繪製色彩條
* `pstext`: 在圖上進行排版文字
* `psxy`: 繪製線、多邊形、符號
* `awk`及`sed`語法的示範

## 11.3 交通系統

使用的資料檔:

成果圖
<p align="center">
  <img src="fig/11_3_taiwan_road_1.png"/>
</p>

批次檔
```bash
```
學習到的指令:


## 11.4 行政邊界

使用的資料檔:

成果圖
<p align="center">
  <img src="fig/11_4_region_border_1.png"/>
</p>

批次檔
```bash
```
學習到的指令:

## 11.5 河川流域

使用的資料檔:

成果圖
<p align="center">
  <img src="fig/11_5_drainage_area_1.png"/>
</p>

批次檔
```bash
```
學習到的指令:

## 11.6 斷層分佈及型態

使用的資料檔:

完成圖如下:
<p align="center">
  <img src="fig/11_6_cgs_fault_1.png"/>
</p>

批次檔
```bash
```
學習到的指令:

完成圖如下:
<p align="center">
  <img src="fig/11_6_fault_type_1.png"/>
</p>

批次檔
```bash
```
學習到的指令:


## 11.7 人口密度

使用的資料檔:

完成圖如下:
<p align="center">
  <img src="fig/11_7_population_density_1.png"/>
</p>

批次檔
```bash
```
學習到的指令:

## 11.8 參考批次檔
列出本章節使用的批次檔，供讀者參考使用，檔案路經可能會有些許不同，再自行修改。

---

[上一章](/vector_velocity.md) -- [下一章](/taiwan_geography.md)

---
