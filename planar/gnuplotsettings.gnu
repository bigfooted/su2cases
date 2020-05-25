set term x11 enhanced font ",14" background rgb 'white'
# data in the file is separated by a comma
set datafile separator ","
# ignore first line because it is a header
set key autotitle columnhead
#set xrange [5:100]
#set autoscale xmax
set yrange [-12:-2.0]

set xlabel "iterations" font ",14"
set ylabel "residual" font ",14"

set xtics font ",14"

set style line 1 lw 2 lt 1
set style line 2 lw 2 lt 2
set style line 3 lw 2 lt 3
set style line 4 lw 2 lt 4
set style line 5 lw 2 lt 5
set style line 6 lw 2 lt 6
set style line 7 lw 2 lt 7
set style line 8 lw 2 lt 8
set style line 9 lw 2 lt 9
set style line 10 lw 2 lt 10
plot "history.csv" using 1 with lines ls 1,\
     "history.csv" using 2 with lines ls 2,\
     "history.csv" using 3 with lines ls 3,\
     "history.csv" using 4 with lines ls 4,\
     "history.csv" using 5 with lines ls 5,\
     "history.csv" using 6 with lines ls 6,\
     "history.csv" using 7 with lines ls 7,\
     "history.csv" using 8 with lines ls 8,\
     "history.csv" using 9 with lines ls 9,\
     "history.csv" using 10 with lines ls 10
pause 1
reread
