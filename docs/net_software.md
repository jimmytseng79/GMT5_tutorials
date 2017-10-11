
### 目錄
1. [總覽](/index.md)
2. [GMT介紹及安裝](/intro_install.md)
3. [網路資源及配套軟體](/net_software.md)
4. [第零章]: 基本概念及參考資源(/basic_resource.md)
5. [第一章: 製作底圖(投影法)](/projection.md)


## 3. 網路資源及配套軟體

本節將分為兩個部份來介紹，包含網路資料庫、程式碼編輯器及繪圖軟體。
首先在製作圖像時，除了研究上所產出的資料之外，往往需要其他資訊來搭配，像是雨量、河川、地形等，
第一部份將介紹台灣及國際的一些資料庫。
而第二部份則推薦幾款程式碼編輯器及繪圖軟體，GMT仰賴指令輸入的環境，有個好的編輯器將可以事半功倍。
最後，當GMT繪圖完之後，我們要利用什麼軟體來看圖，又有哪些繪圖軟體可以支援PS的修圖，將會在本章介紹。

## 3.1 網路資料庫

### 台灣
* [大氣水文資料庫](https://dbahr.narlabs.org.tw): 提供雨量、氣溫、風速等大氣及水文相關資料
* [地球物理資料庫](http://gdms.cwb.gov.tw/index.php): 提供強震儀、寬頻地震儀、GPS等地物相關資料
* 地理資料庫:
  * [地理資訊倉儲中心](http://gic.wra.gov.tw/gic/homepage/index.aspx): 提供流域、地層下陷等資料
  * [交通網路資訊倉儲系統](https://gist.motc.gov.tw): 提供台鐵、高鐵、公路等資料
* [政府資料開放平台](https://data.gov.tw/): 包羅萬象的政府公開資訊

### 國際
* [EarthExplorer](https://earthexplorer.usgs.gov): 由USGS(美國地質調查所)管理，提供全球數值地形資料
* [ETOPO1](https://www.ngdc.noaa.gov/mgg/global/): 由NOAA(美國國家海洋和大氣管理局)管理，提供全球海底地形資料
* [GIS TEMP](https://data.giss.nasa.gov/gistemp/): 由NASA(美國太空總署)管理，提供全球氣溫資料

如何找尋這些資源，及利用這些公開的資訊來輔助你的研究，是非常重要的能力。往後的章節中，
如有利用到這些資料庫的資料時，將會詳細的介紹(從下載->轉檔->製圖)。

## 3.2 配套軟體

### 程式碼編輯器
* [Atom](https://atom.io): 由GitHub開發的編輯器，支援多種程式語言highlight，開放原始碼，
可自由製作套件、模組，各平台都可使用。開啟[Power Mode](https://atom.io/packages/activate-power-mode)，
在編碼的同時，享受打擊鍵盤的暢快感!
* [Sublime Text](https://www.sublimetext.com/): 非常流行且強大的編輯器，支援各平台，
擁有很多的使用者提供的模組可供下載，來符合你所喜歡的編碼環境，雖為付費軟體，但終生提供免費試用。
* [Gedit](https://wiki.gnome.org/Apps/Gedit): 本來是為GNOME桌面環境(如 Ubuntu)製作的輕量級文字編輯器，
特點為簡單、易用，並支援語法標示模式，目前更可安裝於所有的作業系統。
* [UltraEdit](https://www.ultraedit.com/): 為付費軟體，適用於各作業系統，在大文件讀取上其速度較前三者都快，
內建列塊模式編輯、語法加亮、16進位編輯等功能。

### 看圖及繪圖軟體
* <mark>看圖</mark>[Ghostscript系列](http://pages.cs.wisc.edu/~ghost/): 為最主流開啟PS檔的自由軟體，
在Windows系統下，需先安裝對應版本的Ghostscript，在安裝GSview，即可開啟PS檔，Linux及MAC則可直接在輸入指令gv開啟。
* <mark>看圖</mark>[Evince](https://wiki.gnome.org/Apps/Evince): 許多Linux發行板默認安裝的文件瀏覽器，
可直接開啟PS檔，目前只支援到Windows 7。
* <mark>繪圖</mark>[CorelDRAW](https://www.coreldraw.com/tw/): 功能非常強大的商用向量檔處理軟體，目前僅支援Windows系統。
* <mark>繪圖</mark>[Adobe Illustrator](http://www.adobe.com/products/illustrator.html): 另一個著名大公司的商用繪圖軟體，
提供MAC及Windows版本。
* <mark>繪圖</mark>[Inkscape](https://inkscape.org/en/): 在Linux平台上的免費繪圖軟體，支援多種檔案格式，
功能雖不比前兩者繪圖軟體，但不失唯一個選擇。


---

[上一章](/intro_install.md) -- [下一章](/basic_resource.md)
