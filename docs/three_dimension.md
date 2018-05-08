
# 三維空間視圖

---

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
13. [第九章: 三維空間圖](/three_dimension.md)

---

## 13. 三維空間視圖
在統計圖表中，除了之前介紹的折線圖、點散佈圖等，還有一些是平常生活中也常會使用到的，
本章將依序介紹GMT是如何繪製直方圖、圓餅圖及三元圖。

## 13.1 目的
本章將學習如何繪製
  1. 多面體圖(Polyhedron)
  2. 柱狀圖(3D Bar Graph)
  3. 三維透視圖(3D Perspective Map)

## 13.2 學習的指令與概念

* `grdview`: 繪製三維透視圖
* `psxyz`: 繪製三維空間中的點、線、面

## 13.3 多面體圖
TODO

使用的資料檔:
- [多面體_點](dat/polyhedron_vertex.gmt)
- [多面體_線](dat/polyhedron_edge.gmt)
- [多面體_面](dat/polyhedron_face.gmt)

成果圖

<p align="center">
  <img src="fig/13_3_3d_polyhedron_1.png"/>
</p>

批次檔
```bash
set ps=13_3_3d_polyhedron.ps

gmt psbasemap -R-15/15/-15/15/-12/12 -JX15 -JZ12 -p220/25 ^
-BWeSnZ -Bxa5f2.5 -By5f2.5 -Bz2 -K > %ps%

rem Tetrahedron 8
gmt gmtconvert polyhedron_face.gmt -S"Tetrahedron 8 |" > tmp
awk "NR %%4 != 1 {print $1-10, $2-10, $3-7.5}" tmp > tmp1
awk "{print $0} NR %%3 == 0 {print "">""""}" tmp1 > tmp2
gmt psxyz tmp2 -R -J -JZ -p -G244/77/137 -K -O >> %ps%
gmt gmtconvert polyhedron_edge.gmt -S"Tetrahedron 8 |" > tmp
awk "NR %%3 != 1 {print $1-10, $2-10, $3-7.5}" tmp > tmp1
awk "{print $0} NR %%2 == 0 {print "">""""}" tmp1 > tmp2
gmt psxyz tmp2 -R -J -JZ -p -W1,187/55/55 -K -O >> %ps%
gmt gmtconvert polyhedron_vertex.gmt -S"Tetrahedron 8 |" > tmp
awk "NR != 1 {print $1-10, $2-10, $3-7.5}" tmp > tmp1
gmt psxyz tmp1 -R -J -JZ -p -Sc.3 -G173/0/0 -K -O >> %ps%

rem Cube 3
gmt gmtconvert polyhedron_face.gmt -S"Cube 3 |" > tmp
awk "NR %%4 != 1 {print $1+5, $2-10, $3-7.5}" tmp > tmp1
awk "{print $0} NR %%3 == 0 {print "">""""}" tmp1 > tmp2
gmt psxyz tmp2 -R -J -JZ -p -G0/216/230 -K -O >> %ps%
gmt gmtconvert polyhedron_edge.gmt -S"Cube 3 |" > tmp
awk "NR %%3 != 1 {print $1+5, $2-10, $3-7.5}" tmp > tmp1
awk "{print $0} NR %%2 == 0 {print "">""""}" tmp1 > tmp2
gmt psxyz tmp2 -R -J -JZ -p -W1,14/145/218 -K -O >> %ps%
gmt gmtconvert polyhedron_vertex.gmt -S"Cube 3 |" > tmp
awk "NR != 1 {print $1+5, $2-10, $3-7.5}" tmp > tmp1
gmt psxyz tmp1 -R -J -JZ -p -Sc.3 -G0/1/138 -K -O >> %ps%

rem Octahedron 3
gmt gmtconvert polyhedron_face.gmt -S"Octahedron 3 |" > tmp
awk "NR %%4 != 1 {print $1-10, $2+5, $3-5}" tmp > tmp1
awk "{print $0} NR %%3 == 0 {print "">""""}" tmp1 > tmp2
gmt psxyz tmp2 -R -J -JZ -p -G48/203/184 -K -O >> %ps%
gmt gmtconvert polyhedron_edge.gmt -S"Octahedron 3 |" > tmp
awk "NR %%3 != 1 {print $1-10, $2+5, $3-5}" tmp > tmp1
awk "{print $0} NR %%2 == 0 {print "">""""}" tmp1 > tmp2
gmt psxyz tmp2 -R -J -JZ -p -W1,30/153/157 -K -O >> %ps%
gmt gmtconvert polyhedron_vertex.gmt -S"Octahedron 3 |" > tmp
awk "NR != 1 {print $1-10, $2+5, $3-5}" tmp > tmp1
gmt psxyz tmp1 -R -J -JZ -p -Sc.3 -G0/93/79 -K -O >> %ps%

rem Rhombic Dodecahedron 3
gmt gmtconvert polyhedron_face.gmt -S"Rhombic Dodecahedron 3 |" > tmp
awk "NR %%4 != 1 {print $1+4, $2+5, $3-5}" tmp > tmp1
awk "{print $0} NR %%3 == 0 {print "">""""}" tmp1 > tmp2
gmt psxyz tmp2 -R -J -JZ -p -G222/241/105 -K -O >> %ps%
gmt gmtconvert polyhedron_edge.gmt -S"Rhombic Dodecahedron 3 |" > tmp
awk "NR %%3 != 1 {print $1+4, $2+5, $3-5}" tmp > tmp1
awk "{print $0} NR %%2 == 0 {print "">""""}" tmp1 > tmp2
gmt psxyz tmp2 -R -J -JZ -p -W1,184/227/10 -K -O >> %ps%
gmt gmtconvert polyhedron_vertex.gmt -S"Rhombic Dodecahedron 3 |" > tmp
awk "NR != 1 {print $1+4, $2+5, $3-5}" tmp > tmp1
gmt psxyz tmp1 -R -J -JZ -p -Sc.3 -G173/201/0 -K -O >> %ps%

rem Icosahedron
gmt gmtconvert polyhedron_face.gmt -S"Icosahedron |" > tmp
awk "NR %%4 != 1 {print $1-10, $2+10, $3+5}" tmp > tmp1
awk "{print $0} NR %%3 == 0 {print "">""""}" tmp1 > tmp2
gmt psxyz tmp2 -R -J -JZ -p -G226/133/211 -K -O >> %ps%
gmt gmtconvert polyhedron_edge.gmt -S"Icosahedron |" > tmp
awk "NR %%3 != 1 {print $1-10, $2+10, $3+5}" tmp > tmp1
awk "{print $0} NR %%2 == 0 {print "">""""}" tmp1 > tmp2
gmt psxyz tmp2 -R -J -JZ -p -W1,205/70/217 -K -O >> %ps%
gmt gmtconvert polyhedron_vertex.gmt -S"Icosahedron |" > tmp
awk "NR != 1 {print $1-10, $2+10, $3+5}" tmp > tmp1
gmt psxyz tmp1 -R -J -JZ -p -Sc.3 -G189/0/219 -K -O >> %ps%

rem Rhombic Triacontahedron
gmt gmtconvert polyhedron_face.gmt -S"Rhombic Triacontahedron |" > tmp
awk "NR %%4 != 1 {print $1+6, $2+10, $3+5}" tmp > tmp1
awk "{print $0} NR %%3 == 0 {print "">""""}" tmp1 > tmp2
gmt psxyz tmp2 -R -J -JZ -p -G70/250/142 -K -O >> %ps%
gmt gmtconvert polyhedron_edge.gmt -S"Rhombic Triacontahedron |" > tmp
awk "NR %%3 != 1 {print $1+6, $2+10, $3+5}" tmp > tmp1
awk "{print $0} NR %%2 == 0 {print "">""""}" tmp1 > tmp2
gmt psxyz tmp2 -R -J -JZ -p -W1,17/186/120 -K -O >> %ps%
gmt gmtconvert polyhedron_vertex.gmt -S"Rhombic Triacontahedron |" > tmp
awk "NR != 1 {print $1+6, $2+10, $3+5}" tmp > tmp1
gmt psxyz tmp1 -R -J -JZ -p -Sc.3 -G0/147/72 -K -O >> %ps%

rem 120 Polyhedron
gmt gmtconvert polyhedron_face.gmt -S"120 Polyhedron |" > tmp
awk "NR %%4 != 1 {print $1+20, $2+8, $3-4}" tmp > tmp1
awk "{print $0} NR %%3 == 0 {print "">""""}" tmp1 > tmp2
gmt psxyz tmp2 -R -J -JZ -p -G205 -N -K -O >> %ps%
gmt gmtconvert polyhedron_edge.gmt -S"120 Polyhedron |" > tmp
awk "NR %%3 != 1 {print $1+20, $2+8, $3-4}" tmp > tmp1
awk "{print $0} NR %%2 == 0 {print "">""""}" tmp1 > tmp2
gmt psxyz tmp2 -R -J -JZ -p -W1,105 -N -K -O >> %ps%
gmt gmtconvert polyhedron_vertex.gmt -S"120 Polyhedron |" > tmp
awk "NR != 1 {print $1+20, $2+8, $3-4}" tmp > tmp1
gmt psxyz tmp1 -R -J -JZ -p -Sc.3 -G5 -N -K -O >> %ps%

rem text
echo 7 -11 Tetrahedron | gmt pstext -R -J -JZ -p180/90 -F+f14p+a28 -K -O >> %ps%
echo 18 -7.5 Cube | gmt pstext -R -J -JZ -p -F+f14p+a10 -N -K -O >> %ps%
echo -1.5 -3.5 Octahedron | gmt pstext -R -J -JZ -p -F+f14p+a55 -N -K -O >> %ps%
echo 9.5 -1 Rhombic Dodecahedron | gmt pstext -R -J -JZ -p -F+f12p+a39 -N -K -O >> %ps%
echo -7.5 5 Icosahedron | gmt pstext -R -J -JZ -p -F+f14p+a10 -N -K -O >> %ps%
echo 4.5 9 Rhombic Triacontahedron | gmt pstext -R -J -JZ -p -F+f12p+a4 -N -K -O >> %ps%
echo 18 3.5 120 Polyhedron | gmt pstext -R -J -JZ -p -F+f14p+a10 -N -K -O >> %ps%

gmt psxy -R -J -JZ -T -O >> %ps%
gmt psconvert %ps% -Tg -A -P
del tmp*
```

學習到的指令:
* `psbasemap`繪製座標系的軸。
  * `-Jz|Z`設定z軸的尺寸，語法如同`-Jx`。
  * `-p`設定觀看圖片的角度，對應的輸入格式<mark>平面角度 俯視角度</mark>。
* `psxyz`繪製三維空間中的點線面。語法與`psxy`一樣，唯一差別在從2維座標點變成輸入3維的座標點。

## 13.4 柱狀圖

## 12.5 三維透視圖

## 13.6 習題

## 13.7 參考批次檔
列出本章節使用的批次檔，供讀者參考使用，檔案路經可能會有些許不同，再自行修改。
* [13_3_3d_polyhedron](bat/13_3_3d_polyhedron.bat)

---

[上一章](/histo_pie_ternary.md) -- [下一章](/3d_dimension.md)
