
### 目錄
1. [總覽](/index.md)
2. [GMT介紹及安裝](/intro_install.md)
3. [網路資源及配套軟體](/net_software.md)
4. [第零章: 基本概念及默認值](/basic_defaults.md)
5. [第一章: 製作地圖(地理投影法)](/projection.md)
6. [第二章: XY散佈圖(其他投影法)](/xy_figure.md)
7. [第三章: 地形圖及色階](/topographic_cpt.md)

---

## 7. 地形圖及色階
當想要呈現三維的資料，可以利用xyz座標系畫出立體圖，但如果三維資料要呈現在二維平面上時，
可以利用顏色來做為第三維度的變化，而衍生出了色階，在GMT裡稱作.cpt(color palette tables)。
而這種方式被廣泛利用在各種成果展示上面，其中一個就是地形圖，本章將介紹如何繪製地形圖以及
搭配的資料處理工具。

## 7.1 目的
本章將學習如何繪製
  1. 等高線圖(Contour)
  2. 地形剖面(Profile)
  3. 地形圖(Topographic)
  4. 暈渲地形圖(Hillshading)

## 7.2 學習的指令與概念

* `grdcontour`: 繪製等高線圖
* `grdgradient`: 計算網格檔的梯度與照明度
* `grdimage`: 繪製色階地圖
* `grdinfo`: 從網格檔中獲取資訊
* `grdtrack`: 對網格檔取樣
* `grd2cpt`: 利用網格檔資料建立色階檔
* `makecpt`: 製作色階檔
* `project`: 將資料投影至線、大圓或轉換座標系

## 7.3 等高線圖

## 7.4 地形剖面

## 7.5 地形圖

## 7.6 暈渲地形圖

## 7.7 習題

## 7.8 參考批次檔
列出本章節使用的批次檔，供讀者參考使用，檔案路經可能會有些許不同，再自行修改。

---

[上一章](/xy_figure.md) -- [下一章](/topographic_cpt.md)