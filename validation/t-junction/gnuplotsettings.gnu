set border lw 2
# set the font and fontsize for the tic marks
set tics scale 2 font "Helvetica,12"
# set the font and fontsize for the key
set key font "Helvetica,12"
#set xrange [0:100]
set autoscale xmax
#set yrange [-6:-3]
# sets the title of the plot using the first line, this will also tell gnuplot that the first line is not data
set datafile separator ","
set key autotitle columnhead
# set the labels for the axes and the font and font size
set xlabel "iterations" font "Helvetica,14"
set ylabel "residual" font "Helvetica,14"
# set the thickness for the axes lines
#set xzeroaxis linewidth 2
# we use "every ::5" to skip the first 5 iterations because these residuals are sometimes very small and determine the axes ranges
plot "history.csv" every ::5 using 1:17 with lines lw 2,\
     "history.csv" every ::5 using 1:18 with lines lw 2,\
     "history.csv" every ::5 using 1:19 with lines lw 2,\
     "history.csv" every ::5 using 1:20 with lines lw 2,\
     "history.csv" every ::5 using 1:21 with lines lw 2,\
     "history.csv" every ::5 using 1:22 with lines lw 2
pause 1
reread
