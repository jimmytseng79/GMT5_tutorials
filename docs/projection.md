
### 目錄
1. [總覽](/index.md)
2. [GMT介紹及安裝](/intro_install.md)
3. [網路資源及配套軟體](/net_software.md)
4. [第零章: 基本概念及默認值](/basic_defaults.md)
5. [第一章: 製作地圖(投影法)](/projection.md)

## 5. 投影法
GMT在投影法方面，分成兩部份，如下圖，一部份是地理投影法，這部份又分成四個子部份，分別是:

<p align="center">
  <img src="fig/5_GMT_-J.png"/>
</p>

* 圓柱形投影(Cylindrical Projection): 因其圓柱體與地球弧面相切在赤道，相切處較為真實，
**多用於繪製低緯度或是赤道附近的國家**。
* 圓錐形投影(Conical Projection): 因標準緯度線相切在中緯度，**適合繪製中緯度的國家**，像是中國、美國。
* 方位投影(Azimuthal Projection): 將球投影到假設的中心點上，可以**正確顯示中心點與世界各地的實際距離**。
* 主題式投影(Thematic Projection): 為一些目的而設計的投影方式，例如莫爾威等積投影法(Mollweide Projection)，
因其等面積，常用於畫世界人口分佈圖，又例如羅賓森投影法(Robinson Projection)，綜合等角、等積投影的特性，
使投影結果不會變形太嚴重，常用於繪製世界地圖。

---

[上一章](/basic_defaults.md) -- [下一章](/projection.md)