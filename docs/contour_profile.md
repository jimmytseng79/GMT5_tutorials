
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

## 7. 等高線圖及剖面
本章將會先說明GMT所使用的網格檔是什麼、如何製作，接著如何將數值高程以等高線的方式呈現，
最後，當要看一條特定線上的高程變化時，如何利用GMT來繪製該線段的高度變化剖面。

## 7.1 目的
本章將學習如何繪製
  1. 簡介網格檔(Grid data)
  2. 等高線圖(Contour)
  3. 地形剖面(Profile)

## 7.2 學習的指令與概念

* `grdcontour`: 繪製等高線圖
* `grdcut`: 切割網格檔
* `grdinfo`: 從網格檔中獲取資訊
* `grdpaste`: 合併兩個有共同邊界的網格檔
* `grdtrack`: 對網格檔取樣
* `grd2xyz`: 轉換網格檔至ascii檔案格式
* `project`: 將資料投影至線、大圓或轉換座標系
* `pscoast`: 繪製海岸線
* `xyz2grd`: 轉換ascii檔案格式至網格檔
* `gdal_translate`轉檔程式

## 7.3 簡介網格檔
在開始學習繪製等高線圖之前，要先介紹GMT在繪製網格圖時所使用的檔案格式<mark>.grd</mark>，
它是屬於<mark>netCDF</mark>檔案格式，全名被稱做網路通用數據格式(Net Common Data Form)，
由於一般的10進位檔案格式(ascii)，相當地占用硬碟空間，因此常會將資料儲存成2進位的格式(binary)，
這樣可以有效地壓縮檔案所占用的空間。

用實際例子來說明檔案格式的差異，本章將會使用到政府資料開放平台中的[20公尺網格數值地形模組資料](https://data.gov.tw/dataset/35430)，
其中的不分福_全台及澎湖的資料，下載下來的<mark>.tif</mark>檔，透過一般的編譯器打開，如下圖:
<p align="center">
  <img src="fig/7_3_binaryView.png"/>
</p>
顯示出一推看不懂的亂碼，但如何想簡單的得知這個檔案理面的資料資訊，可以使用
```bash
gmt grdinfo 檔名
```
讀取<mark>Penghu_20m.tif</mark>，可得到資訊如下:
```bash
Penghu_20m.tif: Title: Grid imported via GDAL
Penghu_20m.tif: Command:
Penghu_20m.tif: Remark:
Penghu_20m.tif: Pixel node registration used [Cartesian grid]
Penghu_20m.tif: Grid file format: gd = Import/export through GDAL
Penghu_20m.tif: x_min: 76661.4764748 x_max: 121061.476475 x_inc: 20 name: x nx: 2220
Penghu_20m.tif: y_min: 2563952.79393 y_max: 2633852.79393 y_inc: 20 name: y ny: 3495
Penghu_20m.tif: z_min: -999 z_max: 70.5 name: z
Penghu_20m.tif: scale_factor: 1 add_offset: 0
+proj=tmerc +lat_0=0 +lon_0=121 +k=0.9999 +x_0=250000 +y_0=0 +ellps=GRS80 +units=m +no_defs
```
從這些資訊可以得知標題、X、Y、Z軸的範圍和間距，放大倍率(scale_factor)等等的訊息。
但這檔案要提供給GMT使用，會遇到兩個問題，第一，檔案格式為<mark>Geotiff</mark>，
利用[GDAL](http://www.gdal.org/index.html)(地理空間資料抽象化文庫, Geospatial Data Abstraction Library)提供的轉檔程式<mark>gdal_translate</mark>，
透過指令，
```bash
gdal_translate -of XYZ [input.tif] [output.xyz]
```
將<mark>.tif</mark>檔轉換成<mark>.xyz</mark>檔。第二，由於內政部提供的檔案其座標系是<mark>TWD97</mark>，
而GMT繪製地圖慣用在<mark>WGS84座標系</mark>，因此需要做座標系轉換，透過Python，將檔案轉成WGS84座標系，
完成後再將<mark>.xyz</mark>檔轉換成<mark>.grd檔</mark>。
```bash
gmt xyz2grd [input.xyz] -R119.0/119.9/21.8/25.4 -I0.6s/0.6s -G[output.grd]
```
其中`-R`是給定檔案的X、Y軸範圍，`-I`給與X、Y軸的間隔，後面的英文字代表單位，
**m**對應角分、**m**對應角秒、**e**對應公尺、**k**對應公里，`-G`給予輸出檔名稱。
另外常用到的就是`-A`處理多數據重疊在某點時的方法:
* **-Af**選第一個落在重複座標上的數值做為該座標值。
* **-As**選最後一個落在重複座標上的數值做為該座標值。
* **-Al**選最小...
* **-Au**選最大...
* **-Ad**選最大最小的差值...
* **-Am**選平均...
* **-Ar**選RMS(方均根)...
* **-As**選標準差...
* **-An**選出現次數...
* **-Az**選總合...

以及`-D`寫檔頭資訊:
* **+x**x軸名稱，格式為名稱 [單位]，例如distance [km]。
* **+y**、**+z**同上。
* **+s**讀取網格數據後的放大倍率，默認值為1。
* **+o**讀取網格數據後要加上的常數，默認值為0。
* **+n**指定特定數值為無效值，默認為NaN。
* **+t**網格檔的標題。
* **+r**網格檔的註解。

同樣的，也可以透過
```bash
gmt grd2xyz input.grd > output.xyz
```
將網格檔轉回==.xyz==檔。

透過上述方式，成功地將內政部提供的數值高程檔轉換成GMT繪圖使用的格式，在這個範例中，
一般<mark>.xyz</mark>的檔案大小約為420MB，轉換成<mark>.grd</mark>的格式後，變成4.61MB，大大地節省硬碟空間。
使用一樣的做法，把台灣本島的數值高程也轉換成功後，不希望之後畫圖都要分開讀取台灣本島以及澎湖，所以使用:
```bash
gmt grdpaste input1.grd input2.grd -Goutput.grd -fg
```
把兩個擁有共同邊界的網格檔給合併，`-f`是指定輸入及輸出資料的格式，
* **-ff**給予浮點數格式
* **-fg**地理座標系統
* **-fc**卡式座標系統

當然一次讀取這麼大的數值資料，會耗費很長的時間，因此可以利用GMT提供的網格切割指令:
```bash
gmt grdcut input.grd -Goutput.grd -R範圍
```
將網格檔切割成較小的區域來做使用，接下來，繪製等高線圖的部份，將會使用以花東縱谷做為範圍切割的網格檔。
資料壓縮的方式非常多種，無法在此一一介紹，編者以使用過的經驗作為分享，請見諒。

## 7.4 等高線圖
等高線或稱等值線圖，是將資料中等值的資料點連接起來，借此了解地勢的高低起伏，其中每條線的疏密程度，
則可用來判斷坡度的緩急，辨識河谷、山稜線、峭壁等等的地形。設定範圍在==121.33/121.68/23.55/24.1==，
使用`grdcut`將網格檔切割成較小的區域。

花東縱谷由菲律賓海板塊與歐亞板塊擠壓而形成，原本的谷地受到河川的侵蝕，形成廣闊的沖積扇平原，
成為了花東一帶，最富庶的地區。在平原中，寬廣的視野，觀看東西兩側(中央山脈、海岸山脈)的高聳入雲，
不由得讚嘆大自然的神奇，就讓我們來看看其高程的變化吧！

使用的資料檔:
- [花東縱谷數值地形檔](dat/east_rift_valley.grd)

成果圖
<p align="center">
  <img src="fig/7_4_east_rift_valley_1.png"/>
</p>

批次檔
```bash
set ps=7_4_east_rift_valley.ps

# left figure without clip
gmt pscoast -R121.33/121.68/23.55/24.1 -JM10 -BWeSn -Bxa.2 -Bya.2 ^
-Df -W1 -G194/250/216 -S175/243/255 -K > %ps%
gmt grdcontour east_rift_valley.grd -R -JM -C250 -A1000+f12p -K -O >> %ps%

# right figure with clip
gmt pscoast -R121.33/121.68/23.55/24.1 -JM10 -BWeSn -Bxa.2 -Bya.2 ^
-Df -W1 -G194/250/216 -S175/243/255 -X13 -K -O >> %ps%
gmt pscoast -R -JM -Df -Gc -K -O >> %ps%
gmt grdcontour east_rift_valley.grd -R -JM -C250 -A1000+an+f12p+g255/153/199 ^
-Gd15c -Wc.5,255/110/110 -Wa1,180/13/13 -Q180 -K -O >> %ps%
gmt pscoast -R -JM -Q -K -O >> %ps%

gmt psxy -R -JM -T -O >> %ps%
gmt psconvert %ps% -Tg -A -P
```

本節學習的新指令:
* 第6,12行: `grdcontour`透過網格檔繪製等高線，語法是`grdcontour 網格檔 -C間隔值`，其中最常用到的選項:
  * **-A**繪製有註解的等高線:
    * **+a**註解的角度，**+an**垂直等高線；**+ap**平行等高線(默認值)
    * **+f**註解字體的屬性
    * **+g**字體框的底色
    * **+p**字體框框線的屬性
  * **-C**繪製無註解的等高線，有三種方式:
    * 給一個數字，會以此繪製固定間隔的等高線
    * 使用.cpt檔，等高線會依照色階檔的設定來繪製，未來將介紹
    * 使用一個檔案，第一欄是高度，第二欄是C或A
  * **-G**註解的間隔設定:
    * 依照距離來取決間隔，**d**用圖紙的單位；**D**用地圖的單位
    * **f**給一個檔案ffile.d，依照檔案中的位置，繪製註解
    * 依照線段來取決，**l**起始/結束，用,來區分每條線，**L**使用大圓路徑
    * **n**給一條線中等距標籤的數量。
  * **-W**等高線的屬性，**-Wa**設定有註解的等高線；**-Wc**設定無註解的等高線
* 第11行: `pscoast -Gc`開啟海岸線切割模式。
* 第13行: `pscoast -Q`關閉海岸線切割模式。



## 7.5 地形剖面

## 7.6 習題

## 7.7 參考批次檔
列出本章節使用的批次檔，供讀者參考使用，檔案路經可能會有些許不同，再自行修改。

---

[上一章](/xy_figure.md) -- [下一章](/topographic_cpt.md)