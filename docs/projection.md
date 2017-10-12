
### 目錄
1. [總覽](/index.md)
2. [GMT介紹及安裝](/intro_install.md)
3. [網路資源及配套軟體](/net_software.md)
4. [第零章: 基本概念及默認值](/basic_defaults.md)
5. [第一章: 製作地圖(地理投影法)](/projection.md)

---

## 5. 投影法
GMT在投影法方面，分成兩部份，如下圖，一部份是地理投影法，另一部分是其他投影法，

<p align="center">
  <img src="fig/5_GMT_-J.png"/>
</p>

本章節將主要介紹地理投影法，其中又分成四個子部份，分別是:

* 圓柱形投影(Cylindrical Projection): 因其圓柱體與地球弧面相切在赤道，相切處較為真實，
**多用於繪製低緯度或是赤道附近的國家**。
* 圓錐形投影(Conical Projection): 因標準緯度線相切在中緯度，**適合繪製中緯度的國家**，像是中國、美國。
* 方位投影(Azimuthal Projection): 將球投影到假設的中心點上，可以**正確顯示中心點與世界各地的實際距離**。
* 主題式投影(Thematic Projection): 為一些目的而設計的投影方式，例如莫爾威等積投影法(Mollweide Projection)，
因其等面積，常用於畫世界人口分佈圖，又例如羅賓森投影法(Robinson Projection)，綜合等角、等積投影的特性，
使投影結果不會變形太嚴重，常用於繪製世界地圖。

## 5.1 目的

本章將學習如何繪製麥卡托投影法(Mercator Projection)、蘭伯特正形圓錐投影(Lambert Conic conformal Projection)、
等距方位投影(Azimuthal Equidistant Projection)以及羅賓森投影法。將依序利用這四種繪製台灣、美國、
桃園機場的航線圖以及世界行政分區地圖。


## 5.2 學習的指令與概念

* `pscoast`: 繪製海岸線
* `gmtset`: GMT地圖參數
* `psxy`: 繪製線、多邊形、符號
* GMT共用選項: `-B`、`-J`、`-K`、`-O`、`-P`、`-R`
* 不同投影法的應用
* `psconvert`: 圖檔的輸出

## 5.3 麥卡托投影
首先可以從Google Map或是Google Earth抓出台灣的經緯度範圍，

* Google Map:在選定的點上按右鍵，點選「這是哪裡?」(What's here?)，底下就會出現該點的經緯度。
* Google Earth: 滑鼠移至目標點，即可從下方讀取到該點的經緯度。使用Google Earth的時後，
請注意下方經緯度的表示方式，請至上方功能列中，點選工具->選項，在顯示經緯度的選項中，
勾選十進制度小數(decimal)。

使用十進制度小數的格式是由於數學計算上的方面以及GMT預設採用的座標表示法，關於經緯度表示格式之間的轉換關係，
可以參考[WIKI百科](https://en.wikipedia.org/wiki/Geographic_coordinate_conversion)。
請開啟命令提式字元(cmd.exe)或是終端機(terminal)，開啟方式可[參考4-1](basic_defaults.md#m4.1)，
接著輸入下方指令:
```shell
  gmt pscoast
```
會看到一連串關於`pscoast`的說明，如果你對各選項的意思已經了解，可以透過:
```shell
  gmt pscoast -
```
你將只看到選項用法出現在影幕上。通常GMT指令的語法如下:
```shell
  gmt 模組 (輸入檔) [-選項1 -選項2 -選項3 ...] > 輸出檔名.ps
```
簡單來說，先選定你要用的模組，給定輸入的資料，配合該模組底下的選項，來達到你要繪製的圖形，
而<mark>-</mark>開頭會被GMT視作選項，沒有<mark>-</mark>開頭則被當做資料，所以其先後順序沒差，
不過為養成好習慣，建議按照下面的範例來輸入每一行指令。
```shell
  # 第一行
  gmt psxy (輸入檔) -J -R [-選項1 -選項2 ...] -K  > 輸出檔名.ps
  # 中間各行
  gmt psxy (輸入檔) -J -R [-選項1 -選項2 ...] -K -O >> 輸出檔名.ps
                            .  
                            .  
                            .
  # 最後一行
  gmt psxy (輸入檔) -J -R [-選項1 -選項2 ...] -O >> 輸出檔名.ps
```
這樣的好處是，在debug時候，可以快速發現自己遺漏了哪個部份，而<mark>></mark>及<mark>>></mark>
符號為輸出導向的符號，分別是「取代」與「累加」。

`pscoast`屬於比較特殊的模組，它可以用來畫海岸線、國界、河流等等的資訊，如果你在安裝GMT時有特別注意的話
你會發現在安裝GMT時，一同安裝的<mark>GSHHG</mark>資料庫，裡面包含上述的資訊，而`pscoast`會去調用此資料庫的資料，
因此不需要給定輸入檔，只需透過選項來調用需要的資訊。接下來，我們來看會用到的選項有哪些，中括號[]表示可選選項，
剩下的是必選選項。

* `-R`西邊界經度/東邊界經度/南邊界緯度/北邊界緯度。
* `-J`投影法(一個英文字母代碼)[中心點經度]/[中心點緯度]/規模(或是寬度)。
  * 當英文字母為小寫時，其大小設定為規模，表示每一度的寬度，或是用1:5000表示；
  * 字母為大寫時，表示整張圖的寬度。
  * GMT5的寬度預設值是公分(c)，如果要換單位，方式如`-JM6i`，變成圖的寬度設定為6英吋(inch)。
* `-S`海洋的顏色。在GMT中顏色的輸入有很多種，常見的有三種，以藍色為例，
  * Hex Color，十六進位色碼(#0000FF)
  * RGB Color，十進位制色碼(0/0/255)
  * 英文單字(blue)
  * 英文單字與RGB色碼之間的對照表，請[參考4-4顏色RGB對照表](basic_defaults.md#m4.4c)。
* `-W`寬度,顏色,樣式。

選定好的範圍是119.0/123.0/21.5/26.0，預定地圖的寬度為15公分，海洋顏色為藍色，海岸線的寬度是1公分，
顏色及樣式則採用預設值黑色及實線，指令如下:
```shell
  gmt pscoast -R119.0/122.5/21.5/26.0 -JM18 -S0/0/255 -W1 > 5_3_taiwan.ps
```
來看看結果的圖長什麼樣。
<p align="center">
  <img src="fig/5_3_taiwan_1.png" width="702" height="496"/>
</p>
在預設紙張大小為A4的情況下，看到台灣北部並沒有被涵蓋在A4的紙張上，是什麼原因呢？
原來是因為GMT預設紙張方向是橫向(Landscape)，如果要改成縱向(Portrait)，需要加上`-P`這個選項。
再來是這海岸線的解析度也太粗糙了吧！我們可以透過`-D`這個選項來改善這問題，其解析成度分別是
詳細(<mark>f</mark>ull)、高度(<mark>h</mark>igh)、中度(<mark>i</mark>ntermediate)、
低度(<mark>l</mark>ow)、粗糙(<mark>c</mark>rude)，海岸線的解析度預設值是低度(l)，
也可以透過自動(<mark>a</mark>uto)，依照地圖尺寸來決定海岸線的解析度。
接著陸地是白色，似乎有點單調，來試看看用`-G`英文單字，來更改陸地的顏色，
於是乎將指令改寫如下:
```shell
gmt pscoast -R119.0/122.5/21.5/26.0 -JM18 -S0/0/255 -Gspringgreen2 -W1 -Df -P > 5_3_taiwan.ps
```
<p align="center">
  <img src="fig/5_3_taiwan_2.png" width="496" height="702"/>
</p>
看起來，這圖已經有點起色了，但好像還缺少點什麼，例如地圖比例尺(map scale)、
地圖方向標(map directional rose)、座標框架(map boundary frame and axes attributes)等等，
這些我們將在下一節提到。

## 5.4 蘭伯特正形圓錐投影


---

[上一章](/basic_defaults.md) -- [下一章](/projection.md)