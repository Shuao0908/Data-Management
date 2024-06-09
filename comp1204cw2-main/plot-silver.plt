set terminal png
set output "silver-price-data.png"
set datafile separator ","
set title "Price of Silver change in 10 Days"
set xlabel "Datetime"
set xdata time
set timefmt '%Y-%m-%d %H:%M:%S'
set format x '%Y-%m-%d %H:%M:%S'
set xrange ['2023-04-26 00:00:00':'2023-05-07 00:00:00']
set xtics rotate
set ylabel "Price per Ounce (GBP)"
set yrange ['23':'27']
#set autoscale y
set style line 1 linecolor rgb '#0060ad' linetype 1 linewidth 100 pointtype 7 pointsize 1.5
plot "silver.csv" using 1:2 t "Silver" w linespoints
