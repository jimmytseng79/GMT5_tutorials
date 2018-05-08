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
