
### 目錄
1. [總覽](/index.md)
2. [GMT介紹及安裝](/intro_install.md)
3. [網路資源及配套軟體](/net_software.md)
4. [第一章: 製作底圖(投影法)](/projection.md)


## 2.1. GMT簡介

GMT建立於1988年，由Paul Wessel和Walter H.F. Smith共同開發，
其目的是為了提供科學家在資料處理及地圖製作的工具，
而現在所用的全球版本(GMT2)，是在1991年秋天所公開的。
隨著時間的飛逝，GMT儼然成為多數研究人員所必會的一套工具，
特別是在做地球及海洋科學方面的研究者，會透過此工具來做為成果展示。
現今公開的穩定版本是5.4.2，GMT6已在測試階段，
[詳細的版本資訊](https://www.soest.hawaii.edu/gmt/gmt/gmt_releases.html)。


<p align="center">
  <img src="fig/GMT5_Summit_2016.jpg"/>
</p>


目前由圖中五位共同維護。Joaquim Luis、Walter H.F. Smith、Remko Scharroo、
Florian Wobbe 和 Paul Wessel。


## 2.2 為什麼使用GMT?
大多數科學家的研究流程，取得原始資料->分析計算->圖象化，
為了期刊發表、提交計畫、簡報等，要將成果簡要地呈現在圖象上，
過去需要花費大量的時間與金錢來製圖，隨著電腦科學的演進，
GMT作為免費、開源的製圖軟體，將大幅底減少這些花費。
在上手難度上，因其為仰賴指令輸入來製圖，
較GIS (geographic information system)系列軟體難，
但其快速的資料處理、批次處理、完全免費的特點，使其擁有一群死忠的使用者。


<p align="center">
  <img src="fig/map_geoip_all.png"/>
</p>


圖為GMT全球的下載量。

另外GMT遵循UNIX模組化的設計思想，將繪圖及數據處理分隔到不同的模組下，
各模組互相獨立，在更新或維護上較為容易，如果你做為一個程式開發者，
想針對某功能進行改良，將大幅減少開發時間，也可以將這功能帶入到其他的軟體中。

GMT輸出的圖檔格式為.PS格式(PostScript)，PS格式是向量圖片格式，有別於圖層格式，
向量格式除支援高品質圖檔輸出，其各物件可以任意放大縮小而不失真，
在轉換其他圖檔格式，也十分方便。GMT製圖工具非常推薦你也學習。


## 2.3 GMT安裝
GMT是跨平台的軟體，可以在Linux、Windows及MAC下運行，但推薦在Linux使用GMT，原因如下:

* GMT是在Linux下開發在移植到Windows，所以Windows版本會有相對多的Bug
* Linux自帶的數據處理工具: `gawk`、`cut`、`paste`等

GMT的安裝已經非常人性化了，官網也提供個平台的安裝教學，
而其安裝檔的連結則放在[下載頁面](http://gmt.soest.hawaii.edu/projects/gmt/wiki/Download)，
這邊簡單介紹各版本的安裝方式:

* Windows: 透過`.exe`檔安裝
* Linux: 透過`apt-get`或`.tar`檔安裝

```shell
      # by apt-get
      sudo apt-get install gmt gmt-dcw gmt-gshhg
      
      # by source
      set (CMAKE_INSTALL_PREFIX /opt/gmt)
      set (GSHHG_ROOT <path to gshhg>)
      set (DCW_ROOT <path to dcw>)
      
      cd <path to>/gmt5-dev
      mkdir build
      cd build
      cmake ..
      make
      make install
```

* MAC: 透過`.dmg`檔安裝

上面指令欄提到的**dcw**及**gshhg**，內容為一些常用的地理資料，一樣放在下載頁面中，
你需要先下載且指定檔案位置(Window可在安裝選項中勾選)，以下是**dcw**及**gshhg**的簡介:

* <mark>DCW</mark>(**Digital Chart of the World**): 提供一些基本的向量形式資料，像是國界、
人口密集地、道路、水文資料、地標、植被等等。
* <mark>GSHHG</mark>(**Global Self-consistent, Hierarchical, High-resolution Geography**): 
提供數種解析度的向量形式資料，像是海岸線、河湖水系、國界與州界等等。

---

[上一章](/index.md) -- [下一章](/net_software.md)
