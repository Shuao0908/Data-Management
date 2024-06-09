#!/bin/bash
cd /home/admin/Documents/Scripts/Gold

echo "Getting Gold Price Data From JMBULLION websites"
curl -s https://www.jmbullion.com/1-oz-gold-bar/ > spot_gold.html

gold_price=$(cat spot_gold.html | grep "Gold Ask" | cut -d'>' -f7 | sed 's/[^.0-9]*//g' )

dt=$(date +%Y-%m-%d)
Time=$(date "+%H:%M:%S%p")

echo "$dt $Time, Ounce, Gold, GBP, $gold_price" > material_gold.txt

$(/opt/lampp/bin/mysql -u root -e "use cw2_material_db; INSERT INTO material (recorded_date, weight, material_name, dollar_type, material_price) VALUES ('$dt $Time', 'Ounce', 'Gold', 'GBP', '$gold_price')")

cat material_gold.txt

echo "Getting Silver Price Data From JMBULLION websites"
curl -s https://www.jmbullion.com/1-oz-gold-bar/ > spot_silver.html
silver_price=$(cat spot_silver.html | grep "Silver Ask" | cut -d'>' -f7 | sed 's/[^.0-9]*//g' )

echo "$dt $Time, Ounce, Silver, GBP, $silver_price" > material_silver.txt
$(/opt/lampp/bin/mysql -u root -e "use cw2_material_db; INSERT INTO material (recorded_date, weight, material_name, dollar_type, material_price) VALUES ('$dt $Time', 'Ounce','Silver', 'GBP','$silver_price')")

cat material_silver.txt

echo "Getting Platinum Price Data From JMBULLION websites"
curl -s https://www.jmbullion.com/1-oz-gold-bar/ > spot_platinum.html
platinum_price=$(cat spot_platinum.html | grep "Platinum Ask" | cut -d'>' -f7 | sed 's/[^.0-9]*//g' )
echo "$dt $Time, Ounce, Platinum, GBP, $platinum_price" > material_platinum.txt
$(/opt/lampp/bin/mysql -u root -e "use cw2_material_db; INSERT INTO material (recorded_date, weight, material_name, dollar_type, material_price) VALUES ('$dt $Time','Ounce','Platinum','GBP','$platinum_price')")

cat material_platinum.txt

echo "Getting Palladium Price Data From JMBULLION websites"
curl -s https://www.jmbullion.com/1-oz-gold-bar/ > spot_palladium.html
palladium_price=$(cat spot_palladium.html | grep "Palladium Ask" | cut -d'>' -f7 | sed 's/[^.0-9]*//g' )

echo "$dt $Time, Ounce, Palladium, GBP, $palladium_price" > material_palladium.txt
$(/opt/lampp/bin/mysql -u root -e "use cw2_material_db; INSERT INTO material (recorded_date, weight, material_name, dollar_type, material_price) VALUES ('$dt $Time','Ounce','Palladium','GBP','$palladium_price')")

cat material_palladium.txt


rm *.html
