set terminal png
set output "gold-vs-palladium-data.png"
set datafile separator ","
set title "Price of Gold and Palladium change in 10 Days"
set xlabel "Datetime"
set xdata time
set timefmt '%Y-%m-%d %H:%M:%S'
set format x '%Y-%m-%d %H:%M:%S'
set xrange ['2023-04-26 00:00:00':'2023-05-07 00:00:00']
set xtics rotate
set ylabel "Price per Ounce (GBP)"
set yrange ['1400':'2200']
#set autoscale y
set style line 1 linecolor rgb '#0060ad' linetype 1 linewidth 100 pointtype 7 pointsize 1.5
plot "gold.csv" using 1:2 t "Gold" w linespoints, "palladium.csv" using 1:2 t "Palladium" w linespoints
