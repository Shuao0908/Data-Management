#!/bin/bash
cd /home/admin/Documents/Scripts/comp1204cw2

if(curl -I https://www.jmbullion.com/1-oz-gold-bar/ 2>&1 | grep -w "403|404|500|502|503")
then
	echo "jmbullion is down"
else
	echo "Getting Gold Price Data From JMBULLION websites"
	curl https://www.jmbullion.com/1-oz-gold-bar/ > spot_gold.html

	gold_price=$(cat spot_gold.html | grep "Gold Ask" | cut -d'>' -f7 | sed 's/[^.0-9]*//g' )

	dt=$(date +%Y-%m-%d)
	Time=$(date "+%H:%M:%S%p")

	echo "$dt $Time, Ounce, Gold, GBP, $gold_price" > material.txt
	
	echo "Getting Silver Price Data From JMBULLION websites"
	curl https://www.jmbullion.com/1-oz-gold-bar/ > spot_silver.html
	
	silver_price=$(cat spot_silver.html | grep "Silver Ask" | cut -d'>' -f7 | sed 's/[^.0-9]*//g' )

	echo "$dt $Time, Ounce, Silver, GBP, $silver_price" >> material.txt

	echo "Getting Platinum Price Data From JMBULLION websites"
	curl https://www.jmbullion.com/1-oz-gold-bar/ > spot_platinum.html

	platinum_price=$(cat spot_platinum.html | grep "Platinum Ask" | cut -d'>' -f7 | sed 's/[^.0-9]*//g' )
	echo "$dt $Time, Ounce, Platinum, GBP, $platinum_price" >> material.txt

	echo "Getting Palladium Price Data From JMBULLION websites"
	curl https://www.jmbullion.com/1-oz-gold-bar/ > spot_palladium.html

	palladium_price=$(cat spot_palladium.html | grep "Palladium Ask" | cut -d'>' -f7 | sed 's/[^.0-9]*//g' 	)

	echo "$dt $Time, Ounce, Palladium, GBP, $palladium_price" >> material.txt

	cat material.txt >> material-list.csv
	sed -i '/^$/d' material-list.csv
	cat material.txt

	rm *.html
fi
