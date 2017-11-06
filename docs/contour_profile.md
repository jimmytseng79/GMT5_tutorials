
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
* `gmtinfo`: 從表格資料中讀取資訊
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
其中
* `-R`是給定檔案的X、Y軸範圍。
* `-I`給與X、Y軸的間隔，後面的英文字代表單位。
  * **m**對應角分。
  * **m**對應角秒。
  * **e**對應公尺。
  * **k**對應公里。
* `-G`給予輸出檔名稱。
* 另外常用到的就是`-A`處理多數據重疊在某點時的方法:
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
* 以及`-D`寫檔頭資訊:
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
將網格檔轉回<mark>.xyz</mark>檔。

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
則可用來判斷坡度的緩急，辨識河谷、山稜線、峭壁等等的地形。設定範圍在<mark>121.33/121.68/23.55/24.1</mark>，
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
    * **n**給一條線中等距標籤的數量
  * **-W**等高線的屬性，**-Wa**設定有註解的等高線；**-Wc**設定無註解的等高線。
  * **-Q**省略資料點小於多少的等高線。
* 第11行: `pscoast -Gc`開啟海岸線切割模式。
* 第13行: `pscoast -Q`關閉海岸線切割模式。

希望透過兩張圖的比較，能更加知道各指令變化後，繪製出來的差異。從左右兩張的差異來看，
最明顯的莫過於海的部份，由於在數值地形在海的部份，並無資料，而當初在轉檔時，皆將此視作為零，
導致了大量的等高線繪製於此，為了避免此現象發生，可以再畫一次海的顏色，也可以透過`pscoast -Gc`及`-Q`，
來限制等高線繪製的範圍。

`-A`、`-C`、`-W`，其詳細的設定方式，像是**+f**、**+p**都和前兩張提到的方式一樣，透過上述的簡介
配合指令檔，就可以理解左右兩圖的差異。唯`-Q`是較特別的選項，有時後等高線的資料點數不多，
造成繪製在圖上是一點一點的，有礙觀瞻，透過限制最小資料點數，將可避免這現象的發生。

## 7.5 地形剖面
在上一節中，介紹了呈現在平面上的等高線圖(X、Y方向)，那如果想看特定某一條線段，其X、Z方向的變化，
本節將介紹如何利用GMT來完成繪製地形剖面。

成果圖
<p align="center">
  <img src="fig/7_5_elevation_profile_1.png"/>
</p>

批次檔
```bash
# 1. set two profile start point and end point
set ps=7_5_elevation_profile.ps
set A_lon1=121.38
set A_lat1=24.07
set A_lon2=121.5
set A_lat2=23.6
set B_lon1=121.54
set B_lat1=24.06
set B_lon2=121.47
set B_lat2=24.0

# 2. contour basemap
gmt pscoast -R121.33/121.68/23.55/24.1 -JM10 -BWeSn -Bxa.2 -Bya.2 ^
-Df -W1 -G194/250/216 -S175/243/255 -K --MAP_FRAME_TYPE=plain > %ps%
gmt pscoast -R -JM -Df -Gc -K -O >> %ps%
gmt grdcontour east_rift_valley.grd -R -JM -C250 -A1000+f10p ^
-Wc.5,150 -Wa1,30 -Q180 -K -O >> %ps%
gmt pscoast -R -JM -Q -K -O >> %ps%

# 3. AA' line
echo %A_lon1% %A_lat1% > tmp
echo %A_lon2% %A_lat2% >> tmp
gmt psxy tmp -R -JM -W2,238/91/78 -K -O >> %ps%
echo %A_lon1% %A_lat1% A > tmp
gmt psxy tmp -R -JM -Sc.8 -G238/91/78 -W1 -K -O >> %ps%
gmt pstext tmp -R -JM -F+f16p,0,blue -K -O >> %ps%
echo %A_lon2% %A_lat2% A' > tmp
gmt psxy tmp -R -JM -Sc.8 -G238/91/78 -W1 -K -O >> %ps%
gmt pstext tmp -R -JM -F+f16p,0,blue -K -O >> %ps%

# 4. BB' line
echo %B_lon1% %B_lat1% > tmp
echo %B_lon2% %B_lat2% >> tmp
gmt psxy tmp -R -JM -W2,234/235/128 -K -O >> %ps%
echo %B_lon1% %B_lat1% B > tmp
gmt psxy tmp -R -JM -Sc.8 -G234/235/128 -W1 -K -O >> %ps%
gmt pstext tmp -R -JM -F+f16p -K -O >> %ps%
echo %B_lon2% %B_lat2% B' > tmp
gmt psxy tmp -R -JM -Sc.8 -G234/235/128 -W1 -K -O >> %ps%
gmt pstext tmp -R -JM -F+f16p -K -O >> %ps%

# 5. thumbnail map
gmt pscoast -R119.9/122.1/21.8/25.4 -JM3 -Bwesn -Ba -Df -W1 -S255 -G230 ^
-X7 -K -O --MAP_FRAME_TYPE=inside >> %ps%
echo 121.33 23.55 > tmp
echo 121.68 23.55 >> tmp
echo 121.68 24.1 >> tmp
echo 121.33 24.1 >> tmp
gmt psxy tmp -R -JM -W2 -L -K -O >> %ps%

# 6. AA' profile
gmt project -C%A_lon1%/%A_lat1% -E%A_lon2%/%A_lat2% -G0.1 -Q | ^
gmt grdtrack -Geast_rift_valley.grd > tmp
gmtinfo tmp -i2,3 -I1/10 > tmp1
set /p pr=<tmp1
gmtinfo tmp -i2 -Cmax -o1 > tmp1
set /p md=<tmp1
sed -i '1i %A_lon1% %A_lat1% 0 0' tmp
sed -i '$a %A_lon2% %A_lat2% %md% 0' tmp
awk "{print $3, $4}" tmp | gmt psxy %pr% -JX12/6 -W2 -G238/91/78 -X5 -Y.5 -K -O >> %ps%
gmt psbasemap -R -JX -BwESn+t"AA' Profile" -Bxa+l"Distance (km)" ^
-Bya+l"Elevation (m)" -K -O --FONT_TITLE=24p,0,blue >> %ps%

# 7. BB' profile
gmt project -C%B_lon1%/%B_lat1% -E%B_lon2%/%B_lat2% -G0.1 -Q | ^
gmt grdtrack -Geast_rift_valley.grd > tmp
gmtinfo tmp -i2,3 -I1/10 > tmp1
set /p pr=<tmp1
gmtinfo tmp -i2 -Cmax -o1 > tmp1
set /p md=<tmp1
sed -i '1i %B_lon1% %B_lat1% 0 0' tmp
sed -i '$a %B_lon2% %B_lat2% %md% 0' tmp
awk "{print $3, $4}" tmp | gmt psxy %pr% -JX -W2 -G234/235/128 -Y9 -K -O >> %ps%
gmt psbasemap -R -JX -BwESn+t"BB' Profile" -Bxa -Bya+l"Elevation (m)" -K -O >> %ps%

gmt psxy -R -JX -T -O >> %ps%
gmt psconvert %ps% -Tg -A -P
del tmp*
```

本次批次檔篇幅較長，將利用註解號碼來依序解說，本節學習的新指令:

<mark>1</mark> 設定兩條剖面線的經緯度，漸漸去習慣把一些常需要更改的值，設定為變數，並在批次檔的開頭，
規劃一個區域去編輯這些變數。

<mark>2</mark> 透過上一節學到的技巧，製作一張等高線圖底圖。

<mark>3</mark> 呼叫AA'線段經緯度，畫出線及加上註解。

<mark>4</mark> 呼叫BB'線段經緯度，畫出線及加上註解。

<mark>5</mark> 當在製作小區域地圖時，往往需要利用全區域的小張地圖來框繪出小區域的範圍。

<mark>6</mark> 製作AA'剖面:
* `project`將表格式資料投影到一條線上、大圓上、別的座標系上，此區只介紹投影至線上。
  * `-C`起始點座標
  * `-E`結束點座標
  * `-F`輸出的選量，輸出可選xyzpqrs(默認值)，代表X、Y、Z軸(以度為單位)；如果搭配使用-G，
  輸出成rsp(以公里為單位)
  * `-G`取樣距離
  * `-Q`地圖的單位，轉換成KM
* `grdtrack`對網格檔做指定位置的取樣
  * `-G`被取樣的網格檔
* 透過`project`和`grdtrack`搭配使用，將資料(x軸 y軸 距離 高度)輸出成暫存檔(tmp)。
* `gmtinfo`從表格資料中抓取訊息。
  * `-A`當有多個檔案的使用:
    * **-Aa**輸出全檔案的範圍
    * **-Af**每個檔案分開輸出範圍
    * **-As**當檔案屬於多重區塊檔案時，輸出每個區塊的範圍
  * `-C`輸出最大最小值，配合`-o`來指定輸出的欄位。
  * `-D`配合`-I`修改輸出的範圍
  * `-E`輸出最大或最小值:
    * **i**最小值；**I**絕對值後的最小值
    * **h**最大值；**H**絕對值後的最大值
  * `-I`類似四捨五入的方式取`-R`需要的範圍，給定x軸/y軸取捨的標準，1表示個位數，10表示10位數等等。
  * `-i`選擇輸入的欄位，0表示第一欄
  * `-o`選擇輸出的欄位，0表示第一欄
* 透過`gmtinfo`輸出範圍訊息至暫存檔(tmp1)，接著使用`set /p pr=<tmp1`將範圍訊息設為變數**pr**使用。
* `sed`資料處理工具，詳細介紹請參考[鳥哥的Linux私房菜](http://linux.vbird.org/linux_basic/0330regularex.php#sed)。
  * **-i**: 直接修改讀取的檔案內容
  * **a**: 插入字串在目前的下一行
  * **i**: 插入字串在目前的上一行**$**符號表示行尾，
  以及最後一行中的*符號，用來表示任意一個字元與重覆字元，
  都可以從鳥哥對正規表示法(Regular Expression)的介紹中學習。
* `--FONT_TITLE`改變標題的文字屬性

<mark>7</mark> 同6，換成BB`剖面。

首先AA'剖面切過中央山脈、花東縱谷、海岸山脈，從高層剖面可以清楚地看出三個不同的區域，你也可以嘗試在圖上，
利用`pstext`加上文字做說明，在約8km處，有一個凹陷處，從等高線來判識，應該是一河谷地形(木瓜溪)。
另一條BB`剖面線是做為對比，展示一般山區的地形。

在一開始設立一個輸入區域，可以方便你做更改，以這範例來說，如果我想換切別條剖面線，
只要在一開始更改經緯度數值，就可以展示出不同的高程剖面，可以自己玩看看。

`sed`的使用是為了讓剖面高程的多邊形關閉，以方便著色。關於`sed`以及linux其他指令在windows上如何使用，
可[參考5-5](projection.md#m5.5)，編者另有安裝<mark>Cygwin</mark>。

## 7.6 習題
玉山為東亞第一高峰，其海拔3952公尺，其景色優美、氣勢磅礡，吸引大量登山客前往。利用維基百科玉山主峰以及其他
四個至高點(北峰、東峰、南峰、西峰)，來繪製玉山區域的等高線圖，以及主峰到其餘四峰的高度剖面。

[玉山區域網格檔](dat/yuShan.grd)的製作可參考7-3的方式，或者直接使用前面連結下載。

完成圖如下:
<p align="center">
  <img src="fig/7_6_yuShan_1.png"/>
</p>

## 7.7 參考批次檔
列出本章節使用的批次檔，供讀者參考使用，檔案路經可能會有些許不同，再自行修改。
* [7_3_grd_intro](bat/7_3_grd_intro.bat)
* [7_4_east_rift_valley](bat/7_4_east_rift_valley.bat)
* [7_5_elevation_profile](bat/7_5_elevation_profile.bat)
* [7_6_yuShan](bat/7_6_yuShan.bat)

---

[上一章](/xy_figure.md) -- [下一章](/topography_cpt.md)
